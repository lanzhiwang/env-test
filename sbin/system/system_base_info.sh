#!/bin/bash
set -X

source ${1}/sbin/common/common-base.sh

system_info='{}'

function system_base_info() {
	system_type_key="system"
	kenel_version_key="kenel"
	system_arch_key="arch"
	system_host_key="host"

	system_type_value=$(uname -a | awk '{print $1}')
	kenel_version_value=$(uname -a | awk '{print $3}')
	system_arch_value=$(uname -a | awk '{print $12}')
	system_host_value=$(uname -a | awk '{print $2}')

	system_type=$(create_json "$system_type_key" "$system_type_value")
	kenel_version=$(create_json "$kenel_version_key" "$kenel_version_value")
	system_arch=$(create_json "$system_arch_key" "$system_arch_value")
	system_host=$(create_json "$system_host_key" "$system_host_value")

	system_info=$(jq -n "$system_info + $system_type")
	system_info=$(jq -n "$system_info + $kenel_version")
	system_info=$(jq -n "$system_info + $system_arch")
	system_info=$(jq -n "$system_info + $system_host")

	return 0
}

system_base_info
echo $system_info >${1}/sbin/system/data.json
