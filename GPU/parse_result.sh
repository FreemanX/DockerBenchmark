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
echo ========4 matrix multiplication Gflops========
cat $filename | grep -A6 -- -------4 | grep Performance | cut -d'=' -f2 | cut -d' ' -f2
echo ========5 matrix transpose GB/s========
echo --------simple copy-------
cat $filename | grep -A20 -- -------5 | grep "simple copy" | cut -d'=' -f2 | cut -d' ' -f2

echo --------shared memory copy-------
cat $filename | grep -A20 -- -------5 | grep "shared memory copy" | cut -d'=' -f2 | cut -d' ' -f2
echo --------naive-------
cat $filename | grep -A20 -- -------5 | grep "naive" | cut -d'=' -f2 | cut -d' ' -f2
echo --------coalesced-------
cat $filename | grep -A20 -- -------5 | grep "coalesced" | cut -d'=' -f2 | cut -d' ' -f2
echo --------optimized-------
cat $filename | grep -A20 -- -------5 | grep "optimized" | cut -d'=' -f2 | cut -d' ' -f2
echo --------coarse-grained-------
cat $filename | grep -A20 -- -------5 | grep "coarse-grained" | cut -d'=' -f2 | cut -d' ' -f2
echo --------fine-grained-------
cat $filename | grep -A20 -- -------5 | grep "fine-grained" | cut -d'=' -f2 | cut -d' ' -f2
echo --------diagonal-------
cat $filename | grep -A20 -- -------5 | grep "diagonal" | cut -d'=' -f2 | cut -d' ' -f2
