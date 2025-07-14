from json import loads
from matplotlib import pyplot as plt
from cycler import cycler
from pathlib import Path
import numpy as np
import pandas as pd
import re

my_colors = [
    "#037ACC",
    "#5F55C8",
]

plt.rcParams.update({"font.size": 10})

# Set the color cycle
plt.rc("axes", prop_cycle=cycler("color", my_colors))

BENCHMARK_NAME_LIST_FULL = [
    "xls_factorial",
    "xls_iterative_division",
    "xls_iterative_sqrt",
    "xls_simple_loop",
    "dynamatic_factorial",
    "dynamatic_iterative_division",
    "dynamatic_iterative_sqrt",
    "dynamatic_simple_loop",
    "dynamatic_matvec",
    "dynamatic_bicg",
    "dynamatic_gaussian",
    "dynamatic_gemver",
    "dynamatic_stencil_2d",
    "dynamatic_kernel_2mm",
]

DIR_BENCHMARKS = Path("benchmarks")

INDUCTION_DEPTH = "Induction depth"

LUTS = "fpga_nodes"

SCORR = "SC"
INVARIANT = "IV"
ENCODING = "EN"


def fmt_benchmark_name_resource_table(name, delimiter="\n") -> str:
    # del dict_technique["Filename"]
    if "dynamatic_" in name:
        name = name.replace("dynamatic_", "") + delimiter + "(Dynamatic)"
    if "xls_" in name:
        name = name.replace("xls_", "") + delimiter + "(xls)"

    name = name.replace("kernel_", "")
    name = name.replace("_", delimiter)
    return name


def fmt_benchmark_name_runtime_table(name, delimiter=" "):
    # del dict_technique["Filename"]
    if "dynamatic_" in name:
        name = name.replace("dynamatic_", "")
    if "xls_" in name:
        name = name.replace("xls_", "")

    name = name.replace("kernel_", "")
    name = name.replace("_", delimiter)
    return name


def calc_avg_improvements(tbl: pd.DataFrame, metric: str):

    reductions = []
    for benchmark_name in BENCHMARK_NAME_LIST_FULL:
        df_benchmark = tbl[
            tbl["Benchmark"] == fmt_benchmark_name_resource_table(benchmark_name)
        ]

        entry_baseline = df_benchmark[
            (df_benchmark[SCORR] == SCORR)
            & (df_benchmark[INVARIANT] == "")
            & (df_benchmark[ENCODING] == "")
        ]

        entry_sc_iv_en = df_benchmark[
            (df_benchmark[SCORR] == SCORR)
            & (df_benchmark[INVARIANT] == INVARIANT)
            & (df_benchmark[ENCODING] == ENCODING)
        ]

        reduction = (
            1 - entry_sc_iv_en[metric].values[0] / entry_baseline[metric].values[0]
        )

        print(f"- {benchmark_name}: {metric} reduction: {reduction:.2f}")
        reductions.append(reduction)
    print(f"Average {metric} reduction: {np.mean(reductions):.2f}")


def write_xlsx_runtime_tbl(tbl: pd.DataFrame, filename: Path) -> None:
    with pd.ExcelWriter(filename, engine="xlsxwriter") as writer:
        tbl.to_excel(writer, sheet_name="Sheet1")
        workbook = writer.book
        worksheet = writer.sheets["Sheet1"]
        cell_format = workbook.add_format(  # type: ignore
            {"text_wrap": True, "align": "center"}
        )
        worksheet.set_column("A:Z", cell_format=cell_format)

        workbook.add_format(  # type: ignore
            {"text_wrap": True, "align": "center", "border": True}
        )


def write_xlsx_resource_tbl(tbl: pd.DataFrame, filename: Path) -> None:
    with pd.ExcelWriter(filename, engine="xlsxwriter") as writer:
        tbl.to_excel(writer, sheet_name="Sheet1")
        workbook = writer.book
        worksheet = writer.sheets["Sheet1"]
        cell_format = workbook.add_format(  # type: ignore
            {"text_wrap": True, "align": "center"}
        )
        worksheet.set_column("A:Z", cell_format=cell_format)

        workbook.add_format(  # type: ignore
            {"text_wrap": True, "align": "center", "border": True}
        )

        # worksheet.merge_range(":".join(footnote_range), footnote, fn_format)
        highlight_format = workbook.add_format(  # type: ignore
            {
                # "bg_color": "#DDDDDD",
                "bold": True,
                "text_wrap": True,
                "align": "center",
                "font_color": "#009E73",
                # "border": True,
            }
        )

        for start_row in range(0, len(tbl), 5):
            for row in range(start_row, start_row + 5):
                for col in range(len(tbl.columns)):
                    if (
                        pd.api.types.is_number(tbl.iloc[row, col])
                        and tbl.iloc[row, col]
                        == tbl.iloc[start_row : start_row + 5, col].min()
                    ):
                        worksheet.write(
                            row + 1, col + 1, tbl.iloc[row, col], highlight_format
                        )


