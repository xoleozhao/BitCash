// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <primitives/block.h>

#include <hash.h>
#include <tinyformat.h>
#include <utilstrencodings.h>
#include <crypto/common.h>

bool isX16Ractive(int32_t nVersion)
{
    return ((nVersion & hashx16Ractive) != 0);
}

bool isstabletimeactive(int32_t nVersion)
{
    return ((nVersion & stabletimeactive) != 0);
}

CAmount CBlockHeader::GetPriceinCurrency(unsigned char currency) const
{
    if (currency > nPriceInfo.priceCount - 1) currency = nPriceInfo.priceCount - 1;
    CAmount d1 = abs(nPriceInfo.prices[currency]-nPriceInfo2.prices[currency]);
    CAmount d2 = abs(nPriceInfo2.prices[currency]-nPriceInfo3.prices[currency]);
    CAmount d3 = abs(nPriceInfo.prices[currency]-nPriceInfo3.prices[currency]);
    if (d1 <= d2 && d1 <= d3) {
        return (nPriceInfo.prices[currency]-nPriceInfo2.prices[currency]) / 2 + nPriceInfo2.prices[currency];
    } else
    if (d2 <= d1 && d2 <= d3) {
        return (nPriceInfo2.prices[currency]-nPriceInfo3.prices[currency]) / 2 + nPriceInfo3.prices[currency];
    } else {
        return (nPriceInfo.prices[currency]-nPriceInfo3.prices[currency]) / 2 + nPriceInfo3.prices[currency];
    }
}

uint256 CBlockHeader::GetHash() const
{
    if ( isX16Ractive(this->nVersion)) {
        return HashX16R(BEGIN(nVersion), END(nNonce), hashPrevBlock);
    } else {
        return SerializeHash(*this);    
    }
}

std::string CBlock::ToString() const
{
    std::stringstream s;
    s << strprintf("CBlock(hash=%s, ver=0x%08x, hashPrevBlock=%s, hashMerkleRoot=%s, nTime=%u, nBits=%08x, nNonce=%u, nEdgeBits=%d, vtx=%u, priceTime=%u, priceusdValue=%15.9f, priceTime2=%u, priceusdValue2=%15.9f, priceTime3=%u, priceusdValue3=%15.9f)\n",
        GetHash().ToString(),
        nVersion,
        hashPrevBlock.ToString(),
        hashMerkleRoot.ToString(),
        nTime, nBits, nNonce,
        nEdgeBits,
        vtx.size(),
        nPriceInfo.priceTime,
        nPriceInfo.prices[0],
        nPriceInfo2.priceTime,
        nPriceInfo2.prices[0],
        nPriceInfo3.priceTime,
        nPriceInfo3.prices[0]);
    for (const auto& tx : vtx) {
        s << "  " << tx->ToString() << "\n";
    }

    return s.str();
}
