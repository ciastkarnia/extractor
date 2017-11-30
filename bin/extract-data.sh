#!/bin/bash

#############################################
# preparing global variables
file=${1}
correct_record_regexp="^(=>|[ ]*:).*"
car_record_regexp="^(=>).*"

if [ "x${file}" = "x" ] ; then
    echo "Wrong file ${file}!"
    exit 1
fi 


#############################################
# read file line by line

cat "${file}" | grep -v 'NAME' | while read record; do

    # preparing to get data
    if [[ "${record}" =~ $correct_record_regexp ]] ; then
        if [[ "${record}" =~ $car_record_regexp ]] ; then
            echo "${record}"

            brand=$(echo "${record}" | awk '{ print $2 }')
            model=$(echo "${record}" | awk '{ print $3 }')
            price=$(echo "${record}" | sed -e 's/.*(\([0-9]*\.\{0,1\}[0-9]*\)).*/\1/')
            date=$(echo "${record}" | sed -e 's/.*\([0-9]\{2,4\}\)r\..*/\1/')

            echo "${brand} | ${model} | ${version} | ${price} | ${date}"
        fi
    fi
done



#############################################

echo -e "Process status\t\t\t[done]"
exit 0
