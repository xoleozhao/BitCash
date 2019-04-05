./bitcash-cli -testnet sendtoaddress HRSSkmB1vE6yp4dxsjYAKB6PBWWg3ssHN4DS3ntZABhTC1eBCTeF 0.1 > txid.txt
./bitcash-cli -testnet getrawtransaction "$(< txid.txt)" true
