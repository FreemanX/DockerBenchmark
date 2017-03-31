#!/bin/bash

if [ -z "$filename" ]
then
	echo "You need to pass the IO log file name like:"
	echo "filename=<your file name> ./parse_result.sh"
	exit 1
fi

echo "======Input file: $filename====="
for ((i=1; i<5; i++))
do
	cat $filename | grep "\[$i\]" | uniq
	cat $filename | grep "\[$i\]" -A3 | grep bytes | cut -d',' -f3 | cut -d' ' -f2
done
