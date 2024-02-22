#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh
# source /workspace/sbin/common/common-base.sh

cpu_info="{}"

function cpu_prime_test_info() {
	cpu_prime_events_per_second_key="cpu_prime_events_per_second"

	cpu_prime_events_per_second=$(sysbench cpu --cpu-max-prime=10000 run | grep "events per second" | awk -F':' '{print $2}')
	# sysbench cpu --cpu-max-prime=10000 run | grep 'events per second' | awk -F: '{print $2}'

	cpu_prime_events_per_second=$(trim_space "$cpu_prime_events_per_second")

	cpu_prime=$(create_json "$cpu_prime_events_per_second_key" "$cpu_prime_events_per_second")

	cpu_info=$(jq -n "$cpu_info + $cpu_prime")

	#  echo $cpu_info
	return 0
}

function cpu_thread_test_info() {
	cpu_threads_fairness_events_key="cpu_threads_fairness_events_key"
	cpu_threads_fairness_events_value=$(sysbench threads --threads=500 --thread-yields=100 --thread-locks=4 run | grep "events (avg/stddev)" | awk -F':' '{print $2}')
	# sysbench threads --threads=500 --thread-yields=100 --thread-locks=4 run | grep 'events (avg/stddev)' | awk -F: '{print $2}'

	cpu_threads_fairness_events_value=$(trim_space "$cpu_threads_fairness_events_value")

	cpu_threads_fairness_exec_time_key="cpu_threads_fairness_exec_time_key"
	cpu_threads_fairness_exec_time_value=$(sysbench threads --threads=500 --thread-yields=100 --thread-locks=4 run | grep "execution time (avg/stddev)" | awk -F':' '{print $2}')
	# sysbench threads --threads=500 --thread-yields=100 --thread-locks=4 run | grep 'execution time (avg/stddev)' | awk -F: '{print $2}'

	cpu_threads_fairness_exec_time_value=$(trim_space "$cpu_threads_fairness_exec_time_value")

	cpu_threads_fairness_events=$(create_json "$cpu_threads_fairness_events_key" "$cpu_threads_fairness_events_value")
	cpu_threads_fairness_exec_time=$(create_json "$cpu_threads_fairness_exec_time_key" "$cpu_threads_fairness_exec_time_value")

	cpu_info=$(jq -n "$cpu_info + $cpu_threads_fairness_events")
	cpu_info=$(jq -n "$cpu_info + $cpu_threads_fairness_exec_time")

	#  echo $cpu_info
	return 0
}

# Usage example:
#  cpu_mips_test_info base_path cpu_arch
function cpu_mips_test_info() {
	cpu_mips_key="cpu_mips"

	chmod +x ${1}/tools/dhrystone
	# chmod +x /workspace/tools/dhrystone

	cpu_mips_value=""
	cpu_mips_value=$(${1}/tools/dhrystone 2>/dev/null | grep "Dhrystones per Second" | awk -F':' '{print $2}')
	# /workspace/tools/dhrystone | grep 'Dhrystones per Second' | awk -F: '{print $2}'

	cpu_mips_value=$(($cpu_mips_value / 1757))

	cpu_mips=$(create_json "$cpu_mips_key" "$cpu_mips_value")

	cpu_info=$(jq -n "$cpu_info + $cpu_mips")

	rm -rf Dhry.txt

	return 0
}

cpu_prime_test_info
cpu_thread_test_info
cpu_mips_test_info ${1} ${2}
# cpu_mips_test_info /workspace x86_64

echo $cpu_info >${1}/sbin/cpu/data.json
