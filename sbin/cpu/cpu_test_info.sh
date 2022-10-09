#!/bin/bash

source ${1}/sbin/common/common-base.sh

cpu_info="{}"

function cpu_prime_test_info() {
  cpu_prime_time_key="cpu_prime_time"

  cpu_prime_time_value=$(sysbench cpu --cpu-max-prime=10000 run | grep "total time" | awk -F':' '{print $2}')
  cpu_prime_time_value=$(trim_space "$cpu_prime_time_value")

  cpu_prime=$(create_json "$cpu_prime_time_key" "$cpu_prime_time_value")

  cpu_info=$(jq -n "$cpu_info + $cpu_prime")

  #  echo $cpu_info
  return 0
}

function cpu_thread_test_info() {
  cpu_threads_time_key="cpu_threads_time"

  cpu_threads_time_value=$(sysbench threads --threads=500 --thread-yields=100 --thread-locks=4 run | grep "total time" | awk -F':' '{print $2}')
  cpu_threads_time_value=$(trim_space "$cpu_threads_time_value")

  cpu_threads_time=$(create_json "$cpu_threads_time_key" "$cpu_threads_time_value")

  cpu_info=$(jq -n "$cpu_info + $cpu_threads_time")

  #  echo $cpu_info
  return 0
}

# Usage example:
#  cpu_mips_test_info base_path cpu_arch
function cpu_mips_test_info() {
  cpu_mips_key="cpu_mips"

  chmod +x ${1}/tools/dhrystone2*
  cpu_mips_value=""
  cpu_mips_value=$(${1}/tools/dhrystone2 n | grep "VAX  MIPS rating" | awk -F'=' '{print $2}')
  cpu_mips_value=$(trim_space "$cpu_mips_value")


  cpu_mips=$(create_json "$cpu_mips_key" "$cpu_mips_value")

  cpu_info=$(jq -n "$cpu_info + $cpu_mips")

  rm -rf Dhry.txt

  return 0
}

cpu_prime_test_info
cpu_thread_test_info
cpu_mips_test_info ${1} ${2}
echo $cpu_info  > ${1}/sbin/cpu/data.json
