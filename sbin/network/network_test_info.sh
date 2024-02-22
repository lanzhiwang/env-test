#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh
# source /workspace/sbin/common/common-base.sh

iperf3_server_addr=${IPERF3_SERVER_ADDR}
# iperf3_server_addr=10.4.2.3

iperf3_server_port=${IPERF3_SERVER_PORT-"3389"}
# iperf3_server_port=3389

network_info='{}'

function network_bitrate_test_info() {
	network_bitrate_sender_key="network_bitrate_sender"
	network_bitrate_receiver_key="network_bitrate_receiver"

	iperf3 -c $iperf3_server_addr -p $iperf3_server_port -i 1 >${1}/sbin/network/network_udp_test_info.data
	# iperf3 -c 10.4.2.3 -p 3389 -i 1 > /workspace/sbin/network/network_udp_test_info.data

	network_bitrate_sender_value=$(cat ${1}/sbin/network/network_udp_test_info.data | grep "sender" | awk '{printf "%s %s", $7,$8}')
	network_bitrate_sender_value=$(trim_space "$network_bitrate_sender_value")
	network_bitrate_receiver_value=$(cat ${1}/sbin/network/network_udp_test_info.data | grep "receiver" | awk '{printf "%s %s", $7,$8}')
	network_bitrate_receiver_value=$(trim_space "$network_bitrate_receiver_value")

	network_bitrate_sender=$(create_json "$network_bitrate_sender_key" "$network_bitrate_sender_value")
	network_bitrate_receiver=$(create_json "$network_bitrate_receiver_key" "$network_bitrate_receiver_value")

	network_info=$(jq -n "$network_info + $network_bitrate_sender")
	network_info=$(jq -n "$network_info + $network_bitrate_receiver")

	rm -rf ${1}/sbin/network/network_udp_test_info.data

	return 0
}

function network_udp_test_info() {
	network_udp_jitter_key="network_udp_jitter"
	network_udp_lost_key="network_udp_lost"
	network_udp_bitrate_key="network_udp_bitrate"

	iperf3 -u -c $iperf3_server_addr -p $iperf3_server_port -b 1500M -i 1 >${1}/sbin/network/network_udp_test_info.data
	# iperf3 -u -c 10.4.2.3 -p 3389 -b 1500M -i 1 > /workspace/sbin/network/network_udp_test_info.data

	network_udp_jitter_value=$(cat ${1}/sbin/network/network_udp_test_info.data | grep -A 2 "Lost/Total" | grep sec | awk '{printf "%s %s", $9,$10}')
	network_udp_jitter_value=$(trim_space "$network_udp_jitter_value")
	network_udp_lost_value=$(cat ${1}/sbin/network/network_udp_test_info.data | grep -A 2 "Lost/Total" | grep sec | awk '{printf "%s %s", $11,$12}')
	network_udp_lost_value=$(trim_space "$network_udp_lost_value")
	network_udp_bitrate_value=$(cat ${1}/sbin/network/network_udp_test_info.data | grep -A 2 "Lost/Total" | grep sec | awk '{printf "%s %s", $7,$8}')
	network_udp_bitrate_value=$(trim_space "$network_udp_bitrate_value")

	network_udp_jitter=$(create_json "$network_udp_jitter_key" "$network_udp_jitter_value")
	network_udp_lost=$(create_json "$network_udp_lost_key" "$network_udp_lost_value")
	network_udp_bitrate=$(create_json "$network_udp_bitrate_key" "$network_udp_bitrate_value")

	network_info=$(jq -n "$network_info + $network_udp_jitter")
	network_info=$(jq -n "$network_info + $network_udp_lost")
	network_info=$(jq -n "$network_info + $network_udp_bitrate")

	rm -rf ${1}/sbin/network/network_udp_test_info.data

	return 0
}

network_bitrate_test_info ${1}
# network_bitrate_test_info /workspace

network_udp_test_info ${1}
# network_udp_test_info /workspace

echo $network_info >${1}/sbin/network/data.json
