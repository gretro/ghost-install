#!/bin/bash
orgPath=`pwd`
cd "$(dirname "$0")"
export path=`pwd`

source "$path/log.sh"
source "$path/apt-get-installer.sh"
source "$path/deploy-ghost.sh"
source "$path/deploy-theme.sh"

#========================================================================
# Variables and settings
#========================================================================
INSTALL_DEPENDANCIES=true
DEPLOY_THEME=true

#========================================================================
# Functions
#========================================================================
function isRoot {
	user=`whoami`

	if [ ! $user = "root" ]; then
		log ERROR "Please execute this script as root (sudo)"
		exit -1
	fi
}

function install-dependancies {
	section "Dependancies installation"

	installer-update
	installer-install "curl"

	installer-update-node-source
	install "nodejs=0.10.*"

	install "git"
}

function configure-ghost {
	section "Configuring Ghost"

	if [ -d "$path/conf/ghost" ]; then
		log INFO "Copying files from '$path/conf/ghost' to the Ghost folder"
		cp -R "$path/conf/ghost/." "/srv/www/ghost"
	else
		log WARN "No conf/ghost folder discovered. This will result into a vanilla Ghost installation"
	fi
}

function configure-nginx {
	section "Configuring NGINX"

	if [ -d "$path/conf/nginx" ]; then
		log INFO "Copying files from '$path/conf/nginx' to the NGINX configuration folder"
		cp -R "$path/conf/nginx/." "/etc/nginx/"
	else
		log WARN "No conf/nginx folder discovered. This will result into a vanilla nginx installation"
	fi
}

function restart-services {
	section "Restarting services"

	service ghost restart
	service nginx restart
}

#========================================================================
# Main execution
#========================================================================
isRoot

echo "=================================================================="
echo "Ghost Install"
echo "=================================================================="

if [ $INSTALL_DEPENDANCIES = true ]; then
	install-dependancies
fi

deploy-ghost

if [ $DEPLOY_THEME = true ]; then
	deploy-theme
fi

configure-ghost
configure-nginx

restart-services

cd "$orgPath"

echo -e "\n"
log SUCCESS "All done! Ghost was deployed successfully."
exit 0
