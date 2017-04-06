#!/bin/bash

DLpath=`pwd`
tools=("caffe" "cntk" "mxnet"  "tensorflow"  "torch")
numEpochs=5

devId=0
for tool in "${tools[@]}" 
do
	cd $tool
	echo =======Benchmarking $tool=======
	batchSize=512
	echo -------fcn5 batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-fcn5-$batchSize-gpu$devId -batchSize $batchSize -network fcn5 -devId $devId -numEpochs $numEpochs -epochSize 60000 -gpuCount 1 -lr 0.05 -netType fc
	batchSize=1024
	echo -------fcn5 batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-fcn5-$batchSize-gpu$devId -batchSize $batchSize -network fcn5 -devId $devId -numEpochs $numEpochs -epochSize 60000 -gpuCount 1 -lr 0.05 -netType fc
	batchSize=2048
	echo -------fcn5 batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-fcn5-$batchSize-gpu$devId -batchSize $batchSize -network fcn5 -devId $devId -numEpochs $numEpochs -epochSize 60000 -gpuCount 1 -lr 0.05 -netType fc


	batchSize=256
	echo -------alexnet batchSize=$batchSize------
	python ${tool}bm.py -log $tool-alexnet-$batchSize-gpu$devId -batchSize $batchSize -network alexnet -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.05 -netType cnn
	batchSize=512
	echo -------alexnet batchSize=$batchSize------
	python ${tool}bm.py -log $tool-alexnet-$batchSize-gpu$devId -batchSize $batchSize -network alexnet -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.05 -netType cnn
	batchSize=1024
	echo -------alexnet batchSize=$batchSize------
	python ${tool}bm.py -log $tool-alexnet-$batchSize-gpu$devId -batchSize $batchSize -network alexnet -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.05 -netType cnn


	batchSize=16
	echo -------resnet batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-resnet-$batchSize-gpu$devId -batchSize $batchSize -network resnet  -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.01 -netType cnn
	batchSize=32
	echo -------resnet batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-resnet-$batchSize-gpu$devId -batchSize $batchSize  -network resnet  -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.01 -netType cnn
	batchSize=64
	echo -------resnet batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-resnet-$batchSize-gpu$devId -batchSize $batchSize  -network resnet  -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.01 -netType cnn



	if [ ${tool} != "caffe" ] 
	then
		batchSize=128
		echo -------lstm128-------
		python ${tool}bm.py -log $tool-lstm-$batchSize-gpu$devId -batchSize $batchSize -network lstm -devId $devId -numEpochs $numEpochs -epochSize -1 -gpuCount 1 -lr 0.01 -netType rnn
		batchSize=256
		echo -------lstm256-------
		python ${tool}bm.py -log $tool-lstm-$batchSize-gpu$devId -batchSize $batchSize -network lstm -devId $devId -numEpochs $numEpochs -epochSize -1 -gpuCount 1 -lr 0.01 -netType rnn
		batchSize=512
		echo -------lstm512-------
		python ${tool}bm.py -log $tool-lstm-$batchSize-gpu$devId -batchSize $batchSize -network lstm -devId $devId -numEpochs $numEpochs -epochSize -1 -gpuCount 1 -lr 0.01 -netType rnn
	fi

	cd $DLpath
done


devId=2
for tool in "${tools[@]}" 
do
	cd $tool
	echo =======Benchmarking $tool=======
	batchSize=512
	echo -------fcn5 batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-fcn5-$batchSize-gpu$devId -batchSize $batchSize -network fcn5 -devId $devId -numEpochs $numEpochs -epochSize 60000 -gpuCount 1 -lr 0.05 -netType fc
	batchSize=1024
	echo -------fcn5 batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-fcn5-$batchSize-gpu$devId -batchSize $batchSize -network fcn5 -devId $devId -numEpochs $numEpochs -epochSize 60000 -gpuCount 1 -lr 0.05 -netType fc
	batchSize=2048
	echo -------fcn5 batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-fcn5-$batchSize-gpu$devId -batchSize $batchSize -network fcn5 -devId $devId -numEpochs $numEpochs -epochSize 60000 -gpuCount 1 -lr 0.05 -netType fc


	batchSize=256
	echo -------alexnet batchSize=$batchSize------
	python ${tool}bm.py -log $tool-alexnet-$batchSize-gpu$devId -batchSize $batchSize -network alexnet -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.05 -netType cnn
	batchSize=512
	echo -------alexnet batchSize=$batchSize------
	python ${tool}bm.py -log $tool-alexnet-$batchSize-gpu$devId -batchSize $batchSize -network alexnet -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.05 -netType cnn
	batchSize=1024
	echo -------alexnet batchSize=$batchSize------
	python ${tool}bm.py -log $tool-alexnet-$batchSize-gpu$devId -batchSize $batchSize -network alexnet -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.05 -netType cnn


	batchSize=16
	echo -------resnet batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-resnet-$batchSize-gpu$devId -batchSize $batchSize -network resnet  -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.01 -netType cnn
	batchSize=32
	echo -------resnet batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-resnet-$batchSize-gpu$devId -batchSize $batchSize  -network resnet  -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.01 -netType cnn
	batchSize=64
	echo -------resnet batchSize=$batchSize-------
	python ${tool}bm.py -log $tool-resnet-$batchSize-gpu$devId -batchSize $batchSize  -network resnet  -devId $devId -numEpochs $numEpochs -epochSize 50000 -gpuCount 1 -lr 0.01 -netType cnn



	if [ ${tool} != "caffe" ] 
	then
		batchSize=128
		echo -------lstm128-------
		python ${tool}bm.py -log $tool-lstm-$batchSize-gpu$devId -batchSize $batchSize -network lstm -devId $devId -numEpochs $numEpochs -epochSize -1 -gpuCount 1 -lr 0.01 -netType rnn
		batchSize=256
		echo -------lstm256-------
		python ${tool}bm.py -log $tool-lstm-$batchSize-gpu$devId -batchSize $batchSize -network lstm -devId $devId -numEpochs $numEpochs -epochSize -1 -gpuCount 1 -lr 0.01 -netType rnn
		batchSize=512
		echo -------lstm512-------
		python ${tool}bm.py -log $tool-lstm-$batchSize-gpu$devId -batchSize $batchSize -network lstm -devId $devId -numEpochs $numEpochs -epochSize -1 -gpuCount 1 -lr 0.01 -netType rnn
	fi

	cd $DLpath
done


