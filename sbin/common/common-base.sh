#!/bin/bash
set -x

cd $1
# cd /workspace

function create_json() {
	# create_json cpu_model 'Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH'

	#utility function
	local key=$1
	# local key=cpu_model

	local value="$2"
	# local 'value=Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH'

	local json=""

	#if value is string
	if test -z "$(echo "$value" | egrep "\[|\]|\{|\}")"; then
		# echo 'Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH'
		# egrep '\[|\]|\{|\}'

		json=$(jq -n {"$key":"\"$value\""})
		# jq -n '{cpu_model:"Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH"}'
		# json='{
		# "cpu_model": "Intel(R) Xeon(R) Gold 6248R CPU @ 3.00GH"
		# }'

	#if value is json, object
	elif [ "$(echo "$value" | jq -r type)" == "object" ]; then
		json=$(jq -n {"$key":"$value"})

	#if value is array
	elif [ "$(echo "$value" | jq -r type)" == "array" ]; then
		json=$(jq -n "{$key:$value}")

	else
		echo "value type error..."
		exit 1
		return 0
	fi

	echo $json
	return 0
}

function trim_space() {
	data=$1
	echo "$data" | awk '{gsub(/^\s+|\s+$/, "");print}'
}
