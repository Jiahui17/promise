# Promise: Property Mining for Sequential Synthesis

Promise is an optimization tool for removing the redundancy in sequential
circuits. Promise relies on the technique described
[here](https://dynamo.ethz.ch/wp-content/uploads/sites/22/2025/06/Xu_IWLS25_Promise_Property_Mining_for_Sequential_Synthesis.pdf)
to generate invariants from simulation traces to aid existing sequential
synthesis algorithms and remove redundant FFs.

## Getting Started

### Installing Dependencies

```
$ sudo apt-get -y \
  build-essential git gtest clang help2man \
  libeigen3-dev ninja-build
```

This project can optionally use `rIC3`. Which requires a [rust
compiler](https://www.rust-lang.org/tools/install). `rIC3` uses some unstable rust features. Therefore, we need to enable the nightly version:

```
$ rustup install nightly
$ rustup override set nightly
```

### Building the Project

```
$ bash build.sh
```

### Testing

To make sure that the project has been correctly built, run the test suite:
```
$ cd build
$ ninja test
```

## Running Promise


```
$ build/bin/promise <top_name> <src1.v>,<src2.v>,<src3.v>
```


## Running the IWLS/ICCAD '25 Experiments

Please refer to the description in `experiments/iccad25-promise`.

## License Notice

Promise is licensed under the [GPL-3.0 license](https://www.gnu.org/licenses/gpl-3.0.en.html).

Promise depends on the following components:
- [Yosys](https://github.com/YosysHQ/yosys) is licensed under the ISC license.
- [ABC](https://github.com/berkeley-abc/abc) is copyrighted by the University of California, Berkeley.
- [Verilator](https://github.com/verilator/verilator) is licensed under the LGPL-3.0 license.
- [rIC3](https://github.com/gipsyh/rIC3) is licensed under the GPL-3.0 license.
