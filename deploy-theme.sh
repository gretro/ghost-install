#!/bin/bash

function deploy-theme {
	log INFO "Installing Ghostium-fr theme"
	
	rm -R "/srv/www/ghost/content/themes/ghostium-fr"
	git clone https://github.com/gretro/ghostium/ "/srv/www/ghost/content/themes/ghostium-fr"
}

