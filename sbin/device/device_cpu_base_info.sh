#!/bin/bash

source ${1}/sbin/common/common-base.sh

cpu_info='{}'

function get_cpu_info() {
  cpu_flag_key="cpu_flag"
  cpu_model_key="cpu_model"
  cpu_mhz_key="cpu_mhz"

  cpu_flag_value=$(lscpu | grep "Flags:" | awk -F':' '{print substr($2, 18, length($2)-18)}')
  cpu_model_value=$(lscpu | grep "Model name:" | awk -F':' '{print substr($2, 13, length($2)-13)}')
  cpu_mhz_value=$(lscpu | grep "CPU MHz:" | awk -F':' '{print substr($2, 16, length($2)-16)}')

  cpu_flag=$(create_json "$cpu_flag_key" "$cpu_flag_value")
  cpu_model=$(create_json "$cpu_model_key" "$cpu_model_value")
  cpu_mhz=$(create_json "$cpu_mhz_key" "$cpu_mhz_value")

  cpu_info=$(jq -n "$cpu_info + $cpu_flag")
  cpu_info=$(jq -n "$cpu_info + $cpu_model")
  cpu_info=$(jq -n "$cpu_info + $cpu_mhz")

  return 0
}

get_cpu_info
echo $cpu_info > ${1}/sbin/device/cpu_data.json