#!/bin/bash

function cpu_device_info() {
  # cpu device info
  sh ./sbin/device/device_cpu_base_info.sh $base_path

  cpu_model=$(cat ./sbin/device/cpu_data.json | jq -r .cpu_model)
  cpu_flag=$(cat ./sbin/device/cpu_data.json | jq -r .cpu_flag)
  cpu_mhz=$(cat ./sbin/device/cpu_data.json | jq -r .cpu_mhz)
  echo "---------------------------------Cpu Device Info---------------------------------"
  echo -e "Model: $cpu_model (型号)\t MHz: $cpu_mhz (频率)"
  echo -e "Flag: $cpu_flag (指令集)"
  echo -e "\n"
  rm -rf ./sbin/device/cpu_data.json
}

function mem_device_info() {
  # mem device info
  sh ./sbin/device/device_mem_base_info.sh $base_path

  mem_size=$(cat ./sbin/device/mem_data.json | jq -r .mem_size)
  echo "---------------------------------Mem Device Info---------------------------------"
  echo -e "Size: $mem_size (容量)"
  echo -e "\n"
  rm -rf ./sbin/device/mem_data.json
}

function disk_device_info() {
  # disk device info
  echo "---------------------------------Disk Device Info---------------------------------"
  echo "磁盘列表："
  sh ./sbin/device/device_disk_base_info.sh $base_path
  echo -e "\n"
}

function network_device_info() {
  # network device info
  sh ./sbin/device/device_network_base_info.sh $base_path

  network_device=$(cat ./sbin/device/network_data.json | jq -r .network_device)
  echo "---------------------------------Network Device Info---------------------------------"
  echo -e "Device: $network_device (型号)"
  echo -e "\n"
  rm -rf ./sbin/device/network_data.json
}

function system_info() {
  # system info
  sh ./sbin/system/system_base_info.sh $base_path

  system=$(cat ./sbin/system/data.json | jq -r .system)
  kenel=$(cat ./sbin/system/data.json | jq -r .kenel)
  arch=$(cat ./sbin/system/data.json | jq -r .arch)
  host=$(cat ./sbin/system/data.json | jq -r .host)
  echo "---------------------------------System Base Info---------------------------------"
  echo -e "System: $system (系统)\t Kenel: $kenel (内核版本)\t Arch: $arch (架构)\t Host: $host (主机名称)"
  echo -e "\n"
  rm -rf ./sbin/system/data.json
}

function cpu_test() {
  # cpu test
  sh ./sbin/cpu/cpu_test_info.sh $base_path $platform

  cpu_prime_time=$(cat ./sbin/cpu/data.json | jq -r .cpu_prime_time)
  cpu_threads_time=$(cat ./sbin/cpu/data.json | jq -r .cpu_threads_time)
  cpu_mips=$(cat ./sbin/cpu/data.json | jq -r .cpu_mips)
  echo "---------------------------------Cpu Test Info---------------------------------"
  echo -e "Prime totalTime: $cpu_prime_time (计算10000以内最大素数耗时)"
  echo -e "Threads totalTime: $cpu_threads_time (调度500个线程耗时)"
  echo -e "Mips: $cpu_mips (每秒多少百万条指令)"
  echo -e "\n"
  rm -rf ./sbin/cpu/data.json
}

function mem_test() {
  # mem test
  sh ./sbin/memory/memory_test_info.sh $base_path

  mem_speed_totaltime=$(cat ./sbin/memory/data.json | jq -r .mem_total_time)
  mem_speed_totalevents=$(cat ./sbin/memory/data.json | jq -r .mem_total_events)
  mem_speed_totalspeed=$(cat ./sbin/memory/data.json | jq -r .mem_total_speed)
  echo "---------------------------------Memory Test Info---------------------------------"
  echo -e "totalTime: $mem_speed_totaltime (读写2G的耗时)"
  echo -e "totalEvents: $mem_speed_totalevents (读/写8K大小内存块数)"
  echo -e "totalSpeed: $mem_speed_totalspeed (每秒读写速度)"
  echo -e "\n"
  rm -rf ./sbin/memory/data.json

}

