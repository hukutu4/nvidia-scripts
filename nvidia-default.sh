#!/bin/bash

pushd `dirname ${0}`

source ./nvidia-env.sh

echo "GTX1080"
set_nvidia_clock 1080 1 250 0 0

echo "RTX2080"
set_nvidia_clock 2080 1 250 0 0

popd
