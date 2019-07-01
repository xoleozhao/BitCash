// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2015 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_KEY_IO_H
#define BITCASH_KEY_IO_H

#include <chainparams.h>
#include <key.h>
#include <pubkey.h>
#include <script/standard.h>
#include <interfaces/node.h>

#include <string>

extern CPubKey temppubkeyForBitCashAddress;
class CWallet;
class CPubKey;

CKey DecodeSecret(const std::string& str);
std::string EncodeSecret(const CKey& key);

CExtKey DecodeExtKey(const std::string& str);
std::string EncodeExtKey(const CExtKey& extkey);
CExtPubKey DecodeExtPubKey(const std::string& str);
std::string EncodeExtPubKey(const CExtPubKey& extpubkey);

std::string EncodeDestinationHasSecondKey(const CTxDestination& dest);
std::string EncodeDestination(const CTxDestination& dest,const CPubKey& key2);
std::string EncodeDestination(const CPubKey& key2);
CTxDestination DecodeDestination(const std::string& str);
CTxDestination DecodeDestinationNoNickname(const std::string& str);
CTxDestination PubKeyToDestination(CPubKey pkey);
CTxDestination GetDestinationforNickname(CPubKey pubkey, bool isnonprivatenickname, bool nicknamehasviewkey, CPubKey viewpubkey);

bool IsValidDestinationString(const std::string& str, const CChainParams& params);
bool IsValidDestinationString(const std::string& str);
bool IsValidDestinationStringNoNickname(const std::string& str);

#endif // BITCASH_KEY_IO_H
