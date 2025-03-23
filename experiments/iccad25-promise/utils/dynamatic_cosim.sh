set -e

[ -d "$DYNAMATIC_DIR" ]

SOURCE="$1"
KERNEL_NAME="$2"
OUTPUT_DIR=$(realpath "$3")
COSIM_DIR=$(realpath "$4")

# Run cosimulation to make sure that the results are ok
rm -rf "$COSIM_DIR/"

mkdir -p "$COSIM_DIR/"{HDL_SRC,HDL_OUT,C_SRC,C_OUT,INPUT_VECTORS,HLS_VERIFY}

mkdir -p "$COSIM_DIR/C_SRC/dynamatic/"

cp "$DYNAMATIC_DIR/include/dynamatic/Integration.h" \
  "$COSIM_DIR/C_SRC/dynamatic/"

cp "$SOURCE" "$COSIM_DIR/C_SRC"

cp "$DYNAMATIC_DIR/tools/hls-verifier/resources/"*.vhd \
  "$COSIM_DIR/HDL_SRC/"

cp "$DYNAMATIC_DIR/tools/hls-verifier/resources/"modelsim.ini \
  "$COSIM_DIR/HLS_VERIFY/modelsim.ini"

cp "$OUTPUT_DIR/"*.v "$COSIM_DIR/HDL_SRC"

"$DYNAMATIC_DIR/polygeist/llvm-project/build/bin/clang++" \
  "$SOURCE" \
  -D HLS_VERIFICATION \
  -DHLS_VERIFICATION_PATH="$COSIM_DIR" \
  -I "$DYNAMATIC_DIR/include" \
  -Wno-deprecated \
  -o "$COSIM_DIR/HLS_VERIFY/output_gen"

"$COSIM_DIR/HLS_VERIFY/output_gen"

cd "$COSIM_DIR/HLS_VERIFY"

"$DYNAMATIC_DIR/build/bin/hls-verifier" \
  --sim-path="$COSIM_DIR" \
  --kernel-name="$KERNEL_NAME" \
  --handshake-mlir="$OUTPUT_DIR/handshake_export.mlir" \
  > "../report.txt" 
