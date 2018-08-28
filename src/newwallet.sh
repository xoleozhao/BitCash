rm ~/.bitcash/wallet.dat
./bitcashd -daemon
sleep 10
./bitcash-cli importprivkey UvrkaRFq2j8M6z7LwaXZvy1bGSjbH7S3BGWEvcJsy1oo4K3GUPDR
./bitcash-cli getbalance
