#!/bin/bash
set -X

function cpu_device_info() {
	# cpu device info
	sh ./sbin/device/device_cpu_base_info.sh $base_path

	cpu_model=$(cat ./sbin/device/cpu_data.json | jq -r .cpu_model)
	cpu_flag=$(cat ./sbin/device/cpu_data.json | jq -r .cpu_flag)
	cpu_mhz=$(cat ./sbin/device/cpu_data.json | jq -r .cpu_mhz)
	echo "---------------------------------Cpu Device Info---------------------------------" | tee ./log/cpu_device.log
	echo -e "Model: $cpu_model (型号)\t MHz: $cpu_mhz (频率)" | tee -a ./log/cpu_device.log
	echo -e "Flag: $cpu_flag (指令集)" | tee -a ./log/cpu_device.log
	echo -e "\n" | tee -a ./log/cpu_device.log

	rm -rf ./sbin/device/cpu_data.json
}

function mem_device_info() {
	# mem device info
	sh ./sbin/device/device_mem_base_info.sh $base_path

	mem_size=$(cat ./sbin/device/mem_data.json | jq -r .mem_size)
	echo "---------------------------------Mem Device Info---------------------------------" | tee ./log/mem_device.log
	echo -e "Size: $mem_size (容量)" | tee -a ./log/mem_device.log
	echo -e "\n" | tee -a ./log/mem_device.log

	rm -rf ./sbin/device/mem_data.json
}

function disk_device_info() {
	# disk device info
	echo "---------------------------------Disk Device Info---------------------------------" | tee ./log/disk_device.log
	echo "磁盘列表：" | tee -a ./log/disk_device.log
	sh ./sbin/device/device_disk_base_info.sh $base_path | tee -a ./log/disk_device.log
	echo -e "\n" | tee -a ./log/disk_device.log
}

function network_device_info() {
	# network device info
	sh ./sbin/device/device_network_base_info.sh $base_path

	network_device=$(cat ./sbin/device/network_data.json | jq -r .network_device)
	echo "---------------------------------Network Device Info---------------------------------" | tee ./log/network_device.log
	echo -e "Device: $network_device (型号)" | tee -a ./log/network_device.log
	echo -e "\n" | tee -a ./log/network_device.log
	rm -rf ./sbin/device/network_data.json
}

function system_info() {
	# system info
	sh ./sbin/system/system_base_info.sh $base_path

	system=$(cat ./sbin/system/data.json | jq -r .system)
	kenel=$(cat ./sbin/system/data.json | jq -r .kenel)
	arch=$(cat ./sbin/system/data.json | jq -r .arch)
	host=$(cat ./sbin/system/data.json | jq -r .host)
	echo "---------------------------------System Base Info---------------------------------" | tee ./log/system_base.log
	echo -e "System: $system (系统)\t Kenel: $kenel (内核版本)\t Arch: $arch (架构)\t Host: $host (主机名称)" | tee -a ./log/system_base.log
	echo -e "\n" | tee -a ./log/system_base.log
	rm -rf ./sbin/system/data.json
}

function cpu_test() {
	# cpu test
	sh ./sbin/cpu/cpu_test_info.sh $base_path $platform

	cpu_prime_events_per_second=$(cat ./sbin/cpu/data.json | jq -r .cpu_prime_events_per_second)
	cpu_threads_fairness_events=$(cat ./sbin/cpu/data.json | jq -r .cpu_threads_fairness_events_key)
	cpu_threads_fairness_exec_time=$(cat ./sbin/cpu/data.json | jq -r .cpu_threads_fairness_exec_time_key)
	cpu_mips=$(cat ./sbin/cpu/data.json | jq -r .cpu_mips)
	echo "---------------------------------Cpu Test Info---------------------------------"
	echo -e "Prime calc speed: $cpu_prime_events_per_second events/s (计算10000以内所有素数的速度)"
	echo -e "Threads fairness events: $cpu_threads_fairness_events (500线程调度时events的分布)"
	echo -e "Threads fairness execution time: $cpu_threads_fairness_exec_time (500线程调度时执行时间的分布)"
	echo -e "Mips: $cpu_mips MIPS (每秒多少百万条指令)"
	echo -e "\n"
	if [ ! -f "./log/cpu_test.csv" ]; then
		echo "计算10000以内所有素数的速度,500线程调度时events的分布,500线程调度时执行时间的分布,每秒多少百万条指令" >./log/cpu_test.csv
	fi
	echo "$cpu_prime_events_per_second,$cpu_threads_fairness_events,$cpu_threads_fairness_exec_time,$cpu_mips" >>./log/cpu_test.csv
	rm -rf ./sbin/cpu/data.json
}

