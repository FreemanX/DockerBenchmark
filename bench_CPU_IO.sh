bench_root=`pwd`
mkdir logs
echo ================Benchmark Start===================
echo
#echo --------Benchmark IO performance-----------
#logname=IO_benchmark_result`date +"%F_%T"`.log
#$bench_root/IO/iobench.sh &> $logname
#cat $logname
#mv $logname logs
#echo done!
#echo
#echo --------Benchmark CPU performance with linpack-----------
#logname=linpack_benchmark_result_`date +"%F_%T"`.log
#cd $bench_root/CPU/linpack
#./runme_xeon64 &> $logname
#cat $logname
#mv $logname $bench_root/logs
#cd $bench_root
#echo done!
#echo
echo --------Benchmark CPU performance with hpcg-----------
$bench_root/CPU/hpcg/bin/xhpcg_avx --n=192 --t=1800
mv *.txt logs
mv *.yaml logs
echo done!
