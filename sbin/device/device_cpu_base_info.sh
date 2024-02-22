#!/bin/bash
set -x

source ${1}/sbin/common/common-base.sh
# source /workspace/sbin/common/common-base.sh

cpu_info='{}'
# cpu_info='{}'

function get_cpu_info() {
	cpu_flag_key="cpu_flag"
	cpu_model_key="cpu_model"
	cpu_mhz_key="cpu_mhz"

	cpu_flag_value=$(lscpu | grep "Flags:" | awk -F':' '{print substr($2, 18, length($2)-18)}')
	# lscpu | grep Flags: | awk -F: '{print substr($2, 18, length($2)-18)}'
	# cpu_flag_value='fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilitie'

	cpu_model_value=$(lscpu | grep "Model name:" | awk -F':' '{print substr($2, 13, length($2)-13)}')
	# lscpu | grep 'Model name:' | awk -F: '{print substr($2, 13, length($2)-13)}'
	# cpu_model_value='Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH'

	cpu_mhz_value=$(lscpu | grep "CPU MHz:" | awk -F':' '{print substr($2, 16, length($2)-16)}')
	# lscpu | grep 'CPU MHz:' | awk -F: '{print substr($2, 16, length($2)-16)}'
	# cpu_mhz_value=2992.96

	if [ -z "$cpu_mhz_value" ]; then
		# '[' -z 2992.96 ']'
		cpu_mhz_value=$(lscpu | grep "CPU max MHz:" | awk -F':' '{print substr($2, 12, length($2)-13)}')
	fi

	cpu_flag=$(create_json "$cpu_flag_key" "$cpu_flag_value")
	# create_json cpu_flag 'fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single ssbd rsb_ctxsw ibrs ibpb stibp ibrs_enhanced fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 pku ospke avx512_vnni md_clear spec_ctrl intel_stibp arch_capabilitie'

	cpu_model=$(create_json "$cpu_model_key" "$cpu_model_value")
	# create_json cpu_model 'Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH'

	cpu_mhz=$(create_json "$cpu_mhz_key" "$cpu_mhz_value")
	# create_json cpu_mhz 2992.96

	cpu_info=$(jq -n "$cpu_info + $cpu_flag")
	cpu_info=$(jq -n "$cpu_info + $cpu_model")
	cpu_info=$(jq -n "$cpu_info + $cpu_mhz")

	return 0
}

get_cpu_info
echo $cpu_info >${1}/sbin/device/cpu_data.json
# /workspace/sbin/device/cpu_data.json
