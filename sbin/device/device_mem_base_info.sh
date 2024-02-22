#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh
# source /workspace/sbin/common/common-base.sh

mem_info='{}'

function get_mem_info() {
	mem_size_key="mem_size"

	mem_value=$(lshw -short -class memory -quiet | grep "System" | awk '{print $3}')
	# lshw -short -class memory -quiet | grep System | awk '{print $3}'
	# mem_value=32GiB

	mem=$(create_json "$mem_size_key" "$mem_value")
	# create_json mem_size 32GiB

	mem_info=$(jq -n "$mem_info + $mem")

	return 0
}

get_mem_info
echo $mem_info >${1}/sbin/device/mem_data.json
