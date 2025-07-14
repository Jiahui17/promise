from pathlib import Path
from pprint import pformat
import re
from typing import List
from sys import stdout
from subprocess import run, PIPE
from sys import argv

pattern_ansi_escape = re.compile(r"\x1B[@-_][0-?]*[ -/]*[@-~]")


def shell(*args, **kwargs):
    stdout.flush()
    return run(*args, **kwargs, check=True)


def enumerate_reachable_states(
    blif_input_file: Path,
    nuXmv_dump_output_file: Path,
    output_dir: Path,
):
    aiger_file = output_dir / "reachability.aig"

    # Run ABC to generate the AIG file
    capture = shell(
        [
            "abc",
            "-c",
            f"read_blif {blif_input_file.resolve()}; \
                st; \
                write_aiger {aiger_file}; \
                ",
        ],
    )

    nuXmv_command_file = output_dir / "nuXmv_command_file"
    with open(nuXmv_command_file, "w") as f:
        f.write(
            f"set on_failure_script_quits; \n"
            f"read_aiger_model -i {aiger_file}; \n"
            f"go; \n"
            f"print_reachable_states -v; \n"
            f"quit; \n"
        )

    capture = shell(
        [
            "nuXmv",
            "-source",
            nuXmv_command_file,
        ],
        stdout=PIPE,
    )

    with open(nuXmv_dump_output_file, "w") as f:
        f.write(pattern_ansi_escape.sub("", str(capture.stdout.decode("ascii"))))


def parse_nuxmv_reachable_states(filename: Path, list_of_latches: List[str]):
    states = []
    current_state = {}
    state_pattern = re.compile(r"^ *------- State +(\d+) ------")
    var_pattern = re.compile(r"^ *_aiger_l(\d+)__ = (TRUE|FALSE)")

    with open(filename, "r") as f:
        for line in f:
            state_match = state_pattern.match(line)
            var_match = var_pattern.match(line)

            if state_match:
                if current_state:
                    states.append(current_state)
                    current_state = {}
            elif var_match:
                var_name = int(var_match.group(1))
                value = var_match.group(2) == "TRUE"
                current_state[list_of_latches[var_name]] = value

        # Append the last state
        if current_state:
            states.append(current_state)

    return states


def add_nuxmv_reachable_states_as_invariant(
    blif_original: Path,
    nuxmv_log: Path,
    blif_with_invariant: Path,
    blif_only_invariant: Path,
):

    list_of_latches = []

    pattern_latch_name = re.compile(r"\.latch\s+\S+\s+(\S+)")
    with open(blif_original, "r") as f:
        for line in f.readlines():
            if line.startswith(".latch"):
                print(line)
                m = pattern_latch_name.search(line)
                assert m
                list_of_latches.append(m.group(1))

    print("List of latches:", pformat(list_of_latches))

    states = parse_nuxmv_reachable_states(nuxmv_log, list_of_latches)

    blif_lines_to_add = [".names " + " ".join(list_of_latches) + " invariant_pin\n"]

    for state in states:
        line = "".join([str(int(state[latch])) for latch in list_of_latches]) + " 1"
        blif_lines_to_add.append(line + "\n")

    with open(blif_original, "r") as f:
        lines_in_original = f.readlines()[:-1]
        lines_in_original += blif_lines_to_add

    lines = ""
    for line in lines_in_original:
        if line.strip().endswith("\\"):
            lines += line.strip()[:-1] + " "
        else:
            lines += line.strip() + "\n"

    with open(blif_with_invariant, "w") as f:
        for line in lines.split("\n"):
            if line.startswith(".outputs"):
                line = line + " property_pin"
            f.write(line + "\n")
        f.write(".names invariant_pin property_pin\n")
        f.write("0 1\n")
        f.write(".end\n")

    with open(blif_only_invariant, "w") as f:
        for line in lines.split("\n"):
            if line.startswith(".outputs"):
                line = ".outputs property_pin\n"
            f.write(line)
        f.write(".names invariant_pin property_pin\n")
        f.write("0 1\n")
        f.write(".end\n")


def run_scorr_with_one_property_pin(
    blif_input_file: Path,
    blif_output_file: Path,
    induction_depth: int,
):

    with open(blif_input_file, "r") as f:
        for line in f:
            line = line.strip()
            if line.startswith(".outputs"):
                property_pin_id = line.split().index("property_pin")
                print(line)
                print(property_pin_id)
                break
        else:
            raise ValueError("No property pin found in the BLIF file.")

    shell(
        [
            "abc",
            "-c",
            f"read_blif {blif_input_file}; \
                st; constr -N 1; \
                scorr -c -v -F {induction_depth}; \
                constr -r; \
                zeropo -N {property_pin_id -1}; \
                removepo -N {property_pin_id -1}; \
                ps; \
                if -K 6; \
                ps; \
                write_blif {blif_output_file}\
            ",
        ]
    )


def main():
    blif_input = Path(argv[1])
    dir_output = Path(argv[2])

    f_nuxmv_log = dir_output / "nuxmv_dump.log"
    f_design_with_invariant = dir_output / "design_with_invariant.blif"
    f_design_only_invariant = dir_output / "design_only_invariant.blif"

    f_optimized_blif = dir_output / "optimized.blif"

    dir_output.mkdir(parents=True, exist_ok=True)

    enumerate_reachable_states(
        blif_input_file=blif_input,
        nuXmv_dump_output_file=f_nuxmv_log,
        output_dir=dir_output,
    )

    add_nuxmv_reachable_states_as_invariant(
        blif_original=blif_input,
        nuxmv_log=f_nuxmv_log,
        blif_with_invariant=f_design_with_invariant,
        blif_only_invariant=f_design_only_invariant,
    )

    run_scorr_with_one_property_pin(
        blif_input_file=f_design_with_invariant,
        blif_output_file=f_optimized_blif,
        induction_depth=10,
    )


if __name__ == "__main__":
    main()
