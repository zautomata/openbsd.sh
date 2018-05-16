# openbsd.sh
openbsd.sh is a collection of shell scripts that automatically configure newly insallted openbsd (virtual)machines.

## Usage
copy/paste this line on a new installation of openbsd

```
cd $(mktemp -d);ftp -V "https://raw.githubusercontent.com/zautomata/openbsd.sh/master/main.sh" >main.sh;chmod +x main.sh;main.sh;cd - > /dev/null

```
## Further info 
Here is a git.io shorturl `https://git.io/vpd5H` but requires a hack as ftp doesn't support url redirect
