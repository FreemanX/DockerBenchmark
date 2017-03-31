
for ((i=0; i<20; i++))
do
	echo "[1] dd sequencial disk speed test... 1M file"
	dd if=/dev/zero of=bigfile bs=64k count=16 conv=fdatasync
	rm bigfile
	
	echo "[2] dd sequencial disk speed test... 100M file"
	dd if=/dev/zero of=bigfile bs=64k count=1600 conv=fdatasync
	rm bigfile
	
	echo "[3] dd sequencial disk speed test... 500M file"
	dd if=/dev/zero of=bigfile bs=64k count=8k conv=fdatasync
	rm bigfile
	
	echo "[4] dd sequencial disk speed test... 1G file"
	dd if=/dev/zero of=bigfile bs=64k count=16k conv=fdatasync
	rm bigfile
done
