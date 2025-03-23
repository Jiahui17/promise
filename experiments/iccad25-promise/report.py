from json import loads
from matplotlib import pyplot as plt
from cycler import cycler
from pathlib import Path
import numpy as np
import pandas as pd
import re

# Define your custom color scheme
my_colors = [
    "#037ACC",
    "#5F55C8",
]

plt.rcParams.update({"font.size": 10})

# Set the color cycle
plt.rc("axes", prop_cycle=cycler("color", my_colors))


benchmark_names = [
    "xls_factorial",
    "xls_iterative_division",
    "xls_iterative_sqrt",
    "xls_simple_loop",
    "dynamatic_bicg",
    "dynamatic_factorial",
    "dynamatic_gaussian",
    "dynamatic_gemver",
    "dynamatic_iterative_division",
    "dynamatic_iterative_sqrt",
    "dynamatic_kernel_2mm",
    "dynamatic_matvec",
    "dynamatic_stencil_2d",
    "dynamatic_simple_loop",
]

benchmark_dir = Path("benchmarks")

INDUCTION_DEPTH = "Induction depth"

LUTS = "fpga_nodes"

SCORR = "SC"
INVARIANT = "IV"
ENCODING = "EN"


def format_benchmark_name(benchmark, delimiter="\n") -> str:
    # del dict_technique["Filename"]
    if "dynamatic_" in benchmark:
        benchmark = benchmark.replace("dynamatic_", "") + delimiter + "(Dynamatic)"
    if "xls_" in benchmark:
        benchmark = benchmark.replace("xls_", "") + delimiter + "(xls)"

    benchmark = benchmark.replace("kernel_", "")
    benchmark = benchmark.replace("_", delimiter)
    return benchmark


def calculate_improvement(df: pd.DataFrame, metric: str):

    reductions = []
    for benchmark_name in benchmark_names:
        df_benchmark = df[df["Benchmark"] == format_benchmark_name(benchmark_name)]

        df_baseline = df_benchmark[
            (df_benchmark[SCORR] == SCORR)
            & (df_benchmark[INVARIANT] == "")
            & (df_benchmark[ENCODING] == "")
        ]

        df_sc_iv_en = df_benchmark[
            (df_benchmark[SCORR] == SCORR)
            & (df_benchmark[INVARIANT] == INVARIANT)
            & (df_benchmark[ENCODING] == ENCODING)
        ]

        reduction = 1 - df_sc_iv_en[metric].values[0] / df_baseline[metric].values[0]

        print(f"- {benchmark_name}: {metric} reduction: {reduction:.2f}")
        reductions.append(reduction)
    print(f"Average {metric} reduction: {np.mean(reductions):.2f}")


def write_xlsx_simple(df: pd.DataFrame, filename: Path) -> None:
    with pd.ExcelWriter(filename, engine="xlsxwriter") as writer:
        df.to_excel(writer, sheet_name="Sheet1")
        workbook = writer.book
        worksheet = writer.sheets["Sheet1"]
        cell_format = workbook.add_format(  # type: ignore
            {"text_wrap": True, "align": "center"}
        )
        worksheet.set_column("A:Z", cell_format=cell_format)

        fn_format = workbook.add_format(  # type: ignore
            {"text_wrap": True, "align": "center", "border": True}
        )


def parse_technique_table() -> None:
    dicts = []
    for benchmark_name in benchmark_names:
        with open(benchmark_dir / benchmark_name / "output" / "promise.log", "r") as f:
            for line in f:
                if line.startswith("[RESULT] "):
                    entry = loads(line.split("[RESULT] ")[1].strip())
                    entry = {
                        "Benchmark": format_benchmark_name(benchmark_name),
                        **entry,
                    }
                    dicts.append(entry)

    df = pd.DataFrame(dicts)
    write_xlsx_simple(df, benchmark_dir / "tbl_resources.xlsx")
    calculate_improvement(df, LUTS)
    calculate_improvement(df, "fpga_ffs")


def parse_runtime_table():
    dicts = []
    for benchmark_name in benchmark_names:
        with open(benchmark_dir / benchmark_name / "output" / "promise.log", "r") as f:
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

                    entry[timer_key] = entry.get(timer_key, 0.0) + timer_value * 1e-3
            dicts.append({"Benchmark": format_benchmark_name(benchmark_name), **entry})

    df = pd.DataFrame(dicts)
    write_xlsx_simple(df, benchmark_dir / "tbl_runtime.xlsx")


def parse_induction_depth():
    induction_depth_benchmarks = [
        "dynamatic_bicg",
        "dynamatic_gaussian",
        "dynamatic_matvec",
    ]

    for benchmark_name in induction_depth_benchmarks:

        designs = []

        with open(
            benchmark_dir
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
                    data = {"Benchmark": format_benchmark_name(benchmark_name), **data}
                    designs.append(data)

        df = pd.DataFrame(designs)
        fig, ax = plt.subplots(figsize=(5 * 1.20, 2 * 1.20))
        ax.set_title(format_benchmark_name(benchmark_name, delimiter=" "))
        ax.set_xscale("log")

        ax.axhline(
            y=float(df[df[SCORR] == ""].iloc[0][LUTS]),
            linestyle="--",
            label="Combinational",
            color="red",
        )

        ymin = df[LUTS].min()
        ymax = df[LUTS].max()
        ax.set_ylim(ymin - 0.3 * (ymax - ymin), ymax + 0.1 * (ymax - ymin))

        # Entries for SC
        data_sc = df[
            (df[SCORR] == SCORR) & (df[INVARIANT] == "") & (df[ENCODING] == "")
        ]

        ax.plot(
            np.array(data_sc[INDUCTION_DEPTH]),
            np.array(data_sc[LUTS]),
            marker="o",
            label="SC",
        )

        # Entries for SC + IN
        data_sc_iv = df[
            (df[SCORR] == SCORR) & (df[INVARIANT] == INVARIANT) & (df[ENCODING] == "")
        ]

        ax.plot(
            np.array(data_sc_iv[INDUCTION_DEPTH]),
            np.array(data_sc_iv[LUTS]),
            marker="o",
            label="SC + IN (ours)",
        )

        ax.grid(True, which="both", linestyle="--", linewidth=1, alpha=0.3)

        if benchmark_name == induction_depth_benchmarks[0]:
            plt.legend(loc="center right")

        fig.savefig(
            benchmark_dir / f"induction_depth_exploration_{benchmark_name}_lut.pdf",
            bbox_inches="tight",
            pad_inches=0,
        )


if __name__ == "__main__":
    parse_induction_depth()
    parse_runtime_table()
    parse_technique_table()
