#!/usr/bin/sh
createlink () {
	convFn="$(echo "$1" | tr -d "[:punct:]" | tr "[:upper:]" "[:lower:]" | tr " " "-" | sed "s/-\+/-/g;s/\(^-\|-\$\)//g")"
	echo "./html/$convFn.html"
}


header="<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width initial-scale=1\"><link rel=\"stylesheet\" href=\"./css/style.css\"><title>bennett-song-library</title><meta name=\"description\" content=\"Bennett's Song Library\"></head><body><h1>Bennett's Song Library</h1><hr><div id=\"songs\"><h3>Songs:</h3><ul>"
echo $header > index.html

ls "./onsong" | while read line; do
	title="${line%".onsong"}"
	htmlpath="$(createlink "$title")"
	echo "<li><a href="$htmlpath">$title</a></li>" >> index.html
done

#ls "./pdf" | while read line; do
#	echo "<li><a href=\"./pdf/$line\">$line</a></li>" >> index.html
#done

footer="</ul></div></body></html>"
echo $footer >> index.html

