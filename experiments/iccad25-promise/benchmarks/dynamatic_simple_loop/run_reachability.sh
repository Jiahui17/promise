PATH="$PATH:/opt/abc"
PATH="$PATH:/opt/nuXmv-2.0.0-Linux/bin"

python3 reachability.py \
  "output/synthesis_result/comb.blif" \
  "output/synthesis_result_reachability"
