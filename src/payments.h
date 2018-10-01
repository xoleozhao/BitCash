// Copyright (c) 2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_PAYMENTS_H
#define BITCASH_PAYMENTS_H

#include <map>
#include <uint256.h>
#include <iostream>
#include <pubkey.h>

/** Address book data */
class CPaymentsBookData
{
public:
    std::string recipient, description,amount;

    int day, month;

    CPaymentsBookData() {}

};

extern std::map<std::string, CPaymentsBookData> mapPaymentsBook;

bool SetPayment(const std::string& strPayment,const std::string& recipient, const std::string& desc,const std::string& amount,int day,int month);
bool DeletePayment(const std::string& strPayment);
void InitPaymentsDB();



#endif // BITCASH_PAYMENTS_H
