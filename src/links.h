// Copyright (c) 2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_LINKS_H
#define BITCASH_LINKS_H

#include <map>
#include <uint256.h>
#include <iostream>
#include <pubkey.h>

/** Address book data */
class CLinksBookData
{
public:
    std::string link, description,amount;
    int status;
    uint64_t timestamp;
    unsigned char currency;

    CLinksBookData() {}

};

extern std::map<std::string, CLinksBookData> mapLinksBook;

bool SetLink(const std::string& strlink,const std::string& desc,const std::string& amount,int status,uint64_t timestamp, unsigned char currency);
bool DeleteLink(const std::string& strlink);
void InitLinksDB();



#endif // BITCASH_LINKS_H
