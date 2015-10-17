#!/bin/bash

function installer-install {
	if [ -z $1 ]
	then
		log ERROR "No parameters passed to the install function."
		exit 1
	fi
	
	log "INFO" "Will now install '$1'"
	apt-get install $1 -qy
	
	if [ $? -gt 0 ]
	then
		log ERROR "Something went wrong. Unable to install '$1' because apt-get returned code $?."
		exit 1
	fi
	
	return
}

function installer-update {
	apt-get update
}

function installer-update-node-source {
	curl --silent --location https://deb.nodesource.com/setup_0.10 | bash -
}

export -f installer-install
export -f installer-update
export -f installer-update-node-source