// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <primitives/transaction.h>

#include <ctime>
#include <hash.h>
#include <chainparams.h>
#include <consensus/params.h>
#include <tinyformat.h>
#include <utilstrencodings.h>
#include <utilmoneystr.h>

bool userefline;
bool usenonprivacy;
bool usecurrency;
bool usemasterkeydummyonly;

std::string COutPoint::ToString() const
{
    return strprintf("COutPoint(%s, %u)", hash.ToString().substr(0,10), n);
}

CTxIn::CTxIn(COutPoint prevoutIn, CScript scriptSigIn, uint32_t nSequenceIn)
{
    isnickname = false;
    isnonprivatenickname = false;
    prevout = prevoutIn;
    scriptSig = scriptSigIn;
    nSequence = nSequenceIn;
    nickname = "";
    nicknamesig.clear();
    address = CPubKey();
    nicknamehasviewkey = false;
    viewpubkey = CPubKey();
}

CTxIn::CTxIn(uint256 hashPrevTx, uint32_t nOut, CScript scriptSigIn, uint32_t nSequenceIn)
{
    isnickname = false;
    isnonprivatenickname = false;
    prevout = COutPoint(hashPrevTx, nOut);
    scriptSig = scriptSigIn;
    nSequence = nSequenceIn;
    nickname = "";
    nicknamesig.clear();
    address = CPubKey();
    nicknamehasviewkey = false;
    viewpubkey = CPubKey();
}

CTxIn::CTxIn(std::string nick, CPubKey addr, bool isnonprivate, bool hasviewkey, CPubKey viewkey)
{
    isnickname = true;
    isnonprivatenickname = isnonprivate;
    prevout.hash=uint256S("0x0");
    prevout.n=0;
    scriptSig = CScript();
    nSequence=SEQUENCE_FINAL;   
    nickname = nick;
    address = addr;
    nicknamesig.clear();
    nicknamehasviewkey = hasviewkey;
    viewpubkey = viewkey;
}


std::string CTxIn::ToString() const
{
    std::string str;
    str += "CTxIn(";
    str += prevout.ToString();
    if (prevout.IsNull())
        str += strprintf(", coinbase %s", HexStr(scriptSig));
    else
        str += strprintf(", scriptSig=%s", HexStr(scriptSig).substr(0, 24));
    if (nSequence != SEQUENCE_FINAL)
        str += strprintf(", nSequence=%u", nSequence);
    str += ")";
    return str;
}

//CTxOut::CTxOut(const CAmount& nValueIn, CScript scriptPubKeyIn, std::string refererencelineIn, CPubKey senderPubKeyIn, CPubKey receiverPubKeyIn)
CTxOut::CTxOut(const CAmount& nValueIn, CScript scriptPubKeyIn, unsigned char curr)
{
    nValue = nValueIn;
    nValueBitCash = nValueIn;
    scriptPubKey = scriptPubKeyIn;
    currency = curr;
    isnonprivate = false;
    hasrecipientid = false;
    masterkeyisremoved = false;
    recipientid1 = 0;
    recipientid2 = 0;
  //  referenceline = refererencelineIn;
  //  senderPubKey = senderPubKeyIn;
  //  receiverPubKey = receiverPubKeyIn;
}

std::string CTxOut::ToString() const
{
    return strprintf("CTxOut(nValue=%d.%08d, scriptPubKey=%s, currency=%d.%08d)", nValue / COIN, nValue % COIN, HexStr(scriptPubKey).substr(0, 30),currency / COIN, currency % COIN);
}

CMutableTransaction::CMutableTransaction() : nVersion(CTransaction::CURRENT_VERSION), nLockTime(0) 
{
    //Do not create transactions with currency information until 2 minutes after the fork
    if (!ExistParams() || time(nullptr) < Params().GetConsensus().MASTERKEYDUMMY + 2 * 60) nVersion = CTransaction::OLD_VERSION;
}
CMutableTransaction::CMutableTransaction(const CTransaction& tx) : vin(tx.vin), vout(tx.vout), nVersion(tx.nVersion), nLockTime(tx.nLockTime) {}

