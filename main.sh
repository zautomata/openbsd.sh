#!/bin/sh

. $1 # load the configuration file
echo $username
start(){
	echo "starting $1.sh"
	ftp -V "https://raw.githubusercontent.com/zautomata/openbsd.sh/master/$1.sh" >$1.sh;chmod +x $1.sh;$1.sh;
}

#start mail
start networking 
