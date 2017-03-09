#!/bin/bash

echo "[1] dd sequencial disk speed test... 1G file"
dd if=/dev/zero of=bigfile bs=64k count=16k conv=fdatasync
rm bigfile

echo "[2] ioping -c 10 IO latency test"
ioping -c 10 .

echo "[3] ioping cached IO random access test (5 sec)"
#ioping -C -q -i 0 -S 256m -w 5 .
ioping -C -R -w 5 .

echo "[4] ioping cached IO sequential access test (5 sec)"
#ioping -C -q -i 0 -S 256m -w 5 -s 1m .
ioping -C -RL -w 5 .

echo "[5] ioping direct IO random access test (5 sec)"
#ioping -D -q -i 0 -S 256m -w 5 .
ioping -D -R -w 5 .

echo "[6] ioping direct IO sequential access test (5 sec)"
#ioping -D -q -i 0 -S 256m -w 5 -s 1m .
ioping -D -RL -w 5 .
