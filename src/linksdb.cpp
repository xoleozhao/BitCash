// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2018 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <linksdb.h>

#include <consensus/tx_verify.h>
#include <consensus/validation.h>
#include <fs.h>
#include <key_io.h>
#include <links.h>
#include <protocol.h>
#include <serialize.h>
#include <sync.h>
#include <util.h>
#include <utiltime.h>
#include <wallet/wallet.h>

#include <atomic>

#include <boost/thread.hpp>

//
// LinksBatch
//


bool LinksBatch::WriteNameLinkDesc(const std::string& strlink,const std::string& desc)
{
    return WriteIC(std::make_pair(std::string("desc"), strlink), desc);
}

bool LinksBatch::WriteNameLinkAmount(const std::string& strlink,const std::string& amount)
{
    return WriteIC(std::make_pair(std::string("amount"), strlink), amount);
}

bool LinksBatch::WriteNameLinkStatus(const std::string& strlink,int status)
{
    return WriteIC(std::make_pair(std::string("status"), strlink), status);
}

bool LinksBatch::WriteNameLinkTimestamp(const std::string& strlink,uint64_t timestamp)
{
    return WriteIC(std::make_pair(std::string("timestamp"), strlink), timestamp);
}

bool LinksBatch::WriteNameLinkCurrency(const std::string& strlink,unsigned char currency)
{
    return WriteIC(std::make_pair(std::string("currency"), strlink), currency);
}

bool LinksBatch::EraseNameLink(const std::string& strlink)
{
    bool valid=true;
    if (!EraseIC(std::make_pair(std::string("desc"), strlink)))valid=false;
    if (!EraseIC(std::make_pair(std::string("amount"), strlink)))valid=false;
    if (!EraseIC(std::make_pair(std::string("status"), strlink)))valid=false;
    if (!EraseIC(std::make_pair(std::string("timestamp"), strlink)))valid=false;
    if (!EraseIC(std::make_pair(std::string("currency"), strlink)))valid=false;      
    return valid;
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
        if (strType == "desc")
        {
            std::string strLinks;
            ssKey >> strLinks;
            ssValue >> mapLinksBook[strLinks].description;
        }
        else
        if (strType == "amount")
        {
            std::string strLinks;
            ssKey >> strLinks;            
            ssValue >> mapLinksBook[strLinks].amount;
        }
        else
        if (strType == "status")
        {
            std::string strLinks;
            ssKey >> strLinks;
            ssValue >> mapLinksBook[strLinks].status;
        }
        else
        if (strType == "timestamp")
        {
            std::string strLinks;
            ssKey >> strLinks;
            ssValue >> mapLinksBook[strLinks].timestamp;
        }
        else
        if (strType == "currency")
        {
            std::string strLinks;
            ssKey >> strLinks;
            ssValue >> mapLinksBook[strLinks].currency;
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

DBNICKErrors LinksBatch::LoadWallet()
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

void MaybeCompactLinksDB()
{
/*    static std::atomic<bool> fOneThread(false);
    if (fOneThread.exchange(true)) {
        return;
    }
    if (!gArgs.GetBoolArg("-flushwallet", DEFAULT_FLUSHNICKWALLET)) {
        return;
    }

    for (CWallet* pwallet : GetWallets()) {
        LinksDatabase& dbh = pwallet->GetDBHandle();

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
bool LinksBatch::Recover(const fs::path& wallet_path, void *callbackDataIn, bool (*recoverKVcallback)(void* callbackData, CDataStream ssKey, CDataStream ssValue), std::string& out_backup_filename)
{
    return BerkeleyBatch::Recover(wallet_path, callbackDataIn, recoverKVcallback, out_backup_filename);
}

bool LinksBatch::Recover(const fs::path& wallet_path, std::string& out_backup_filename)
{
    // recover without a key filter callback
    // results in recovering all record types
    return LinksBatch::Recover(wallet_path, nullptr, nullptr, out_backup_filename);
}

bool LinksBatch::VerifyEnvironment(const fs::path& wallet_path, std::string& errorStr)
{
    return BerkeleyBatch::VerifyEnvironment(wallet_path, errorStr);
}

bool LinksBatch::VerifyDatabaseFile(const fs::path& wallet_path, std::string& warningStr, std::string& errorStr)
{
    return BerkeleyBatch::VerifyDatabaseFile(wallet_path, warningStr, errorStr, LinksBatch::Recover);
}



