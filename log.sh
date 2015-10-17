#!/bin/bash

function log {
	if [ -z "$2" ]; then
		level="INFO"
		msg=$1
	else
		level=$1
		msg=$2
	fi

	if [ -z "$msg" ]; then
		return
	fi

	if [ $level = "INFO" ]; then
		color="97"
	elif [ $level = "WARN" ]; then
		color="33"
	elif [ $level = "ERROR" ]; then
		color="91"
	elif [ $level = "SUCCESS" ]; then
		color="32"
	else
		color="39"
	fi

	now=`date "+%D %r"`
	echo -e "\e[${color}m[${now} - ${level}] ${msg}\e[0m"
}

function section {
	echo -e "\n----------------------------------------------------"
	echo " > $1"
	echo "----------------------------------------------------" 
}


export -f log
export -f section