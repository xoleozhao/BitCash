// Copyright (c) 2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <payments.h>
#include <paymentsdb.h>

#include <string>
#include <boost/algorithm/string/case_conv.hpp> 

std::unique_ptr<PaymentsDatabase> pdatabase;
std::map<std::string, CPaymentsBookData> mapPaymentsBook;
std::map<std::string, COrdersBookData> mapOrdersBook;

void InitPaymentsDB()
{
   fs::path path=GetDataDir();
   path /= "Payments";
    pdatabase=PaymentsDatabase::Create(path);
    DBNICKErrors nLoadWalletRet = PaymentsBatch(*pdatabase,"cr+").LoadWallet();
}

bool SetPayment(const std::string& strPayment,const std::string& recipient, const std::string& desc,const std::string& amount,int day,int month, unsigned char currency)
{
    mapPaymentsBook[strPayment].recipient = recipient;
    mapPaymentsBook[strPayment].description = desc;
    mapPaymentsBook[strPayment].amount = amount;
    mapPaymentsBook[strPayment].day = day;
    mapPaymentsBook[strPayment].month = month;
    mapPaymentsBook[strPayment].currency = currency;

    bool valid=true;
    if (!PaymentsBatch(*pdatabase).WriteNamePaymentRecipient(strPayment, recipient)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNamePaymentDesc(strPayment, desc)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNamePaymentAmount(strPayment, amount)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNamePaymentDay(strPayment, day)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNamePaymentMonth(strPayment, month)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNamePaymentCurrency(strPayment, currency)) valid = false;

    return valid;
}

bool DeletePayment(const std::string& strPayment)
{
    mapPaymentsBook.erase(strPayment);

    bool valid=true;
    if (!PaymentsBatch(*pdatabase).EraseNamePayment(strPayment)) valid = false;

    return valid;
}

bool SetOrder(const std::string& strOrder, const std::string& amounttosend, const std::string& targetPrice, bool senddollar, bool whenpricegoesabove)
{
    mapOrdersBook[strOrder].amounttosend = amounttosend;
    mapOrdersBook[strOrder].targetPrice = targetPrice;
    mapOrdersBook[strOrder].senddollar = senddollar;
    mapOrdersBook[strOrder].whenpricegoesabove = whenpricegoesabove;

    bool valid=true;
    if (!PaymentsBatch(*pdatabase).WriteNameOrderamounttosend(strOrder, amounttosend)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNameOrdertargetPrice(strOrder, targetPrice)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNameOrdersenddollar(strOrder, senddollar)) valid = false;
    if (!PaymentsBatch(*pdatabase).WriteNameOrderwhenpricegoesabove(strOrder, whenpricegoesabove)) valid = false;

    return valid;
}

bool DeleteOrder(const std::string& strOrder)
{
    mapOrdersBook.erase(strOrder);

    bool valid=true;
    if (!PaymentsBatch(*pdatabase).EraseNameOrder(strOrder))valid=false;

    return valid;
}