uint256 CMutableTransaction::GetHash() const
{
    return SerializeHash(*this, SER_GETHASH, SERIALIZE_TRANSACTION_NO_WITNESS);
}

uint256 CTransaction::ComputeHash() const
{
    return SerializeHash(*this, SER_GETHASH, SERIALIZE_TRANSACTION_NO_WITNESS);
}

uint256 CTransaction::GetWitnessHash() const
{
    if (!HasWitness()) {
        return GetHash();
    }
    return SerializeHash(*this, SER_GETHASH, 0);
}

/* For backward compatibility, the hash is initialized to 0. TODO: remove the need for this default constructor entirely. */
CTransaction::CTransaction() : vin(), vout(), nVersion(CTransaction::CURRENT_VERSION), nLockTime(0), hash() {}
CTransaction::CTransaction(const CMutableTransaction &tx) : vin(tx.vin), vout(tx.vout), nVersion(tx.nVersion), nLockTime(tx.nLockTime), hash(ComputeHash()) {}
CTransaction::CTransaction(CMutableTransaction &&tx) : vin(std::move(tx.vin)), vout(std::move(tx.vout)), nVersion(tx.nVersion), nLockTime(tx.nLockTime), hash(ComputeHash()) {}

CAmount CTransaction::GetValueOutInCurrency(unsigned char currency, CAmount price) const
{
//std::cout << "INPUT Currency: " << (int)currency << std::endl;
    CAmount nValueOut = 0;
    for (const auto& tx_out : vout) {

//std::cout << "Output: " << FormatMoney(tx_out.nValue) << std::endl;
//std::cout << "Output Currency: " << (int)tx_out.currency << std::endl;

        CAmount value = tx_out.nValue;
        if (tx_out.currency != currency) {
                if (currency == 1 && tx_out.currency == 0) {
                    //Convert BitCash into Dollars
//std::cout << "Input BitCash: " << FormatMoney(tx_out.nValue) << std::endl;
                    value = (__int128_t)tx_out.nValue * (__int128_t)price / (__int128_t)COIN;
//std::cout << "Conv Dollars: " << FormatMoney(value) << std::endl;
                } else
		if (currency == 0 && tx_out.currency == 1) {
                    //Convert Dollars into BitCash
//std::cout << "Input Dollars: " << FormatMoney(tx_out.nValue) << std::endl;
                    value = (__int128_t)tx_out.nValue * (__int128_t)COIN / (__int128_t)price;
//std::cout << "Conv BitCash: " << FormatMoney(value) << std::endl;
                }
        }

        nValueOut += value;
        if (!MoneyRange(value) || !MoneyRange(nValueOut))
            throw std::runtime_error(std::string(__func__) + ": value out of range");
    }
    return nValueOut;
}

CAmount CTransaction::GetValueOut() const
{
    CAmount nValueOut = 0;
    for (const auto& tx_out : vout) {
        if (IsCoinBase() && tx_out.nValue == 2.15 * COIN && tx_out.nValueBitCash == -1) {
            //correct this, this happend due to a bug
            nValueOut += tx_out.nValue;
        } else
        nValueOut += tx_out.nValueBitCash;
        if (!MoneyRange(tx_out.nValue) || !MoneyRange(nValueOut))
            throw std::runtime_error(std::string(__func__) + ": value out of range");
    }
    return nValueOut;
}


unsigned int CTransaction::GetTotalSize() const
{
    return ::GetSerializeSize(*this, SER_NETWORK, PROTOCOL_VERSION);
}

std::string CTransaction::ToString() const
{
    std::string str;
    str += strprintf("CTransaction(hash=%s, ver=%d, vin.size=%u, vout.size=%u, nLockTime=%u)\n",
        GetHash().ToString().substr(0,10),
        nVersion,
        vin.size(),
        vout.size(),
        nLockTime);
    for (const auto& tx_in : vin)
        str += "    " + tx_in.ToString() + "\n";
    for (const auto& tx_in : vin)
        str += "    " + tx_in.scriptWitness.ToString() + "\n";
    for (const auto& tx_out : vout)
        str += "    " + tx_out.ToString() + "\n";
    return str;
}
