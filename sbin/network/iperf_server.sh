#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh
# source /workspace/sbin/common/common-base.sh

function start_iperf3_server() {
	iperf3_server_listen_addr=${IPERF_SERVER_LISTEN_ADDR-"0.0.0.0"}
	# iperf3_server_listen_addr=0.0.0.0

	iperf3_server_listen_port=${IPERF_SERVER_LISTEN_PORT}
	# iperf3_server_listen_port=3389

	iperf3 -s -i 1 -p $iperf3_server_listen_port -B $iperf3_server_listen_addr
	# iperf3 -s -i 1 -p 3389 -B 0.0.0.0
}

start_iperf3_server
