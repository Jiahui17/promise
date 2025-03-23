PROMISE_CWD=$(realpath .)

exit_on_failure() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

build_abc() {
    DIR=$1
    [ -d "$DIR/abc" ] && return 0
    git clone git@github.com:berkeley-abc/abc.git $DIR/abc
    exit_on_failure "git clone abc failed"
    cd $DIR/abc
    git checkout ca78f5e6e5308df420ffc5c709e6d37caf97e40b
    CC=g++ make -j8 ABC_USE_PIC=1 libabc.so
    exit_on_failure "ABC build failed"
}

build_yosys() {
    DIR=$1
    [ -d "$DIR/yosys" ] && return 0
    git clone --recurse-submodules git@github.com:YosysHQ/yosys.git $DIR/yosys
    exit_on_failure "git clone yosys failed"
    INSTALL_PATH=$DIR/yosys/install
    mkdir -p $INSTALL_PATH
    cd $DIR/yosys
    git checkout 29cf4a919062fe7b6a6f21b946dbec15a3d2114a
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
  [ -d "$DIR/verilator" ] && return 0
  git clone git@github.com:verilator/verilator.git $DIR/verilator
  cd $DIR/verilator
  git checkout cfbcfd913c9cdc45198707d5476a55992fbe8303

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
