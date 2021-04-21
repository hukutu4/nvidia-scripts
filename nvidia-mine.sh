#!/bin/bash

pushd `dirname ${0}`

source ./nvidia-env.sh

echo "GTX1080"
set_nvidia_clock 1080 1 125 100 -600


echo "RTX2080"
set_nvidia_clock 2080 1 125 -50 1000

popd
