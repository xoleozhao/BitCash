// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <nicknamedb.h>

#include <consensus/tx_verify.h>
#include <consensus/validation.h>
#include <fs.h>
#include <key_io.h>
#include <nicknames.h>
#include <protocol.h>
#include <serialize.h>
#include <sync.h>
#include <util.h>
#include <utiltime.h>
#include <wallet/wallet.h>

#include <atomic>

#include <boost/thread.hpp>

//
// NicknameBatch
//


bool NicknameBatch::WriteNameNick(const std::string& strNick,const CPubKey Address)
{
    return WriteIC(std::make_pair(std::string("nickname"), strNick), Address);
}

bool NicknameBatch::WriteNameNickAddr(const CPubKey Addr,const std::string& strNick)
{
    return WriteIC(std::make_pair(std::string("nickaddr"), Addr), strNick);
}

bool NicknameBatch::WriteHashForNameNick(const std::string& strNick,const uint256 hash)
{
    return WriteIC(std::make_pair(std::string("nickhash"), strNick), hash);
}

bool NicknameBatch::WriteInvalidForNameNick(const std::string& strNick,bool invalid)
{
    return WriteIC(std::make_pair(std::string("nickinvalid"), strNick), invalid);
}


bool NicknameBatch::WriteHashForNameNickAddr(const CPubKey Addr,const uint256 hash)
{
    return WriteIC(std::make_pair(std::string("addrhash"), Addr), hash);
}


bool NicknameBatch::EraseName(const std::string& strAddress)
{
    // This should only be used for sending addresses, never for receiving addresses,
    // receiving addresses must always have an address book entry if they're not change return.
    return EraseIC(std::make_pair(std::string("name"), strAddress));
}

class CWalletScanState {
public:
    unsigned int nKeys;
    unsigned int nCKeys;
    unsigned int nWatchKeys;
    unsigned int nKeyMeta;
    unsigned int m_unknown_records;
    bool fIsEncrypted;
    bool fAnyUnordered;
    int nFileVersion;
    std::vector<uint256> vWalletUpgrade;

    CWalletScanState() {
        nKeys = nCKeys = nWatchKeys = nKeyMeta = m_unknown_records = 0;
        fIsEncrypted = false;
        fAnyUnordered = false;
        nFileVersion = 0;
    }
};

static bool
ReadKeyValue(CDataStream& ssKey, CDataStream& ssValue,
             CWalletScanState &wss, std::string& strType, std::string& strErr)
{
    try {
        // Unserialize
        // Taking advantage of the fact that pair serialization
        // is just the two items serialized one after the other
        ssKey >> strType;
        if (strType == "nickname")
        {
            std::string strNickname;
            ssKey >> strNickname;
            ssValue >> mapNicknameBook[strNickname].pubkey;
        }
        else
        if (strType == "nickaddr")
        {
            CPubKey Nickaddr;
            ssKey >> Nickaddr;
            ssValue >> mapAddressForNicknameBook[Nickaddr].name;
        }
        else
        if (strType == "nickhash")
        {
            std::string strNickname;
            ssKey >> strNickname;
            ssValue >> mapNicknameBook[strNickname].hash;
        }
        else
        if (strType == "nickinvalid")
        {
            std::string strNickname;
            ssKey >> strNickname;
            ssValue >> mapNicknameBook[strNickname].invalid;
        }
        else
        if (strType == "addrhash")
        {
            CPubKey Nickaddr;
            ssKey >> Nickaddr;
            ssValue >> mapAddressForNicknameBook[Nickaddr].hash;
        }
        else {
            wss.m_unknown_records++;
        }
    } catch (...)
    {
        return false;
    }
    return true;
}

