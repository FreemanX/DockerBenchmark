#!/bin/bash

if [ -z "$filename" ]
then
	echo "You need to pass the IO log file name like:"
	echo "filename=<your file name> ./parse_result.sh"
	exit 1
fi

echo caffe 
#echo caffe fcn
cat $filename | grep caffe -A27 | grep fcn -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo caffe alexnet
cat $filename | grep caffe -A27 | grep alexnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo caffe resnet
cat $filename | grep caffe -A27 | grep resnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo ============================


echo cntk fcn
cat $filename | grep cntk -A35 | grep fcn -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo alexnet
cat $filename | grep cntk -A35 | grep alexnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo resnet
cat $filename | grep cntk -A35 | grep resnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo lstm
cat $filename | grep cntk -A35 | grep lstm -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
echo ============================


echo mxnet fcn
cat $filename | grep mxnet -A24 | grep fcn -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo alexnet
cat $filename | grep mxnet -A24 | grep alexnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo resnet
cat $filename | grep mxnet -A24 | grep resnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#$echo lstm
cat $filename | grep mxnet -A24 | grep lstm -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
echo ============================


echo tensorflow fcn
cat $filename | grep tensorflow -A35 | grep fcn -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo alexnet
cat $filename | grep tensorflow -A35 | grep alexnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo resnet
cat $filename | grep tensorflow -A35 | grep resnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo lstm
cat $filename | grep tensorflow -A35 | grep lstm -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
echo ============================


echo torch fcn
cat $filename | grep torch -A24 | grep fcn -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo alexnet
cat $filename | grep torch -A24 | grep alexnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo resnet
cat $filename | grep torch -A24 | grep resnet -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
#echo lstm
cat $filename | grep torch -A24 | grep lstm -A1 | grep I | cut -d'a' -f2 | cut -d' ' -f2
echo ============================