function disk_test() {
  # disk test
  sh ./sbin/disk/disk_test_info.sh $base_path

  disk_iops_4krandrw_read=$(cat ./sbin/disk/data.json | jq -r .disk_iops_4krandrw_read)
  disk_iops_4krandrw_write=$(cat ./sbin/disk/data.json | jq -r .disk_iops_4krandrw_write)
  disk_throughput_rand_read=$(cat ./sbin/disk/data.json | jq -r .disk_throughput_rand_read)
  disk_throughput_rand_write=$(cat ./sbin/disk/data.json | jq -r .disk_throughput_rand_write)
  echo "---------------------------------Disk Test Info---------------------------------"
  echo -e "disk_iops_4krandrw_read: $disk_iops_4krandrw_read (4k数据块随机读iops)\t disk_iops_4krandrw_write: $disk_iops_4krandrw_write (4k数据块随机写iops)"
  echo -e "disk_throughput_rand_read: $disk_throughput_rand_read (随机读吞吐量)\t disk_throughput_rand_write: $disk_throughput_rand_write (随机写吞吐量)"
  echo -e "\n"
  rm -rf ./sbin/disk/data.json
}

function network_test() {
  # network test
  sh ./sbin/network/network_test_info.sh $base_path

  #  echo "---- $network_test_info ----"
  network_tcp_bitrate_sender=$(cat ./sbin/network/data.json | jq -r .network_bitrate_sender)
  network_tcp_bitrate_receiver=$(cat ./sbin/network/data.json | jq -r .network_bitrate_receiver)
  network_udp_jitter=$(cat ./sbin/network/data.json | jq -r .network_udp_jitter)
  network_udp_lost=$(cat ./sbin/network/data.json | jq -r .network_udp_lost)
  network_udp_bitrate=$(cat ./sbin/network/data.json | jq -r .network_udp_bitrate)

  echo "---------------------------------Network Test Info---------------------------------"
  echo -e "network_tcp_bitrate_sender: \t$network_tcp_bitrate_sender (TCP发送带宽)\t network_tcp_bitrate_receiver: \t$network_tcp_bitrate_receiver (TCP接收带宽)"
  echo -e "network_udp_bitrate: \t$network_udp_bitrate (UDP带宽)\t network_udp_jitter: \t$network_udp_jitter (UDP延迟)\t network_udp_lost: \t$network_udp_lost (UDP丢包率)"
  echo -e "\n"
  rm -rf ./sbin/network/data.json

}

function network_server() {
  echo "network_server start"
  sh ./sbin/network/iperf_server.sh $base_path
}

base_path=$(pwd)
platform=$(arch)


function main() {
  run_mode=${RUN_MODE}
  echo -e "********************\nRUN_MODE:${RUN_MODE}\n********************\n\n"

  if [ "${run_mode}"z = "server"z ]; then
    # server mode
    if [[ "${IPERF_SERVER_LISTEN_PORT}"z = ""z || "${IPERF_SERVER_LISTEN_ADDR}"z = ""z ]]; then
      echo "server mode must set IPERF_SERVER_LISTEN_ADDR and IPERF_SERVER_LISTEN_PORT env first!"
      return 1
    fi

    network_server
  elif [ "${run_mode}"z = "normal"z ]; then
    # nomal mode
    if [ "${IPERF3_SERVER_ADDR}"z = ""z ]; then
      echo "normal mode must set IPERF3_SERVER_ADDR and IPERF3_SERVER_PORT env first!"
      return 1
    fi

    # device info
    cpu_device_info
    mem_device_info
    disk_device_info
    network_device_info

    # system info
    system_info

    # device test
    cpu_test
    mem_test
    disk_test
    network_test

#    while true;do echo "Welcome to env test of normal";sleep 60;done
  else
    echo "Not suport this mode!"
  fi

}

main "$@"