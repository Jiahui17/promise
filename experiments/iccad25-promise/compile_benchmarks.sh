set -e
source env.sh

compile_dynamatic_benchmark () {
  NAME=$1
  BENCHMARK_DIR="compile_benchmarks/dynamatic_$NAME"
  OUTPUT_DIR="benchmarks/dynamatic_$NAME/hdl"
  mkdir -p "$BENCHMARK_DIR/dynamatic_output"
  mkdir -p "$OUTPUT_DIR"

  bash $PROJ_ROOT/utils/dynamatic_pipeline.sh \
    "$BENCHMARK_DIR/$NAME.c" \
    "$NAME" \
    "$BENCHMARK_DIR/dynamatic_output"

  bash $PROJ_ROOT/utils/dynamatic_cosim.sh \
    "$BENCHMARK_DIR/$NAME.c" \
    "$NAME" \
    "$BENCHMARK_DIR/dynamatic_output" \
    "$BENCHMARK_DIR/cosim" \

  # Rename the module in the Promise convention:
  sed -i \
    "s/${NAME}_ip/main/g" \
    "$BENCHMARK_DIR/dynamatic_output/main.v"

  cp "$BENCHMARK_DIR/dynamatic_output"/*.v "$OUTPUT_DIR"
  echo "Generated Dynamatic HDL in \"$OUTPUT_DIR\"."
}

compile_xls_benchmark () {
  NAME=$1
  BENCHMARK_DIR="compile_benchmarks/xls_$NAME"
  OUTPUT_DIR="benchmarks/xls_$NAME/hdl"
  mkdir -p $OUTPUT_DIR
  rm -rf "$BENCHMARK_DIR/xls_output"
  XLS_OUTPUT="$BENCHMARK_DIR/xls_output"
  mkdir -p $XLS_OUTPUT

  KEEP_TEMPS=1 bash $PROJ_ROOT/utils/xls_pipeline.sh \
    "$BENCHMARK_DIR/$NAME.x" \
    "$NAME" \
    "$XLS_OUTPUT"

  sed -i -E 's/\breg ([^()]*);/reg \1 = 0;/g' $BENCHMARK_DIR/xls_output/*.v

  cp $XLS_OUTPUT/*.v $OUTPUT_DIR
  cp $BENCHMARK_DIR/main.v $OUTPUT_DIR
  echo "Generated XLS HDL in \"$XLS_OUTPUT\"."
}

compile_xls_benchmark factorial
compile_xls_benchmark iterative_division
compile_xls_benchmark iterative_sqrt
compile_xls_benchmark simple_loop

compile_dynamatic_benchmark matvec
compile_dynamatic_benchmark bicg
compile_dynamatic_benchmark factorial
compile_dynamatic_benchmark gaussian
compile_dynamatic_benchmark gemver
compile_dynamatic_benchmark iterative_division
compile_dynamatic_benchmark iterative_sqrt
compile_dynamatic_benchmark kernel_2mm
compile_dynamatic_benchmark stencil_2d
