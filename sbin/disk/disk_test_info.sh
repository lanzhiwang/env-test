#!/bin/bash

source ${1}/sbin/common/common-base.sh

size=2G
runtime=30
disk_info="{}"

function disk_iops_info() {
  filename=${1}/sbin/disk/data/fiotest
  disk_iops_4krandrw_read_key="disk_iops_4krandrw_read"
  disk_iops_4krandrw_write_key="disk_iops_4krandrw_write"

  ret=$(fio -filename=$filename -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=4k -size=$size -numjobs=1 -runtime=$runtime -name=4k_randrw --output-format=json)
  disk_iops_4krandr_read_avg_value=$(echo $ret | jq .jobs[0].read.iops_mean)
  disk_iops_4krandr_read_avg_value=$(trim_space "$disk_iops_4krandr_read_avg_value")

  disk_iops_4krandr_write_avg_value=$(echo $ret | jq .jobs[0].write.iops_mean)
  disk_iops_4krandr_write_avg_value=$(trim_space "$disk_iops_4krandr_write_avg_value")

  disk_iops_read=$(create_json "$disk_iops_4krandrw_read_key" "$disk_iops_4krandr_read_avg_value")
  disk_iops_write=$(create_json "$disk_iops_4krandrw_write_key" "$disk_iops_4krandr_write_avg_value")

  disk_info=$(jq -n "$disk_info + $disk_iops_read")
  disk_info=$(jq -n "$disk_info + $disk_iops_write")

  rm -rf $filename

  return 0
}

function disk_throughput_info() {
  disk_throughput_rand_read_key="disk_throughput_rand_read"
  disk_throughput_rand_write_key="disk_throughput_rand_write"

  #prepare
  mkdir -p ${1}/sbin/disk/data
  cd ${1}/sbin/disk/data
  sysbench fileio --threads=16 --file-total-size=$size --file-test-mode=rndrw prepare &>/dev/null

  sysbench fileio --threads=16 --file-total-size=$size --file-test-mode=rndrw run > ${1}/sbin/disk/disk_throughput_info.data

  disk_throughput_rand_read_value=$(cat ${1}/sbin/disk/disk_throughput_info.data | grep "read, MiB/s" | awk -F':' '{print $2}')
  disk_throughput_rand_read_value=$(trim_space "$disk_throughput_rand_read_value")

  disk_throughput_rand_write_value=$(cat ${1}/sbin/disk/disk_throughput_info.data | grep "written, MiB/s" | awk -F':' '{print $2}')
  disk_throughput_rand_write_value=$(trim_space "$disk_throughput_rand_write_value")

  # clean
  sysbench fileio --threads=16 --file-total-size=$size --file-test-mode=rndrw cleanup &>/dev/null
  rm ${1}/sbin/disk/disk_throughput_info.data

  disk_throughput_read=$(create_json "$disk_throughput_rand_read_key" "$disk_throughput_rand_read_value")
  disk_throughput_write=$(create_json "$disk_throughput_rand_write_key" "$disk_throughput_rand_write_value")

  disk_info=$(jq -n "$disk_info + $disk_throughput_read")
  disk_info=$(jq -n "$disk_info + $disk_throughput_write")

  return 0
}

disk_iops_info ${1}
disk_throughput_info ${1}
echo $disk_info > ${1}/sbin/disk/data.json
