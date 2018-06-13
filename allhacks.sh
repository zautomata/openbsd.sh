#!/bin/sh

# post install script for openbsd
echo "$0"
#TODO config file
username=`echo $USER` # i.e. zautomata
machine=`hostname -s` # i.e. s1
machine_ip=`ifconfig re0 | grep "inet " | awk -F'[: ]+' '{ print $2 }'` # i.e. 192.168.1.101
gmail_username=""
gmail_password=""


profile_gist="https://gist.githubusercontent.com/zautomata/3cb41d3ed29ce1156df43b244c9e6514/raw/63f7eccebcf9750820000e3a7cfd9036ae73820d/.profile%2520%253F"
tmux_gist="https://gist.githubusercontent.com/zautomata/3cb41d3ed29ce1156df43b244c9e6514/raw/63f7eccebcf9750820000e3a7cfd9036ae73820d/tmux.conf"

# curl here
#curl -o ~/.profile $profile_gist
#curl -o ~/.tmux.conf $tmux_gist
#TODO use ftp

pkg_add vim
pkg_add curl 
pkg_add base64 
pkg_add jq
pkg_add transmission 
pkg_add rlwrap 

#TODO make an openbsd port for opentracker?
#TODO make an openbsd port for baseline(1)?

# git
pkg_add git
#TODO configure git

# st
pkg_add st
#TODO configure st 

# dwm
pkg_add dwm
echo "exec dwm" > ~/.xinitrc

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

echo "permit persist setenv { PKG_CACHE PKG_PATH } zautomata cmd pkg_add" >> /etc/doas.conf  
echo "permit persist setenv { PKG_CACHE PKG_PATH } zautomata cmd pkg_delete" >> /etc/doas.conf  

#permit setenv { -ENV PS1=$DOAS_PS1 SSH_AUTH_SOCK } :wheel 
#permit nopass tedu as root cmd /usr/sbin/procmap 
echo "permit nopass keepenv root as root" >> /etc/doas.conf


#
# Networking
#

# Generating ssh keys
`ssh-keygen -t rsa` 

`cat /home/zautomata/.ssh/id_rsa.pub  | ssh zautomata@192.168.1.103 'cat >> ~/.ssh/authorized_keys'`
`cat /home/zautomata/.ssh/id_rsa.pub  | ssh zautomata@192.168.1.102 'cat >> ~/.ssh/authorized_keys'`
`cat /home/zautomata/.ssh/id_rsa.pub  | ssh zautomata@192.168.1.101 'cat >> ~/.ssh/authorized_keys'`
vi /etc/hosts

#
# End of Networking
#

#
# Software Development
#
mkdir /home/$username/Opensource
#TODO find my interesting github repos and put them here.
#TODO or find some intersting backup and put it here

# Download OpenBSD Base Sourcecode
#TODO command prompt to ask if they want?

# Download OpenBSD Ports Sourcecode
#TODO command prompt to ask if they want?


#
# End of Software Development
#

#
# Mail 
#
#TODO ask if this machine is a mail server?
#TODO ask if this machine is a mail client?
#
# End of Mail 
#

