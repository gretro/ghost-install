#!/bin/bash

function deploy-ghost {
	section "Deploying Ghost"

	log INFO "Obtaining Ghost-deploy from GitHub"
	rm -R "$path/ghost-deploy"
	git clone https://github.com/jakobadam/ghost-deploy.git "$path/ghost-deploy/"

	log INFO "Deploying Ghost using ghost-deploy"
	cd "$path/ghost-deploy"
	./install.sh
	cd "$path"

	rm -R "$path/ghost-deploy"
}

export -f deploy-ghost