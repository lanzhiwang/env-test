#!/bin/bash

source ${1}/sbin/common/common-base.sh

network_info='{}'

function get_network_info() {
  network_device_key="network_device"

  network_device_value=$(lspci | grep "Host bridge" | awk -F':' '{print $3}'|sed 's/\[//'|sed 's/\]//'|sed 's/(//'|sed 's/)//')

  network_device=$(create_json "$network_device_key" "$network_device_value")

  network_info=$(jq -n "$network_info + $network_device")

  return 0
}

get_network_info
echo $network_info > ${1}/sbin/device/network_data.json