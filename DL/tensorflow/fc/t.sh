#!/bin/bash
start=`date +%s.%N`
mkdir multigpu-trained
CUDA_VISIBLE_DEVICES=$deviceId python fcn5_mnist.py  --batch_size=$batch_size --epochs=$epochs --device_id=0
end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo "finished with execute time: ${runtime}" 
rm -rf multigpu-trained
