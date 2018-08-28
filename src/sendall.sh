a=$(./bitcash-cli getbalance)
echo $a
#./bitcash-cli sendtoaddress 3vwoeNpjLzaHdkC738ha6ijLJHsHVBFwguuM9LfSmLdKtW46SFYXTFdaXoyQou2VsCXm5S27y1prTQb $a "" "" "" true
./bitcash-cli sendtoaddress 45WosFXKXdvgg1GdYVbqiHgwwAT3RVj94p8aYEYzdBDVqhpUgtArj6JNb9kcf4RwpHLyDTr2ZZxXY1u $a "" "" "" true
./bitcash-cli generate 1
./bitcash-cli stop
sleep 10
./bitcashd -daemon
sleep 10
./bitcash-cli generate 1
./bitcash-cli stop
sleep 10
