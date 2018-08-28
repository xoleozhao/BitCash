// Copyright (c) 2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_NICKNAMES_H
#define BITCASH_NICKNAMES_H

#include <map>
#include <uint256.h>
#include <iostream>
#include <pubkey.h>

/** Address book data */
class CNicknameBookData
{
public:
    CPubKey pubkey;
    uint256 hash;
    bool invalid;

    CNicknameBookData() {}

};

class CNicknameAddrBookData
{
public:
    std::string name;
    uint256 hash;

    CNicknameAddrBookData() {}

};

extern std::map<std::string, CNicknameBookData> mapNicknameBook;
extern std::map<CPubKey, CNicknameAddrBookData> mapAddressForNicknameBook;

bool SetNickname(const std::string& strName,const CPubKey address, uint256 hash, bool storeblockhash);
bool DeleteNickname(const std::string& strName,const CPubKey address);
CPubKey GetAddressForNickname(std::string nick);
bool DoesNicknameExist(std::string nick);
std::string GetNicknameForAddress(CPubKey address);
uint256 GetHashForNickname(std::string nick);
uint256 GetHashForAddress(CPubKey address);
void InitNicknameDB();
void DeleteAllNicknames();



#endif // BITCASH_NICKNAMES_H
