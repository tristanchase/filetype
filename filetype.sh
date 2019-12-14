#!/bin/bash

# filetype

# Returns single-byte indicator (tab-separated and bracketed) for file type (like ls -F).  Also adds backslash escapes to filenames containing spaces.

set -eu
IFS="$(printf '\n\t')"

for filename in "$@"; do

	if [[ -L $filename ]]; then					#link
		echo -e "$(echo $filename | sed 's/ /\\ /g')\t[@] -> $(readlink $filename | sed 's/ /\\ /g')"

	elif [[ -d $filename ]]; then					#directory
		echo -e "$(echo $filename | sed 's/ /\\ /g')\t[/]"

	elif [[ -x $filename ]]; then					#executable
		echo -e "$(echo $filename | sed 's/ /\\ /g')\t[*]"

	elif [[ -p $filename ]]; then					#pipe
		echo -e "$(echo $filename | sed 's/ /\\ /g')\t[|]"

	elif [[ -S $filename ]]; then					#socket
		echo -e "$(echo $filename | sed 's/ /\\ /g')\t[=]"

	elif [[ -f $filename ]]; then					#regular file
		echo -e "$(echo $filename | sed 's/ /\\ /g')"

	else
		echo -e "$(echo $filename | sed 's/ /\\ /g')\t[?]"	#unknown

	fi
done

exit 0
