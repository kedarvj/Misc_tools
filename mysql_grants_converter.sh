#!/bin/bash
# User Grants Converter Script
# Authors: Kedar Vaijanapurkar
# GitHub: https://github.com/kedarvj
# Website: https://kedar.nitty-witty.com/blog
# Description: This script converts pt-show-grants output from MySQL 5.7 to make it compatible with MySQL 8.
# 

input_file="oldgrants"
output_file="newgrants"
>$output_file
input_file="${1:-'oldgrants'}"


while IFS= read -r line; do
    if [[ $line == *" IDENTIFIED BY PASSWORD "* ]]; then
      if [[ $line == *"WITH GRANT OPTION"* ]]; then
        line=$(echo "$line" | sed 's/ WITH GRANT OPTION//')
        withgrant=" WITH GRANT OPTION ";
      fi
        # Split the line into 4 parts based on specified keywords
        privileges=$(echo "$line" | awk -F 'GRANT ' '{print $2}' | awk -F ' ON ' '{print $1}')
        dbtbl=$(echo "$line" | awk -F ' ON ' '{print $2}' | awk -F ' TO ' '{print $1}')
        user=$(echo "$line" | awk -F ' TO ' '{print $2}' | awk -F ' IDENTIFIED ' '{print $1}')
        password=$(echo "$line" | awk -F 'PASSWORD ' '{print $2}' | awk -F ';' '{print $1}')
        #echo ">>>>>>>>   $privileges, $dbtbl, $user, $password"
        echo "CREATE USER $user IDENTIFIED BY $password;" >> "$output_file"
        echo "GRANT $privileges ON $dbtbl TO $user $withgrant;" >> "$output_file"
    else
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
echo "Conversion complete. Output written to $output_file."
