#!/bin/sh

config=$1 # load the configuration file
. $config # load the configuration file

echo $username
start(){
	echo "starting $1.sh"
#curl -s https://mailinabox.email/setup.sh | sudo bash
		ftp -V "https://raw.githubusercontent.com/zautomata/openbsd.sh/master/$1.sh" >$1.sh;chmod +x $1.sh;$1.sh $config;
}

#start mail
start networking 
