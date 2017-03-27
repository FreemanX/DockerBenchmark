#!/bin/bash

testnum=20

CUDA_VISIBLE_DEVICES=2 
logfile=`hostname`_`date +"%F_%T"`_gpu$CUDA_VISIBLE_DEVICES\_benchmark.log
for ((i=0; i<$testnum; i++))
do
	echo =======Running benchmark GPU$CUDA_VISIBLE_DEVICES, RND $i=======
	echo "=======Running benchmark GPU$CUDA_VISIBLE_DEVICES, RND $i=======" &>> $logfile
	echo -------1 bandwidthTest-------- &>> $logfile
	CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES ./bandwidthTest &>> $logfile
	echo -------2 convolution operation------- &>> $logfile
	CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES ./convolutionSeparable &>> $logfile
	echo -------3 calculate histogram------- &>> $logfile
	CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES ./histogram &>> $logfile
	echo -------4 matrix multiplication------- &>> $logfile
	CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES ./matrixMulCUBLAS &>> $logfile
	echo -------5 matrix transpose------ &>> $logfile
	CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES ./transpose &>> $logfile
	echo Test $i on GPU$CUDA_VISIBLE_DEVICES done!
done

CUDA_VISIBLE_DEVICES=1
logfile=`hostname`_`date +"%F_%T"`_gpu$CUDA_VISIBLE_DEVICES\_benchmark.log
for ((i=0; i<$testnum; i++))
do
	echo =======Running benchmark GPU$CUDA_VISIBLE_DEVICES, RND $i=======
	echo "=======Running benchmark GPU$CUDA_VISIBLE_DEVICES, RND $i=======" &>> $logfile
	echo -------1 bandwidthTest-------- &>> $logfile
	CUDA_VISIBLE_DEVICES=1 ./bandwidthTest &>> $logfile
	echo -------2 convolution operation------- &>> $logfile
	CUDA_VISIBLE_DEVICES=1 ./convolutionSeparable &>> $logfile
	echo -------3 calculate histogram------- &>> $logfile
	CUDA_VISIBLE_DEVICES=1 ./histogram &>> $logfile
	echo -------4 matrix multiplication------- &>> $logfile
	CUDA_VISIBLE_DEVICES=1 ./matrixMulCUBLAS &>> $logfile
	echo -------5 matrix transpose------ &>> $logfile
	CUDA_VISIBLE_DEVICES=1 ./transpose &>> $logfile
	echo Test $i on GPU$CUDA_VISIBLE_DEVICES done!
done
