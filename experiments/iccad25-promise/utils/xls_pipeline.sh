set -e

SOURCE="$1"
KERNEL_NAME="$2"
OUTPUT_DIR="$3"

mkdir -p "$OUTPUT_DIR"

"$XLS_DIR/bazel-bin/xls/dslx/interpreter_main" \
  $SOURCE \
  --alsologtostderr

"$XLS_DIR/bazel-bin/xls/dslx/ir_convert/ir_converter_main" \
  --top="$KERNEL_NAME" \
  --output_file="$OUTPUT_DIR/$KERNEL_NAME.ir" \
  $SOURCE

"$XLS_DIR/bazel-bin/xls/tools/opt_main" \
  --output_path="$OUTPUT_DIR/$KERNEL_NAME.opt.ir" \
  "$OUTPUT_DIR/$KERNEL_NAME.ir"

"$XLS_DIR/bazel-bin/xls/tools/codegen_main" \
  --reset="rst" \
  --delay_model="unit" \
  --output_signature_path="$OUTPUT_DIR/$KERNEL_NAME.sig.proto" \
  --output_verilog_path="$OUTPUT_DIR/$KERNEL_NAME.v" \
  --multi_proc \
  --use_system_verilog=false \
  "$OUTPUT_DIR/$KERNEL_NAME.opt.ir" \
  --clock_period_ps=4000 \
  --materialize_internal_fifos

echo "Generated Verilog $OUTPUT_DIR/$KERNEL_NAME.v"
