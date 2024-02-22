#!/bin/bash
set -X

source ${1}/sbin/common/common-base.sh

mem_info='{}'

function get_mem_info() {
	mem_size_key="mem_size"

	mem_value=$(lshw -short -class memory -quiet | grep "System" | awk '{print $3}')

	mem=$(create_json "$mem_size_key" "$mem_value")

	mem_info=$(jq -n "$mem_info + $mem")

	return 0
}

get_mem_info
echo $mem_info >${1}/sbin/device/mem_data.json
