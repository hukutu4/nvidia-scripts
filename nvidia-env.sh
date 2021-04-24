#!/bin/bash

#https://wiki.archlinux.org/index.php/NVIDIA/Tips_and_tricks
#set -x



set_nvidia_clock() {
	NAME=$1
	PM=$2
	PL=$3
	GO=$4
	MO=$5
	FS=$6

	ID_SMI=`nvidia-smi --list-gpus | grep ${NAME} | awk '{print $2}' | cut -c1`
	ID_SET=`nvidia-settings --query gpus | grep ${NAME} | awk '{print $1}' | cut -c2`

	echo ID_SMI=$ID_SMI, ID_SET=$ID_SET, PERF_MODE=$PM, POWER_LIMIT=$PL, GPU_OFFSET=$GO, MEMORY_OFFSET=$MO, FAN_SPEED=$FS
	if [ -n "${ID_SMI}" ]; then
		sudo nvidia-smi --id=${ID_SMI} --persistence-mode=1
		sudo nvidia-smi --id=${ID_SMI} --power-limit=${PL}
	fi
	if [ -n "${ID_SET}" ]; then	
		echo "mest"
		nvidia-settings -a "[gpu:${ID_SET}]/GPUPowerMizerMode=${PM}"
		nvidia-settings -a "[gpu:${ID_SET}]/GPUGraphicsClockOffsetAllPerformanceLevels=${GO}" -a "[gpu:${ID_SET}]/GPUMemoryTransferRateOffsetAllPerformanceLevels=${MO}"
	#	nvidia-settings -a "[gpu:${ID}]/GPUGraphicsClockOffset[3]=${GO}" -a "[gpu:${ID}]/GPUMemoryTransferRateOffset[3]=${MO}"
		nvidia-settings -a "[gpu:${ID_SET}]/GPUFanControlState=1"
		nvidia-settings -a "[fan:${ID_SET}]/GPUTargetFanSpeed=${FS}"
	fi
}

