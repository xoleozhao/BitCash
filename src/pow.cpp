// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <pow.h>

#include "arith_uint256.h"
#include "chain.h"
#include "cuckoo/miner.h"
#include "primitives/block.h"
#include "uint256.h"
#include "util.h"

using Consensus::PoW;


//uses the "Virtual Time Span Retargeting Algorithm", developed by the BitCash developers to retarget the nbits after every block
PoW GetNextWorkRequired(const CBlockIndex* pindexLast, const CBlockHeader* pblock, const Consensus::Params& params)
{
    assert(pindexLast != nullptr);


    const arith_uint256 bnPowLimit = UintToArith256(params.powLimit.uHashLimit);
    int64_t nPastBlocks = 24;

    // make sure we have at least (nPastBlocks + 1) blocks, otherwise just return powLimit
    if (!pindexLast || pindexLast->nHeight < nPastBlocks) {
        return PoW{bnPowLimit.GetCompact(),pindexLast->nEdgeBits};
    }

    arith_uint256 bnTargetNow = arith_uint256().SetCompact(pindexLast->nBits);    

    const CBlockIndex *pindex = pindexLast;

    int64_t lasttime,currenttime,virtualtimespan;
    arith_uint256 LastbnTarget;    

    virtualtimespan=0;
    lasttime=0;
    currenttime=0;

    //Calculate a "virtual time span". 
    //This means we try to calculate how much time it would have taken to calculate all 24 block, 
    //if the difficulty would have been the difficulty of the last block all the time
    for (unsigned int nCountBlocks = 1; nCountBlocks <= nPastBlocks; nCountBlocks++) {
        arith_uint256 bnTarget = arith_uint256().SetCompact(pindex->nBits);
        currenttime = pindex->GetBlockTime();
        if (pindex->nEdgeBits!=pindexLast->nEdgeBits){
            //do not change anything for 24 blocks after nEdgeBits has changed
            return PoW{pindexLast->nBits, pindexLast->nEdgeBits};
        }

        if (nCountBlocks == 1) {
            lasttime = currenttime;
            LastbnTarget=bnTarget;
        } else {
            arith_uint256 bnNew(LastbnTarget);
            arith_uint256 bnNew2(bnTargetNow);

            //(lasttime-currenttime) is the real time between the two block
            //we multiply it with the old diff target back then and divide through the current diff target
            //this gives us the time it would have taken to calculate the block with the current difficulty
            virtualtimespan+=(lasttime-currenttime)*bnNew.getdouble()/bnNew2.getdouble();
            lasttime = currenttime;
            LastbnTarget=bnTarget;
        }

        if(nCountBlocks != nPastBlocks) {
            assert(pindex->pprev); // should never fail
            pindex = pindex->pprev;
        }
    }

    arith_uint256 bnNew(bnTargetNow);


    int64_t nTargetTimespan = (nPastBlocks-1) * params.nPowTargetSpacing;
/*
    //use the regular nActualTimespan not the "virtual time span" for nEdgeBits adjustment
    int64_t nActualTimespan = pindexLast->GetBlockTime() - pindex->GetBlockTime();

    // Check if we can adjust nEdgeBits value
    uint8_t edgeBitsAdjusted = pindexLast->nEdgeBits;
    if (nActualTimespan < nTargetTimespan / params.nEdgeBitsTargetThreshold) {
        edgeBitsAdjusted++;
    }
    if (nActualTimespan > nTargetTimespan * params.nEdgeBitsTargetThreshold) {
        edgeBitsAdjusted--;
    }

    // Retarget nEdgeBits
    if (edgeBitsAdjusted != pindexLast->nEdgeBits && params.sEdgeBitsAllowed.count(edgeBitsAdjusted)) {
        LogPrintf("%s: adjusted edge bits accepted. prev bits: %u new bits: %u\n", __func__, pindexLast->nEdgeBits, edgeBitsAdjusted);
        return PoW{pindexLast->nBits, static_cast<uint8_t>(edgeBitsAdjusted)};
    }*/

    //Now try to retarget nBits using the "virtual time span"
    if (virtualtimespan < nTargetTimespan/3)
        virtualtimespan = nTargetTimespan/3;
    if (virtualtimespan > nTargetTimespan*3)
        virtualtimespan = nTargetTimespan*3;

    if (bnNew.getdouble()*virtualtimespan/nTargetTimespan>bnPowLimit.getdouble())
    {   //use double type to check if the result is within the range, 
        //otherwise the 256 bit Bignum will overflow when Hashrates are low
        bnNew = bnPowLimit;
    } else 
    {

        // Retarget
        bnNew /= nTargetTimespan;
        bnNew *= virtualtimespan;

        if (bnNew > bnPowLimit) {
            bnNew = bnPowLimit;
        }
    }

    return PoW{bnNew.GetCompact(),pindexLast->nEdgeBits};
}


bool CheckProofOfWork(uint256 hash, unsigned int nBits, const Consensus::Params& params)
{
    bool fNegative;
    bool fOverflow;
    arith_uint256 bnTarget;

    bnTarget.SetCompact(nBits, &fNegative, &fOverflow);

    // Check range
    if (fNegative || bnTarget == 0 || fOverflow || bnTarget > UintToArith256(params.powLimit.uHashLimit))
        return false;

    // Check proof of work matches claimed amount
    if (UintToArith256(hash) > bnTarget)
        return false;

    return true;
}
