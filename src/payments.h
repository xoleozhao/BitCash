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
    unsigned char currency;

    CPaymentsBookData() {}

};

class COrdersBookData
{
public:
    std::string amounttosend, targetPrice; 
    bool senddollar, whenpricegoesabove;

    COrdersBookData() {}

};


extern std::map<std::string, CPaymentsBookData> mapPaymentsBook;
extern std::map<std::string, COrdersBookData> mapOrdersBook;

bool SetPayment(const std::string& strPayment, const std::string& recipient, const std::string& desc, const std::string& amount, int day, int month, unsigned char currency);
bool DeletePayment(const std::string& strPayment);
bool SetOrder(const std::string& strOrder, const std::string& amounttosend, const std::string& targetPrice, bool senddollar, bool whenpricegoesabove);
bool DeleteOrder(const std::string& strOrder);
void InitPaymentsDB();



#endif // BITCASH_PAYMENTS_H
