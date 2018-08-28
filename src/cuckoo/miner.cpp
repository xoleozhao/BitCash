/*
 * Cuckoo Cycle, a memory-hard proof-of-work
 * Copyright (c) 2013-2018 John Tromp
 * Copyright (c) 2017-2018 The Merit Foundation developers
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the The FAIR MINING License and, alternatively,
 * GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.  See src/cuckoo/LICENSE.md for more details.
 **/

#include "miner.h"
#include "cuckoo.h"
#include "mean_cuckoo.h"

#include "consensus/consensus.h"
#include "hash.h"
#include "pow.h"

#include <assert.h>
#include <numeric>
#include <set>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "util.h"
#include <vector>

#include <sys/time.h>

namespace cuckoo
{

bool VerifyProofOfWorkonlyCycle(
        uint256 hash,
        unsigned int nBits,
        uint8_t edgeBits,
        const std::set<uint32_t>& cycle,
        const Consensus::Params& params)
{

    std::vector<uint32_t> vCycle{cycle.begin(), cycle.end()};

    int res = VerifyCycle(hash, edgeBits, params.nCuckooProofSize, vCycle);

    if (res == verify_code::POW_OK) {
        return true;
    }

    return false;
}

bool VerifyProofOfWork(
        uint256 hash,
        unsigned int nBits,
        uint8_t edgeBits,
        const std::set<uint32_t>& cycle,
        const Consensus::Params& params)
{

    if (cycle.size() != params.nCuckooProofSize) {
//        std::cout << "Fail 1" << std::endl;
        return false;
    }

    if (!params.sEdgeBitsAllowed.count(edgeBits)) {
//        std::cout << "Fail 2" << std::endl;
        return false;
    }

    assert(edgeBits >= MIN_EDGE_BITS && edgeBits <= MAX_EDGE_BITS);

    std::vector<uint32_t> vCycle{cycle.begin(), cycle.end()};

    int res = VerifyCycle(hash, edgeBits, params.nCuckooProofSize, vCycle);

    if (res == verify_code::POW_OK) {
        // check that hash of a cycle is less than a difficulty (old school bitcoin pow)
        return ::CheckProofOfWork(SerializeHash(cycle), nBits, params);
    }

    return false;
}

using Cycle = std::set<uint32_t>;

#ifdef WIN32

using Cycles = std::vector<Cycle>;

//Define the function prototype
typedef bool __cdecl (CALLBACK* FindCyclesOnCudaDeviceType)(
        uint64_t sip_k0, uint64_t sip_k1,
        uint8_t edgebits,
        uint8_t proof_size,
        uint32_t* cycl,
        int device,
	bool* exception,
	char*errormessage);

typedef  int __cdecl (CALLBACK* SetupKernelBuffersType)();

   BOOL dllinited = FALSE;
   BOOL freeResult, runTimeLinkSuccess = FALSE; 
   HINSTANCE dllHandle = NULL;              
   FindCyclesOnCudaDeviceType FindCyclesOnCudaDevicePtr = NULL;
   SetupKernelBuffersType SetupKernelBuffersPtr = NULL;

void intcudadll()
{
   dllinited = TRUE;
   //Load the dll and keep the handle to it
   dllHandle = LoadLibrary("bitcashcuda.dll");

   // If the handle is valid, try to get the function address. 
   if (NULL != dllHandle) 
   { 
      //Get pointer to our function using GetProcAddress:
      SetupKernelBuffersPtr = (SetupKernelBuffersType)GetProcAddress(dllHandle,
         "SetupKernelBuffers");

      FindCyclesOnCudaDevicePtr = (FindCyclesOnCudaDeviceType)GetProcAddress(dllHandle,
         "FindCyclesOnCudaDevice");
       

      // If the function address is valid, call the function. 
      if (runTimeLinkSuccess = (NULL != FindCyclesOnCudaDevicePtr && NULL!=SetupKernelBuffersPtr))
      {
          SetupKernelBuffersPtr();
      }
  }


  //If unable to call the DLL function, use an alternative. 
   if(!runTimeLinkSuccess)
      LogPrintf("Unable to load bitcashcuda.dll\n");
}

void freecudadll()
{
   dllinited = FALSE;
   if (NULL != dllHandle) 
   {   
      //Free the library:
      freeResult = FreeLibrary(dllHandle);       
   } 
}

#endif

bool FindProofOfWorkAdvanced(
    const uint256 hash,
    unsigned int nBits,
    uint8_t edgeBits,
    Cycle& cycle,
    const Consensus::Params& params,
    size_t nThreads,
    bool& cycleFound,
    ctpl::thread_pool* pool,
    bool& trygpumining,
    bool& gpuminingfailed
)
{
    assert(cycle.empty());

#ifdef WIN32
    if (trygpumining)
    {
        //GPU mining (Nvidia) under Windows

        bool exception;
        char errormessage[256];

        if (!dllinited) intcudadll();

        siphash_keys keys;
        Cycles cycles;
        uint32_t cycl[42];
        auto hashStr = hash.GetHex();    
        setKeys(hashStr.c_str(), hashStr.size(), &keys);

        try {
       
            int _id=0;
            if (runTimeLinkSuccess){
                cycleFound = FindCyclesOnCudaDevicePtr(
                            keys.k0, keys.k1,
                            edgeBits,
                            params.nCuckooProofSize,
                            (uint32_t*)&cycl,
                            _id,&exception,(char*)&errormessage);
                if (exception) {
                    LogPrintf("GPU mining error: %s\n", errormessage);
                    trygpumining = false;
                    gpuminingfailed = true;
                }
            } else
            {
                LogPrintf("Could not load CUDA DLL.\n");
                trygpumining = false;
                gpuminingfailed = true;
            }


        }
        catch (const std::exception &exc)
        {	
            trygpumining = false;
            gpuminingfailed = true;
            LogPrintf("GPU mining error: %s\n", exc.what());
        }		


        if (cycleFound)
        {
            int i;
            for (i=0;i<42;i++)
            {
                cycle.insert(cycl[i]);
            }
        }

    } 
    if (!trygpumining) {
        //CPU mining under Windows
        cycleFound =
            FindCycleAdvanced(hash, edgeBits, params.nCuckooProofSize, cycle, nThreads, pool);
    }
    
    #else

        //CPU mining under Linux and MacOS

        cycleFound =
            FindCycleAdvanced(hash, edgeBits, params.nCuckooProofSize, cycle, nThreads, pool);

    #endif

    if (cycleFound && ::CheckProofOfWork(SerializeHash(cycle), nBits, params)) {
        return true;
    }

    cycle.clear();
 
    return false;
}

}