def gen_resource_tbl() -> None:
    dicts = []
    for benchmark_name in BENCHMARK_NAME_LIST_FULL:
        with open(DIR_BENCHMARKS / benchmark_name / "output" / "promise.log", "r") as f:
            for line in f:
                if line.startswith("[RESULT] "):
                    entry = loads(line.split("[RESULT] ")[1].strip())
                    entry = {
                        "Benchmark": fmt_benchmark_name_resource_table(benchmark_name),
                        **entry,
                    }
                    dicts.append(entry)

    df = pd.DataFrame(dicts)
    write_xlsx_resource_tbl(df, DIR_BENCHMARKS / "tbl_resources.xlsx")
    calc_avg_improvements(df, LUTS)
    calc_avg_improvements(df, "fpga_ffs")


def gen_runtime_tbl():
    dicts = []
    for benchmark_name in BENCHMARK_NAME_LIST_FULL:
        with open(DIR_BENCHMARKS / benchmark_name / "output" / "promise.log", "r") as f:
            entry = {}
            for line in f:
                if line.startswith("[TIMER] "):
                    timer_data = line.split("[TIMER] ")[1].strip()
                    timer_key = re.match(r"\[(.*)\]", timer_data)
                    assert timer_key
                    timer_key = timer_key.group(1)
                    timer_value = re.search(r"\] (.*) ms", timer_data)
                    assert timer_value
                    timer_value = float(timer_value.group(1))

                    entry[timer_key] = round(
                        entry.get(timer_key, 0.0) + timer_value * 1e-3, 1
                    )
                if line.startswith("[Iterations] "):
                    timer_data = line.split("[Iterations] ")[1].strip()
                    entry["Iterations"] = int(timer_data) - 1

            dicts.append(
                {"Benchmark": fmt_benchmark_name_runtime_table(benchmark_name), **entry}
            )

    ordered_cols = [
        "Benchmark",
        "Simulation",
        "Proof",
        "Linear equality",
        "Linear inequality",
        "Iterations",
        "Total",
    ]
    df = pd.DataFrame(dicts)
    df = df[ordered_cols]
    write_xlsx_runtime_tbl(df, DIR_BENCHMARKS / "tbl_runtime.xlsx")


def gen_induction_depth_plots():
    induction_depth_benchmarks = [
        "dynamatic_matvec",
        "dynamatic_bicg",
        "dynamatic_gaussian",
    ]

    for benchmark_name in induction_depth_benchmarks:

        designs = []

        with open(
            DIR_BENCHMARKS
            / benchmark_name
            / "output"
            / "induction-depth"
            / "promise.log",
            "r",
        ) as f:
            runtime_data = {}
            for line in f:
                if line.startswith("[RESULT] "):
                    data = loads(line.split("[RESULT] ")[1].strip())
                    data = {
                        "Benchmark": fmt_benchmark_name_resource_table(benchmark_name),
                        **data,
                    }
                    designs.append(data)

        df = pd.DataFrame(designs)
        fig, ax = plt.subplots(figsize=(5 * 1.20, 1.15 * 1.20))
        ax.set_title(fmt_benchmark_name_resource_table(benchmark_name, delimiter=" "))
        ax.set_xscale("log")

        # Baseline: only combinational synthesis
        ax.axhline(
            y=float(df[df[SCORR] == ""].iloc[0][LUTS]),
            linestyle="--",
            label="Combinational",
            color="red",
        )

        ymin = df[LUTS].min()
        ymax = df[LUTS].max()
        ax.set_ylim(ymin - 0.3 * (ymax - ymin), ymax + 0.1 * (ymax - ymin))

        # Baseline: Only sequential synthesis (SCORR)
        tbl_entries_sc = df[
            (df[SCORR] == SCORR) & (df[INVARIANT] == "") & (df[ENCODING] == "")
        ]

        ax.plot(
            np.array(tbl_entries_sc[INDUCTION_DEPTH]),
            np.array(tbl_entries_sc[LUTS]),
            marker="o",
            label="SC",
        )

        # Our result: SC + invariants (IN)
        tbl_entries_sc_iv = df[
            (df[SCORR] == SCORR) & (df[INVARIANT] == INVARIANT) & (df[ENCODING] == "")
        ]

        ax.plot(
            np.array(tbl_entries_sc_iv[INDUCTION_DEPTH]),
            np.array(tbl_entries_sc_iv[LUTS]),
            marker="o",
            label="SC + IN (ours)",
        )

        ax.grid(True, which="both", linestyle="--", linewidth=1, alpha=0.3)

        if benchmark_name == induction_depth_benchmarks[0]:
            plt.legend(loc="center right", ncols=3, bbox_to_anchor=(1.0, 1.35))

        if benchmark_name == induction_depth_benchmarks[-1]:
            ax.set_xlabel("Induction depth")
        ax.set_ylabel("LUTs")

        fig.savefig(
            DIR_BENCHMARKS / f"induction_depth_exploration_{benchmark_name}_lut6.pdf",
            bbox_inches="tight",
            pad_inches=0,
        )


if __name__ == "__main__":
    gen_induction_depth_plots()
    gen_runtime_tbl()
    gen_resource_tbl()
