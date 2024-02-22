#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh

function get_disk_info() {
	lshw -short -class disk -quiet | grep -v "=" | grep -v "Description"
	# lshw -short -class disk -quiet | grep -v = | grep -v Description

	return 0
}

get_disk_info
