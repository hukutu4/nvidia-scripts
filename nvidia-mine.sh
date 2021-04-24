#!/bin/bash

pushd `dirname ${0}`

source ./nvidia-env.sh

echo "RTX3080"
set_nvidia_clock 3080 1 270 0 0 100

popd
