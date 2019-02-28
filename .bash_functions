# Custom Functions

# Backup a file
bu() {
	FIN_NAME="$1.bak-`date +%m-%d-%y:%H:%M:%S`"
	cp "$1" ${FIN_NAME};
	echo "$1 has been backed up into ${FIN_NAME}";
}

# Make a directory and 'cd' into it
mcd() {
	mkdir -pv $1;
	cd $1;
}

# CD into a directory, and list all filed
cdls() {
	cd $1;
	ls -al;
}

# Clear the ~/.python_history
pyh() {
	rm -f ~/.python_history
}

# Check an md5 checksum
md5check() {
	md5sum "$1" | grep "$2";
}

# Extract a compressed file
extract() {
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)    tar xjf $1    ;;
			*.tar.gz)     tar xzf $1    ;;
			*.bz2)        bunzip2 $1    ;;
			*.rar)        unrar e $1    ;;
			*.gz)         gunzip $1     ;;
			*.tar)        tar xf $1     ;;
			*.tbz2)       tar xjf $1    ;;
			*.tgz)        tar xzf $1    ;;
			*.zip)        unzip $1      ;;
			*.Z)          uncompress $1 ;;
			*.7z)         7z x $1       ;;
			*)            echo "'$1' cannot be extracted!"
		esac
	else
		echo "'$1' is not a valid file."
	fi
}

# Go up n (the argument) directories. 1 by default
up() {
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Create a http://git.io short url
gitio() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: 'gitio slug url'"
		return 1;
	fi;
	curl -i http://git.io/ -F "url=${2}" -F "code=${1}";
	echo "Done!"
}
