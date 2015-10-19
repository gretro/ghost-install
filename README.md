# ghost-install
Installation scripts for the [Ghost Blogging platform](https://ghost.org). Currently, those 
scripts are functional only under a Linux Debian environment (Debian, Ubuntu, Mint, etc).

##Tested under
 - *Linux Mint 17.2 Rafaela*
 - *Ubuntu 14.04* (with *INSTALL_DEPENDENCIES* set to false)

##Features
- Install and deploy *Ghost* under a few minutes.
- Modular scripts, meaning that can easily
	- Install your theme
	- Include your custom configuration, such as HTTPS configuration
- Easy to use

##How to install
You must have `sudo` rights to install *Ghost* using the **ghost-install** scripts.
 1. Download the GitHub project.
 2. Customize the installation package as you wish (see below).
 3. Open a terminal in the installation package.
 	1. Run `sudo chmod 777 install.sh`
	 2. Execute the install script with `sudo ./install.sh`

##Customizations

###Installation of your theme.

Simply modify the *deploy-theme.sh* script. In there, you will find a
function named `deploy-theme`. Put your code inside and it will be
executed. If you don't need the feature, do not remove this file. Just leave
the function empty.

###Custom configurations

You may create a folder named *conf* at the root of the installer. This will be used for Ghost
and NGINX configurations.

####Ghost custom configuration
You may use this functionnality to deploy your *config.js*, but also for custom files in themes.
You may even deploy your entire theme from there if you wish so.

Create the folder `/{path to your install package}/conf/ghost` and put your custom files
there. They will be copied over to the Ghost folder in `/srv/www/ghost`.

####NGINX custom configuration
You may use this functionnality to deploy your SSL certificates and your NGINX configuration.

Create the folder `/{path to your install package}/conf/nginx`. All content under this folder
will be copied over to the NGINX configuration folder in `/etc/nginx/`. Most common files and
folders to customize are:
 - `sites-available/ghost` file for the NGINX server configuration. There is already a link to
 the `sites-enabled` folder for the ghost configuration file.
 - `ssl` folder that will contain SSL certificates for SSL connections.

###Change the way Ghost is deployed
**Ghost-install** uses and depends upon [*ghost-deploy*](https://github.com/jakobadam/ghost-deploy).
This script may make some assumptions that are not compatible with your environment. If this
is the case, you may provide your own scripts for deploying ghost. You can change the `deploy-ghost`
function in the `deploy-ghost.sh` script to change the default behavior. This function will be
invoked by the installation script.

###Install dependencies
By default, the script will attempt to install its dependancies:
 - [cURL](http://curl.haxx.se)
 - [NodeJS v0.10.*](https://nodejs.org/en/) <sup>1</sup>
 - [Git](https://git-scm.com)
 
If you do not want the script to perform the installation of those dependencies, you can
simply turn them off by editing the `install.sh` script. There is a variable named
*INSTALL_DEPENDENCIES* set to `true` by default. Change this to `false` if you don't want
this behavior.

###Deploy theme
By default, the script attempts to deploy themes by calling the `deploy-theme.sh` script.
If you don't want this, turn the *DEPLOY_THEME* flag to `false` into the `install.sh` script.



