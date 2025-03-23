set -e
mkdir -p dynamatic_output
"/data/dynamatic/bin/dynamatic-opt" simple.mlir --lower-handshake-to-hw \
  > dynamatic_output/hw.mlir

"/data/dynamatic/bin/export-rtl" dynamatic_output/hw.mlir dynamatic_output \
  "/data/dynamatic/data/rtl-config-verilog.json" \
  --dynamatic-path "/data/dynamatic" --hdl verilog