DBNICKErrors NicknameBatch::LoadWallet()
{
    CWalletScanState wss;
    bool fNoncriticalErrors = false;
    DBNICKErrors result = DBNICKErrors::LOAD_OK;

    try {

        // Get cursor
        Dbc* pcursor = m_batch.GetCursor();
        if (!pcursor)
        {
            LogPrintf("Error getting wallet database cursor\n");
            return DBNICKErrors::CORRUPT;
        }

        while (true)
        {
            // Read next record
            CDataStream ssKey(SER_DISK, CLIENT_VERSION);
            CDataStream ssValue(SER_DISK, CLIENT_VERSION);
            int ret = m_batch.ReadAtCursor(pcursor, ssKey, ssValue);
            if (ret == DB_NOTFOUND)
                break;
            else if (ret != 0)
            {
                LogPrintf("Error reading next record from wallet database\n");
                return DBNICKErrors::CORRUPT;
            }

            // Try to be tolerant of single corrupt records:
            std::string strType, strErr;
            if (!ReadKeyValue(ssKey, ssValue, wss, strType, strErr))
            {
                {
                    // Leave other errors alone, if we try to fix them we might make things worse.
                    fNoncriticalErrors = true; // ... but do warn the user there is something wrong.
                    // Rescan if there is a bad transaction record:
                    gArgs.SoftSetBoolArg("-rescan", true);
                }
            }
            if (!strErr.empty())
                LogPrintf("%s\n", strErr);
        }
        pcursor->close();
    }
    catch (const boost::thread_interrupted&) {
        throw;
    }
    catch (...) {
        result = DBNICKErrors::CORRUPT;
    }

    if (fNoncriticalErrors && result == DBNICKErrors::LOAD_OK)
        result = DBNICKErrors::NONCRITICAL_ERROR;

    // Any wallet corruption at all: skip any rewriting or
    // upgrading, we don't want to make it worse.
    if (result != DBNICKErrors::LOAD_OK)
        return result;

    return result;
}

void MaybeCompactNicknameDB()
{
/*    static std::atomic<bool> fOneThread(false);
    if (fOneThread.exchange(true)) {
        return;
    }
    if (!gArgs.GetBoolArg("-flushwallet", DEFAULT_FLUSHNICKWALLET)) {
        return;
    }

    for (CWallet* pwallet : GetWallets()) {
        NicknameDatabase& dbh = pwallet->GetDBHandle();

        unsigned int nUpdateCounter = dbh.nUpdateCounter;

        if (dbh.nLastSeen != nUpdateCounter) {
            dbh.nLastSeen = nUpdateCounter;
            dbh.nLastWalletUpdate = GetTime();
        }

        if (dbh.nLastFlushed != nUpdateCounter && GetTime() - dbh.nLastWalletUpdate >= 2) {
            if (BerkeleyBatch::PeriodicFlush(dbh)) {
                dbh.nLastFlushed = nUpdateCounter;
            }
        }
    }

    fOneThread = false;*/
}

//
// Try to (very carefully!) recover wallet file if there is a problem.
//
bool NicknameBatch::Recover(const fs::path& wallet_path, void *callbackDataIn, bool (*recoverKVcallback)(void* callbackData, CDataStream ssKey, CDataStream ssValue), std::string& out_backup_filename)
{
    return BerkeleyBatch::Recover(wallet_path, callbackDataIn, recoverKVcallback, out_backup_filename);
}

bool NicknameBatch::Recover(const fs::path& wallet_path, std::string& out_backup_filename)
{
    // recover without a key filter callback
    // results in recovering all record types
    return NicknameBatch::Recover(wallet_path, nullptr, nullptr, out_backup_filename);
}

bool NicknameBatch::VerifyEnvironment(const fs::path& wallet_path, std::string& errorStr)
{
    return BerkeleyBatch::VerifyEnvironment(wallet_path, errorStr);
}

bool NicknameBatch::VerifyDatabaseFile(const fs::path& wallet_path, std::string& warningStr, std::string& errorStr)
{
    return BerkeleyBatch::VerifyDatabaseFile(wallet_path, warningStr, errorStr, NicknameBatch::Recover);
}