function mem_test() {
	# mem test
	sh ./sbin/memory/memory_test_info.sh $base_path

	mem_speed_totaltime=$(cat ./sbin/memory/data.json | jq -r .mem_total_time)
	mem_speed_totalspeed=$(cat ./sbin/memory/data.json | jq -r .mem_total_speed)
	echo "---------------------------------Memory Test Info---------------------------------"
	echo -e "totalTime: $mem_speed_totaltime (读写2G的耗时)"
	echo -e "totalSpeed: $mem_speed_totalspeed (每秒读写速度)"
	echo -e "\n"
	if [ ! -f "./log/mem_test.csv" ]; then
		echo "写入2G数据耗时,写入吞吐量" >./log/mem_test.csv
	fi
	echo "$mem_speed_totaltime,$mem_speed_totalspeed" >>./log/mem_test.csv
	rm -rf ./sbin/memory/data.json

}

function disk_test() {
	# disk test
	sh ./sbin/disk/disk_test_info.sh $base_path

	disk_iops_4krandrw_read=$(cat ./sbin/disk/data.json | jq -r .disk_iops_4krandrw_read)
	disk_iops_4krandrw_write=$(cat ./sbin/disk/data.json | jq -r .disk_iops_4krandrw_write)
	disk_4krandr_read_95clat=$(cat ./sbin/disk/data.json | jq -r .disk_4krandr_read_95clat)
	disk_4krandr_write_95clat=$(cat ./sbin/disk/data.json | jq -r .disk_4krandr_write_95clat)
	disk_4krandr_read_maxlat=$(cat ./sbin/disk/data.json | jq -r .disk_4krandr_read_maxlat)
	disk_4krandr_write_maxlat=$(cat ./sbin/disk/data.json | jq -r .disk_4krandr_write_maxlat)
	disk_throughput_rand_read=$(cat ./sbin/disk/data.json | jq -r .disk_throughput_rand_read)
	disk_throughput_rand_write=$(cat ./sbin/disk/data.json | jq -r .disk_throughput_rand_write)
	echo "---------------------------------Disk Test Info---------------------------------"
	echo -e "disk_iops_4krandrw_read: $disk_iops_4krandrw_read (4k数据块随机读iops)\t disk_iops_4krandrw_write: $disk_iops_4krandrw_write (4k数据块随机写iops)"
	echo -e "disk_4krandr_read_95clat: ${disk_4krandr_read_95clat}us (4k数据块随机读95%延迟)\t disk_4krandr_write_95clat: ${disk_4krandr_write_95clat}us (4k数据块随机写95%延迟)"
	echo -e "disk_4krandr_read_maxlat: ${disk_4krandr_read_maxlat}us (4k数据块随机读最大延迟)\t disk_4krandr_write_maxlat: ${disk_4krandr_write_maxlat}us (4k数据块随机写最大延迟)"
	echo -e "disk_throughput_rand_read: $disk_throughput_rand_read (随机读吞吐量)\t disk_throughput_rand_write: $disk_throughput_rand_write (随机写吞吐量)"
	echo -e "\n"
	if [ ! -f "./log/disk_test.csv" ]; then
		echo "4k数据块随机读iops,4k数据块随机写iops,4k数据块随机读95%延迟,4k数据块随机写95%延迟,4k数据块随机读最大延迟,4k数据块随机写最大延迟,随机读吞吐量,随机写吞吐量" >./log/disk_test.csv
	fi
	echo "$disk_iops_4krandrw_read,$disk_iops_4krandrw_write,${disk_4krandr_read_95clat}us,${disk_4krandr_write_95clat}us,${disk_4krandr_read_maxlat}us,${disk_4krandr_write_maxlat}us,$disk_throughput_rand_read,$disk_throughput_rand_write" >>./log/disk_test.csv
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
	if [ ! -f "./log/network_test.csv" ]; then
		echo "TCP发送带宽,TCP接收带宽,UDP带宽,UDP延迟,UDP丢包率" >./log/network_test.csv
	fi
	echo "$network_tcp_bitrate_sender,$network_tcp_bitrate_receiver,$network_udp_bitrate,$network_udp_jitter,$network_udp_lost" >>./log/network_test.csv
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
		timer=${RUN_TIME:-600}
		while [ $timer -gt 0 ]; do
			# device test
			cpu_test
			mem_test
			disk_test
			network_test
			sleep 5              # 暫停5秒
			timer=$((timer - 5)) # 更新計時器
		done

		#    while true;do echo "Welcome to env test of normal";sleep 60;done
	else
		echo "Not suport this mode!"
	fi

	if [ "${SLEEP_TIME}"z != ""z ]; then
		sleep $SLEEP_TIME
		echo "will sleep ${SLEEP_TIME} second..."
	fi

}

main "$@"
