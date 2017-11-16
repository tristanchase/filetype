#!/bin/bash

# filetype

# Returns single-byte indicator for file type (like ls -F).

for filename in "$@"; do

   if [[ -d ${filename} ]]; then	#directory
     echo -e "${filename}\t[/]"

   elif [[ -x ${filename} ]]; then	#executable
     echo -e "${filename}\t[*]"

   elif [[ -p ${filename} ]]; then	#pipe
     echo -e "${filename}\t[|]"

   elif [[ -L ${filename} ]]; then	#link
     echo -e "${filename}\t[@] -> `readlink ${filename}`"

   elif [[ -S ${filename} ]]; then	#socket
     echo -e "${filename}\t[=]"

   elif [[ -f ${filename} ]]; then	#file
     echo -e "${filename}"

   else
     echo -e "${filename}\t[?]"		#unknown

   fi
done

exit 0
