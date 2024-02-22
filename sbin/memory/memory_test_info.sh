#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh

mem_info='{}'

function mem_speed_test_info() {
	mem_speed_totaltime_key="mem_total_time"
	mem_speed_totalevents_key="mem_total_events"
	mem_speed_totalspeed_key="mem_total_speed"

	mem_speed_totaltime_value=$(sysbench memory --memory-block-size=8k --memory-total-size=2G run | grep "total time" | awk -F':' '{print $2}')
	mem_speed_totaltime_value=$(trim_space "$mem_speed_totaltime_value")
	mem_speed_totalevents_value=$(sysbench memory --memory-block-size=8k --memory-total-size=2G run | grep "total number of events" | awk -F':' '{print $2}')
	mem_speed_totalevents_value=$(trim_space "$mem_speed_totalevents_value")
	mem_speed_totalspeed_value=$(sysbench memory --memory-block-size=8k --memory-total-size=2G run | grep transferred | awk -F'(' '{print $2}' | sed 's/)//')
	mem_speed_totalspeed_value=$(trim_space "$mem_speed_totalspeed_value")

	mem_speed_totaltime=$(create_json "$mem_speed_totaltime_key" "$mem_speed_totaltime_value")
	mem_speed_totalevents=$(create_json "$mem_speed_totalevents_key" "$mem_speed_totalevents_value")
	mem_speed_totalspeed=$(create_json "$mem_speed_totalspeed_key" "$mem_speed_totalspeed_value")

	mem_info=$(jq -n "$mem_info + $mem_speed_totaltime")
	mem_info=$(jq -n "$mem_info + $mem_speed_totalevents")
	mem_info=$(jq -n "$mem_info + $mem_speed_totalspeed")

	return 0
}

mem_speed_test_info
echo $mem_info >${1}/sbin/memory/data.json
