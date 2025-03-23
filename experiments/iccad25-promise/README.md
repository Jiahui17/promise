# Promise: Property Mining for Sequential Synthesis

These tools can be optionally built: 
- `dynamatic`: C-based HLS tool.
- `xls`: DSL-based hardware compiler.
They are only necessary to generate the benchmarks from their input languages.
We store their compiled output in `benchmarks`.

## Running the ICCAD/IWLS '25 experiments:

This command runs all experiments:

```
$ bash run.sh
```

This command parses the reports and save them as pdfs and xlsxes in
`benchmarks/`

```
$ python3 report.py
```