#!/usr/bin/sh
createlink () {
	convFn="$(echo "$1" | tr -d "[:punct:]" | tr "[:upper:]" "[:lower:]" | tr " " "-" | sed "s/-\+/-/g;s/\(^-\|-\$\)//g")"
	echo "./html/$convFn.html"
}


ls "./onsong" | while read line; do 
	onsong="./onsong/$line"
	html="$(createlink "${line%".onsong"}")"
	onsong-parser-exe "$onsong" "$html"
done

