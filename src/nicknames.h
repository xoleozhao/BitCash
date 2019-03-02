// Copyright (c) 2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_NICKNAMES_H
#define BITCASH_NICKNAMES_H

#include <map>
#include <uint256.h>
#include <iostream>
#include <pubkey.h>

class CScript;

/** Address book data */
class CNicknameBookData
{
public:
    CPubKey pubkey;
    uint256 hash;
    bool invalid;
    bool isnonprivate;

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
extern std::map<CScript, CPubKey> stealthaddresses;
extern std::map<std::string, std::string> reflines;

bool SetStealthAddress(const CScript script,const CPubKey address);
bool SetRefLines(const std::string encryptedref,const std::string decryptedref);

bool SetNickname(const std::string& strName,const CPubKey address, uint256 hash, bool storeblockhash, bool isnonprivate);
bool DeleteNickname(const std::string& strName,const CPubKey address);
CPubKey GetAddressForNickname(std::string nick);
bool DoesNicknameExist(std::string nick);
std::string GetNicknameForAddress(CPubKey address);
uint256 GetHashForNickname(std::string nick);
bool IsNonPrivateNickname(std::string nick);
uint256 GetHashForAddress(CPubKey address);
void InitNicknameDB();
void DeleteAllNicknames();



#endif // BITCASH_NICKNAMES_H
