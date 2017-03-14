#!/bin/bash

if [ -z "$filename" ]
then
	echo "You need to pass the GPU log file name like:"
	echo "filename=<your file name> ./parse_result.sh"
fi

echo ========1 bandwidth test========
echo Host to Device
cat $filename | grep -A21 -- -------1 | grep -A3 "Host to Device" | grep 33554432 | cut -d$'\t' -f4
echo Device to Host
cat $filename | grep -A21 -- -------1 | grep -A3 "Device to Host" | grep 33554432 | cut -d$'\t' -f4
echo Device to Device
cat $filename | grep -A21 -- -------1 | grep -A3 "Device to Device" | grep 33554432 | cut -d$'\t' -f4
echo
echo ========2 convolution operation MPixels/sec========
cat $filename | grep -A11 -- -------2 | grep Throughput | cut -d'=' -f2 | cut -d' ' -f2
echo
echo ========3 histogram MB/s========
echo histogram64
cat $filename | grep -A45 -- -------3  | grep Throughput | grep histogram64 | cut -d'=' -f 2 | cut -d' ' -f2
echo histogram256
cat $filename | grep -A45 -- -------3  | grep Throughput | grep histogram256 | cut -d'=' -f 2 | cut -d' ' -f2
echo
echo ========4 matrix multiplication========
cat $filename | grep -A6 -- -------4 | grep Performance | cut -d'=' -f2 | cut -d' ' -f2
