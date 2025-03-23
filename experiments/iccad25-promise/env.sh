exit_on_failure() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

export PROJ_ROOT=$(realpath .)

export DYNAMATIC_DIR="/data/dynamatic"

export XLS_DIR="/data/xls"

export PROMISE_ROOT="$PROJ_ROOT/../../"
