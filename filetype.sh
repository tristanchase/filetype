#!/bin/bash

# filetype

# Returns single-byte indicator for file type (like ls -F).

for filename in "$@"; do

   if [[ -d ${filename} ]]; then	#directory
     echo -e "${filename} [/]"

   elif [[ -x ${filename} ]]; then	#executable
     echo -e "${filename} [*]"

   elif [[ -p ${filename} ]]; then	#pipe
     echo -e "${filename} [|]"

   elif [[ -L ${filename} ]]; then	#link
     echo -e "${filename} [@]"

   elif [[ -S ${filename} ]]; then	#socket
     echo -e "${filename} [=]"

   elif [[ -f ${filename} ]]; then	#file
     echo -e "${filename}"

   else
     echo -e "${filename} [?]"		#unknown

   fi
done

exit 0
