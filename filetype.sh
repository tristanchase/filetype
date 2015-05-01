#!/bin/bash

# filetype

# Returns single-byte indicator for file type (like ls -F).

for filename in "$@"; do
   if [[ -d ${filename} ]]; then
     echo -e "${filename} [/]"
   elif [[ -x ${filename} ]]; then
     echo -e "${filename} [*]"
   elif [[ -p ${filename} ]]; then
     echo -e "${filename} [|]"
   elif [[ -L ${filename} ]]; then
     echo -e "${filename} [@]"
   elif [[ -S ${filename} ]]; then
     echo -e "${filename} [=]"
   elif [[ -f ${filename} ]]; then
     echo -e "${filename}"
   else
     echo "${filename} [?]"
   fi
done

exit 0
