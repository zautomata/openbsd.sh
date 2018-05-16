# openbsd.sh
openbsd.sh is a collection of shell scripts that automatically configure newly insallted openbsd (virtual)machines.

## Usage
make a configuration file i.e. openbsd.config
```
username="zautomata"
password="password"

```


Then copy/paste this line on a new installation of openbsd with a path to the configruation file.

```
obsdc="$HOME/Opensource/openbsd.sh/openbsd.config";cd $(mktemp -d);ftp -V "https://raw.githubusercontent.com/zautomata/openbsd.sh/master/main.sh" >main.sh;chmod +x main.sh;main.sh $obsdc;cd - > /dev/null

```
## Further info 
Here is a git.io shorturl `https://git.io/vpd5H` but requires a hack as ftp doesn't support url redirect
