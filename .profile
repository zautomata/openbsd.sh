# sh/ksh initialization

#. /etc/ksh.kshrc
#. /etc/zsh.kshrc

#PS1='-\u@\h (\w) $ '
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '


#PKG_PATH=ftp://ftp.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`
#PKG_PATH=ftp://ftp.openbsd.org/pub/OpenBSD/snapshots/packages/`machine -a`
#TERM=xterm-xfree86
HISTFILE=$HOME/.ksh_history
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
#EDITOR=vim

export PS1 PATH HOME TERM PKG_PATH HISTFILE

# Bind Ctrl+L to clear the screen
bind -m '^L'=clear'^J'

if [ -f ${HOME}/.alias ]; then
. ${HOME}/.alias
fi

if [ -f ${HOME}/.functions ]; then
. ${HOME}/.functions
fi

# Enable ksh logout file ~/.ksh_logout
ksh_logout() {
	if [ -s "${HOME}/.ksh_logout" ]; then
		. "${HOME}/.ksh_logout"
			fi
}
case "$-" in
*i*)
# Interactive shell
if [ -n "${KSH_VERSION}" ]; then
trap ksh_logout 0
fi
;;
esac

# capslock to ctrl
setxkbmap -layout us -option ctrl:nocaps

# needs to install pv(1)
# backward lapse
blapse(){
	git log -p --stat --pretty=format:"%h - %an, %ar : %s" --graph | pv -qL 50
}

# forward lapse
lapse(){
#cat -b "$1" | pv -qL 50
	git log -p --stat --pretty=format:"%h - %an, %ar : %s" --reverse | pv -qL 50
}
alias gitlapse=lapse
alias pv="pv -qL 50"

copyright(){
	cat /usr/share/misc/license.template
}

backup(){
	folder_to_encrypt="$1"
		tar cz $folder_to_encrypt | openssl enc -aes-256-cbc -e > out.tar.gz.enc
}

backdown(){
	folder_to_dencrypt="$1"
		openssl enc -aes-256-cbc -d -in $folder_to_decrypt | tar xz
}

alias 102="ssh 192.168.1.102"

#export PATH=$PATH:/home/zautomata/repocode/go10.2/go/bin
#export GOPATH=$PATH:/home/zautomata/repocode/go10.2/go/bin
#export PATH=$PATH:/usr/local/go/bin
#export PATH=$PATH:/usr/local/go
#export PATH=$PATH:~/go
#export PATH=$PATH:$GOPATH/bin

## openbsd guide https://github.com/ipfs/go-ipfs/blob/master/docs/openbsd.md
export GOPATH=~/go
#echo "$GOPATH"
export PATH="$PATH:$GOPATH/bin"

# requires doad pkg_add rlwrap
alias ed="rlwrap ed"

# use ln instead
#alias bundle=/usr/local/lib/ruby/gems/2.4/gems/bundler-1.16.2/exe/bundle_ruby
