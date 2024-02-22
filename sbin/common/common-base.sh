#!/bin/bash
set -X

cd $1

function create_json() {
	#utility function
	local key=$1
	local value="$2"
	local json=""

	#if value is string
	if test -z "$(echo "$value" | egrep "\[|\]|\{|\}")"; then
		json=$(jq -n {"$key":"\"$value\""})
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
