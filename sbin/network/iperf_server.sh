#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh

function start_iperf3_server() {
	iperf3_server_listen_addr=${IPERF_SERVER_LISTEN_ADDR-"0.0.0.0"}
	iperf3_server_listen_port=${IPERF_SERVER_LISTEN_PORT}
	iperf3 -s -i 1 -p $iperf3_server_listen_port -B $iperf3_server_listen_addr
}

start_iperf3_server
