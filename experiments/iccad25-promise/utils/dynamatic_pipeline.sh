
# The pass pipeline of the dynamatic HLS compiler.

set -e

[ -d "$DYNAMATIC_DIR" ]

SOURCE="$1"
KERNEL_NAME="$2"
OUTPUT_DIR=$(realpath "$3")

mkdir -p $OUTPUT_DIR

DYNAMATIC_BIN_DIR=$DYNAMATIC_DIR/build/bin

POLYGEIST_BIN_DIR=$DYNAMATIC_DIR/polygeist/build/bin

"$POLYGEIST_BIN_DIR/cgeist" \
  "$SOURCE" --function="$KERNEL_NAME" \
  -I "$DYNAMATIC_DIR/polygeist/llvm-project/clang/lib/Headers" \
  -I "$DYNAMATIC_DIR/include" \
  -S -O3 --memref-fullrank --raise-scf-to-affine \
  > "$OUTPUT_DIR/affine.mlir"

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/affine.mlir" \
  --allow-unregistered-dialect \
  --remove-polygeist-attributes \
  --func-set-arg-names="source=$SOURCE" \
  --mark-memory-dependencies \
  --lower-affine-to-scf \
  --flatten-memref-row-major --scf-simple-if-to-select \
  --scf-rotate-for-loops \
  > "$OUTPUT_DIR/scf.mlir"

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/scf.mlir" \
  --lower-scf-to-cf \
  > "$OUTPUT_DIR/cf.mlir"

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/cf.mlir" \
  --canonicalize --cse --sccp --symbol-dce \
  --control-flow-sink --loop-invariant-code-motion --canonicalize \
  > "$OUTPUT_DIR/cf_transformed.mlir"

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/cf_transformed.mlir" \
  --arith-reduce-strength="max-adder-depth-mul=1" --push-constants \
  --force-memory-interface="force-mc=true" \
  > "$OUTPUT_DIR/cf_dyn_transformed.mlir" \

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/cf_dyn_transformed.mlir" \
  --lower-cf-to-handshake \
  > "$OUTPUT_DIR/handshake.mlir" \

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/handshake.mlir" \
  --handshake-analyze-lsq-usage \
  --handshake-replace-memory-interfaces \
  --handshake-minimize-cst-width --handshake-optimize-bitwidths \
  --handshake-materialize --handshake-infer-basic-blocks \
  > "$OUTPUT_DIR/handshake_transformed.mlir" \

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/handshake_transformed.mlir" \
  --handshake-set-buffering-properties="version=fpga20" \
  --handshake-place-buffers="algorithm=on-merges timing-models=$DYNAMATIC_DIR/data/components.json" \
  > "$OUTPUT_DIR/handshake_buffered.mlir" \

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/handshake_buffered.mlir" \
  --handshake-canonicalize \
  --handshake-hoist-ext-instances \
  > "$OUTPUT_DIR/handshake_export.mlir"

"$DYNAMATIC_BIN_DIR/dynamatic-opt" \
  "$OUTPUT_DIR/handshake_export.mlir" \
  --lower-handshake-to-hw \
  > "$OUTPUT_DIR/hw.mlir"

"$DYNAMATIC_BIN_DIR/export-rtl" \
  "$OUTPUT_DIR/hw.mlir" \
  "$OUTPUT_DIR" \
  "$DYNAMATIC_DIR/data/rtl-config-verilog.json" \
  --dynamatic-path \
  "$DYNAMATIC_DIR" \
  --hdl verilog

"$DYNAMATIC_BIN_DIR/vivado-ip-adapter" \
  $OUTPUT_DIR/handshake_export.mlir \
  > "$OUTPUT_DIR/main.v"