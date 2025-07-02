PROMISE_CWD=$(realpath .)

exit_on_failure() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

build_abc() {
    DIR=$1
    cd $DIR/abc
    CC=g++ make -j8 ABC_USE_PIC=1 libabc.so
    exit_on_failure "ABC build failed"
}

build_yosys() {
    DIR=$1
    cd $DIR/yosys
    git submodule update --recursive
    make install -j18 ENABLE_LIBYOSYS=1 PREFIX=$INSTALL_PATH
    exit_on_failure "Yosys build failed"
}

build_ric3() {
  DIR=$1
  mkdir -p $DIR/rIC3
  # Install rIC3 from crates:
  cargo install rIC3 --version 1.4.1 --root $DIR/rIC3
  exit_on_failure "rIC3 build failed"
}

build_venv() {
    DIR=$1
    python3 -m venv $DIR/.venv
    source $DIR/.venv/bin/activate
    pip install \
        networkx==3.4.2 \
        bitstring==4.3.0 \
        matplotlib==3.10.1 \
        xlsxwriter==3.2.2 \
        pulp==3.0.2 \
        pandas==2.2.3
}

build_verilator() {
  DIR=$1
  cd $DIR/verilator

  # mkdir -p $DIR/verilator/build && cd $DIR/verilator/build
  # cmake .. && make -j8
  autoconf && ./configure && make -j8
}

EXTERNAL_TOOLS=$(realpath "./ext")

mkdir -p $EXTERNAL_TOOLS

build_yosys $EXTERNAL_TOOLS
build_venv $EXTERNAL_TOOLS
build_abc $EXTERNAL_TOOLS
build_ric3 $EXTERNAL_TOOLS
build_verilator $EXTERNAL_TOOLS

mkdir -p "$PROMISE_CWD/build"
cd "$PROMISE_CWD/build"

cmake .. -G Ninja \
  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ \
  -DCMAKE_BUILD_TYPE=Debug \
  -DYOSYS_ROOT="$PROMISE_CWD/ext/yosys" \
  -DABC_ROOT="$PROMISE_CWD/ext/abc" \

ninja
