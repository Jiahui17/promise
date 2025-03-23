set -e

source env.sh

BENCHMARK_DIR=$(realpath "./benchmarks")

run_technique_comparison() {
  EXPERIMENT_DIR=$(realpath "$BENCHMARK_DIR/$1")
  cd $EXPERIMENT_DIR

  rm -rf "$EXPERIMENT_DIR/output"
  mkdir -p "$EXPERIMENT_DIR/output"

  # Runs the experiment
  # NOTE: It only duplicates stderr to a log file.
  "$PROMISE_ROOT/build/bin/iccad25-promise-techniques" \
    "main" \
    $(printf "%s," hdl/*.v | sed 's/,$/\n/') \
    2> >(tee $EXPERIMENT_DIR/output/promise.log >&2)
}

run_induction_depth_exploration() {
  EXPERIMENT_DIR=$(realpath "$BENCHMARK_DIR/$1")
  cd $EXPERIMENT_DIR

  rm -rf "$EXPERIMENT_DIR/output/induction-depth"
  mkdir -p "$EXPERIMENT_DIR/output/induction-depth"

  # Runs the experiment
  # NOTE: It only duplicates stderr to a log file.
  "$PROMISE_ROOT/build/bin/iccad25-promise-depth" \
    "main" \
    $(printf "%s," hdl/*.v | sed 's/,$/\n/') \
    2> >(tee $EXPERIMENT_DIR/output/induction-depth/promise.log >&2)
}

run_technique_comparison xls_factorial
run_technique_comparison xls_iterative_division
run_technique_comparison xls_iterative_sqrt
run_technique_comparison xls_simple_loop

run_technique_comparison dynamatic_bicg
run_technique_comparison dynamatic_factorial
run_technique_comparison dynamatic_gaussian
run_technique_comparison dynamatic_gemver
run_technique_comparison dynamatic_iterative_division
run_technique_comparison dynamatic_iterative_sqrt
run_technique_comparison dynamatic_kernel_2mm
run_technique_comparison dynamatic_matvec
run_technique_comparison dynamatic_stencil_2d
run_technique_comparison dynamatic_simple_loop

run_induction_depth_exploration dynamatic_matvec
run_induction_depth_exploration dynamatic_gaussian
run_induction_depth_exploration dynamatic_bicg
