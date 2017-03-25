#!/bin/bash

if [ -z "$filename" ]
then
	echo "You need to pass the IO log file name like:"
	echo "filename=<your file name> ./parse_result.sh"
	exit 1
fi

echo "======Input file: $filename====="

echo -----dd sequencial access 1GB file speed #unit:MB/s
cat $filename | grep 1073741824 | cut -d',' -f3 | cut -d' ' -f2

echo -----IO latency test 
cat  $filename | grep "IO latency" -A15 | grep min\/ | cut -d'=' -f2 | cut -d'/' -f2 | cut -d' ' -f2

echo -----Cache IO random access test
cat $filename | grep "ioping cached IO random" -A5 | grep generated | cut -d',' -f4 | cut -d' ' -f2

echo -----Cache IO sequencial access test
cat $filename | grep "ioping cached IO sequen" -A5 | grep generated | cut -d',' -f4 | cut -d' ' -f2

echo -----Direct IO random access test
cat $filename | grep "ioping direct IO random" -A5 | grep generated | cut -d',' -f4 | cut -d' ' -f2

echo -----Direct IO sequencial access test
cat $filename | grep "ioping direct IO sequen" -A5 | grep generated | cut -d',' -f4 | cut -d' ' -f2
