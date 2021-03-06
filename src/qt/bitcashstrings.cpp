

#include <QtGlobal>

// Automatically generated by extract_strings_qt.py
#ifdef __GNUC__
#define UNUSED __attribute__((unused))
#else
#define UNUSED
#endif
static const char UNUSED *bitcash_strings[] = {
QT_TRANSLATE_NOOP("bitcash-core", "Bitcash Core"),
QT_TRANSLATE_NOOP("bitcash-core", "The %s developers"),
QT_TRANSLATE_NOOP("bitcash-core", "Bitcash"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"(1 = keep tx meta data e.g. account owner and payment request information, 2 "
"= drop tx meta data)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"-maxtxfee is set very high! Fees this large could be paid on a single "
"transaction."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"A fee rate (in %s/kB) that will be used when fee estimation has insufficient "
"data (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Accept relayed transactions received from whitelisted peers even when not "
"relaying transactions (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Add a node to connect to and attempt to keep the connection open (see the "
"`addnode` RPC command help for more info)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Allow JSON-RPC connections from specified source. Valid for <ip> are a "
"single IP (e.g. 1.2.3.4), a network/netmask (e.g. 1.2.3.4/255.255.255.0) or "
"a network/CIDR (e.g. 1.2.3.4/24). This option can be specified multiple times"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Bind to given address and always listen on it. Use [host]:port notation for "
"IPv6"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Bind to given address and whitelist peers connecting to it. Use [host]:port "
"notation for IPv6"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Bind to given address to listen for JSON-RPC connections. This option is "
"ignored unless -rpcallowip is also passed. Port is optional and overrides -"
"rpcport. Use [host]:port notation for IPv6. This option can be specified "
"multiple times (default: 127.0.0.1 and ::1 i.e., localhost, or if -"
"rpcallowip has been specified, 0.0.0.0 and :: i.e., all addresses)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Cannot obtain a lock on data directory %s. %s is probably already running."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Cannot provide specific connections and have addrman find outgoing "
"connections at the same."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Connect only to the specified node(s); -connect=0 disables automatic "
"connections (the rules for this peer are the same as for -addnode)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Create new files with system default permissions, instead of umask 077 (only "
"effective with disabled wallet functionality)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Delete all wallet transactions and only recover those parts of the "
"blockchain through -rescan on startup"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Discover own IP addresses (default: 1 when listening and no -externalip or -"
"proxy)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Distributed under the MIT software license, see the accompanying file %s or "
"%s"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Do not keep transactions in the mempool longer than <n> hours (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Equivalent bytes per sigop in transactions for relay and mining (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Error loading %s: You can't enable HD on an already existing non-HD wallet"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Error reading %s! All keys read correctly, but transaction data or address "
"book entries might be missing or incorrect."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Error: Listening for incoming connections failed (listen returned error %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Exclude debugging information for a category. Can be used in conjunction "
"with -debug=1 to output debug logs for all categories except one or more "
"specified categories."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Execute command when a relevant alert is received or we see a really long "
"fork (%s in cmd is replaced by message)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Execute command when a wallet transaction changes (%s in cmd is replaced by "
"TxID)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Execute command when the best block changes (%s in cmd is replaced by block "
"hash)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Extra transactions to keep in memory for compact block reconstructions "
"(default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Fee estimation failed. Fallbackfee is disabled. Wait a few blocks or enable -"
"fallbackfee."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Fees (in %s/kB) smaller than this are considered zero fee for relaying, "
"mining and transaction creation (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Fees (in %s/kB) smaller than this are considered zero fee for transaction "
"creation (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Force relay of transactions from whitelisted peers even if they violate "
"local relay policy (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"How thorough the block verification of -checkblocks is (0-4, default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"If <category> is not supplied or if <category> = 1, output all debugging "
"information."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"If paytxfee is not set, include enough fee so transactions begin "
"confirmation on average within n blocks (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"If this block is in the chain assume that it and its ancestors are valid and "
"potentially skip their script verification (0 to verify all, default: %s, "
"testnet: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Invalid -wallet path '%s'. -wallet path should point to a directory where "
"wallet.dat and database/log.?????????? files can be stored, a location where "
"such a directory could be created, or (for backwards compatibility) the name "
"of an existing data file in -walletdir (%s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Invalid amount for -maxtxfee=<amount>: '%s' (must be at least the minrelay "
"fee of %s to prevent stuck transactions)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Invalid transaction created. This is a bug. Please report this and send the "
"file debug.log as zip file to the developer."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Location of the auth cookie. Relative paths will be prefixed by a net-"
"specific datadir location. (default: data dir)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Maintain a full transaction index, used by the getrawtransaction rpc call "
"(default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Maximum allowed median peer time offset adjustment. Local perspective of "
"time may be influenced by peers forward or backward by this amount. "
"(default: %u seconds)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Maximum size of data in data carrier transactions we relay and mine "
"(default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Maximum total fees (in %s) to use in a single wallet transaction or raw "
"transaction; setting this too low may abort large transactions (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Number of seconds to keep misbehaving peers from reconnecting (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Output debugging information (default: %u, supplying <category> is optional)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Please check that your computer's date and time are correct! If your clock "
"is wrong, %s will not work properly."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Please contribute if you find %s useful. Visit %s for further information "
"about the software."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Prune configured below the minimum of %d MiB.  Please use a higher number."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Prune: last wallet synchronisation goes beyond pruned data. You need to -"
"reindex (download the whole blockchain again in case of pruned node)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Query for peer addresses via DNS lookup, if low on addresses (default: 1 "
"unless -connect used)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Randomize credentials for every proxy connection. This enables Tor stream "
"isolation (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Reduce storage requirements by enabling pruning (deleting) of old blocks. "
"This allows the pruneblockchain RPC to be called to delete specific blocks, "
"and enables automatic pruning of old blocks if a target size in MiB is "
"provided. This mode is incompatible with -txindex and -rescan. Warning: "
"Reverting this setting requires re-downloading the entire blockchain. "
"(default: 0 = disable pruning blocks, 1 = allow manual pruning via RPC, >%u "
"= automatically prune block files to stay under the specified target size in "
"MiB)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Rescans are not possible in pruned mode. You will need to use -reindex which "
"will download the whole blockchain again."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Set lowest fee rate (in %s/kB) for transactions to be included in block "
"creation. (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Set the number of script verification threads (%u to %d, 0 = auto, <0 = "
"leave that many cores free, default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Sets the serialization of raw transaction or block hex returned in non-"
"verbose mode, non-segwit(0) or segwit(1) (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Specify configuration file. Relative paths will be prefixed by datadir "
"location. (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Specify directory to hold wallets (default: <datadir>/wallets if it exists, "
"otherwise <datadir>)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Specify location of debug log file. Relative paths will be prefixed by a net-"
"specific datadir location. (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Specify pid file. Relative paths will be prefixed by a net-specific datadir "
"location. (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Specify wallet database path. Can be specified multiple times to load "
"multiple wallets. Path is interpreted relative to <walletdir> if it is not "
"absolute, and will be created if it does not exist (as a directory "
"containing a wallet.dat file and log files). For backwards compatibility "
"this will also accept names of existing data files in <walletdir>.)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Support filtering of blocks and transaction with bloom filters (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"The block database contains a block which appears to be from the future. "
"This may be due to your computer's date and time being set incorrectly. Only "
"rebuild the block database if you are sure that your computer's date and "
"time are correct"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"The fee rate (in %s/kB) that indicates your tolerance for discarding change "
"by adding it to the fee (default: %s). Note: An output is discarded if it is "
"dust at this rate, but we will always discard up to the dust relay fee and a "
"discard fee above that is limited by the fee estimate for the longest target"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"The transaction amount is too small to send after the fee has been deducted"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"This is a pre-release test build - use at your own risk - do not use for "
"mining or merchant applications"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"This is the transaction fee you may discard if change is smaller than dust "
"at this level"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"This is the transaction fee you may pay when fee estimates are not available."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"This product includes software developed by the OpenSSL Project for use in "
"the OpenSSL Toolkit %s and cryptographic software written by Eric Young and "
"UPnP software written by Thomas Bernard."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Total length of network version string (%i) exceeds maximum length (%i). "
"Reduce the number or size of uacomments."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Tries to keep outbound traffic under the given target (in MiB per 24h), 0 = "
"no limit (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Unable to replay blocks. You will need to rebuild the database using -"
"reindex-chainstate."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Unable to rewind the database to a pre-fork state. You will need to "
"redownload the blockchain"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Unsupported argument -socks found. Setting SOCKS version isn't possible "
"anymore, only SOCKS5 proxies are supported."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Unsupported argument -whitelistalwaysrelay ignored, use -whitelistrelay and/"
"or -whitelistforcerelay."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Use UPnP to map the listening port (default: 1 when listening and no -proxy)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Use separate SOCKS5 proxy to reach peers via Tor hidden services (default: "
"%s)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Username and hashed password for JSON-RPC connections. The field <userpw> "
"comes in the format: <USERNAME>:<SALT>$<HASH>. A canonical python script is "
"included in share/rpcuser. The client then connects normally using the "
"rpcuser=<USERNAME>/rpcpassword=<PASSWORD> pair of arguments. This option can "
"be specified multiple times"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Wallet will not create transactions that violate mempool chain limits "
"(default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Warning: The network does not appear to fully agree! Some miners appear to "
"be experiencing issues."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Warning: Unknown block versions being mined! It's possible unknown rules are "
"in effect"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Warning: Wallet file corrupt, data salvaged! Original %s saved as %s in %s; "
"if your balance or transactions are incorrect you should restore from a "
"backup."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Warning: We do not appear to fully agree with our peers! You may need to "
"upgrade, or other nodes may need to upgrade."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Whether to save the mempool on shutdown and load on restart (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Whitelist peers connecting from the given IP address (e.g. 1.2.3.4) or CIDR "
"notated network (e.g. 1.2.3.0/24). Can be specified multiple times."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"Whitelisted peers cannot be DoS banned and their transactions are always "
"relayed, even if they are already in the mempool, useful e.g. for a gateway"),
QT_TRANSLATE_NOOP("bitcash-core", ""
"You need to enter the deposit key/code in the description line field. The "
"exchange has provided to you with the deposit key/code. Without the correct "
"code your coins will not end up on your personal account on the exchange. "
"The key must have a minimum length of 5 characters."),
QT_TRANSLATE_NOOP("bitcash-core", ""
"You need to rebuild the database using -reindex to go back to unpruned "
"mode.  This will redownload the entire blockchain"),
QT_TRANSLATE_NOOP("bitcash-core", "%d of last 100 blocks have unexpected version"),
QT_TRANSLATE_NOOP("bitcash-core", "%s corrupt, salvage failed"),
QT_TRANSLATE_NOOP("bitcash-core", "%s is set very high!"),
QT_TRANSLATE_NOOP("bitcash-core", "(default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "-maxmempool must be at least %d MB"),
QT_TRANSLATE_NOOP("bitcash-core", "<category> can be:"),
QT_TRANSLATE_NOOP("bitcash-core", "Accept command line and JSON-RPC commands"),
QT_TRANSLATE_NOOP("bitcash-core", "Accept connections from outside (default: 1 if no -proxy or -connect)"),
QT_TRANSLATE_NOOP("bitcash-core", "Accept public REST requests (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Address already has a nickname."),
QT_TRANSLATE_NOOP("bitcash-core", "Allow DNS lookups for -addnode, -seednode and -connect"),
QT_TRANSLATE_NOOP("bitcash-core", "Always query for peer addresses via DNS lookup (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Append comment to the user agent string"),
QT_TRANSLATE_NOOP("bitcash-core", "Attempt to recover private keys from a corrupt wallet on startup"),
QT_TRANSLATE_NOOP("bitcash-core", "Automatically create Tor hidden service (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", "Block creation options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Can not get private key"),
QT_TRANSLATE_NOOP("bitcash-core", "Cannot downgrade wallet"),
QT_TRANSLATE_NOOP("bitcash-core", "Cannot resolve -%s address: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Cannot write to data directory '%s'; check permissions."),
QT_TRANSLATE_NOOP("bitcash-core", "Chain selection options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Change index out of range"),
QT_TRANSLATE_NOOP("bitcash-core", "Connect through SOCKS5 proxy"),
QT_TRANSLATE_NOOP("bitcash-core", "Connect to a node to retrieve peer addresses, and disconnect"),
QT_TRANSLATE_NOOP("bitcash-core", "Connection options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Copyright (C) %i-%i"),
QT_TRANSLATE_NOOP("bitcash-core", "Corrupted block database detected"),
QT_TRANSLATE_NOOP("bitcash-core", "Could not sign transaction."),
QT_TRANSLATE_NOOP("bitcash-core", "Debugging/Testing options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Do not load the wallet and disable wallet RPC calls"),
QT_TRANSLATE_NOOP("bitcash-core", "Do you want to rebuild the block database now?"),
QT_TRANSLATE_NOOP("bitcash-core", "Done loading"),
QT_TRANSLATE_NOOP("bitcash-core", "Enable publish hash block in <address>"),
QT_TRANSLATE_NOOP("bitcash-core", "Enable publish hash transaction in <address>"),
QT_TRANSLATE_NOOP("bitcash-core", "Enable publish raw block in <address>"),
QT_TRANSLATE_NOOP("bitcash-core", "Enable publish raw transaction in <address>"),
QT_TRANSLATE_NOOP("bitcash-core", "Enable transaction replacement in the memory pool (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Error creating %s: You can't create non-HD wallets with this version."),
QT_TRANSLATE_NOOP("bitcash-core", "Error initializing block database"),
QT_TRANSLATE_NOOP("bitcash-core", "Error initializing wallet database environment %s!"),
QT_TRANSLATE_NOOP("bitcash-core", "Error loading %s"),
QT_TRANSLATE_NOOP("bitcash-core", "Error loading %s: Wallet corrupted"),
QT_TRANSLATE_NOOP("bitcash-core", "Error loading %s: Wallet requires newer version of %s"),
QT_TRANSLATE_NOOP("bitcash-core", "Error loading %s: You can't disable HD on an already existing HD wallet"),
QT_TRANSLATE_NOOP("bitcash-core", "Error loading block database"),
QT_TRANSLATE_NOOP("bitcash-core", "Error loading wallet %s. Duplicate -wallet filename specified."),
QT_TRANSLATE_NOOP("bitcash-core", "Error opening block database"),
QT_TRANSLATE_NOOP("bitcash-core", "Error reading from database, shutting down."),
QT_TRANSLATE_NOOP("bitcash-core", "Error upgrading chainstate database"),
QT_TRANSLATE_NOOP("bitcash-core", "Error"),
QT_TRANSLATE_NOOP("bitcash-core", "Error: A fatal internal error occurred, see debug.log for details"),
QT_TRANSLATE_NOOP("bitcash-core", "Error: Disk space is low!"),
QT_TRANSLATE_NOOP("bitcash-core", "Failed to listen on any port. Use -listen=0 if you want this."),
QT_TRANSLATE_NOOP("bitcash-core", "Failed to rescan the wallet during initialization"),
QT_TRANSLATE_NOOP("bitcash-core", "Fee (in %s/kB) to add to transactions you send (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", "How many blocks to check at startup (default: %u, 0 = all)"),
QT_TRANSLATE_NOOP("bitcash-core", "Importing..."),
QT_TRANSLATE_NOOP("bitcash-core", "Imports blocks from external blk000??.dat file on startup"),
QT_TRANSLATE_NOOP("bitcash-core", "Include IP addresses in debug output (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Incorrect or no genesis block found. Wrong datadir for network?"),
QT_TRANSLATE_NOOP("bitcash-core", "Information"),
QT_TRANSLATE_NOOP("bitcash-core", "Initialization sanity check failed. %s is shutting down."),
QT_TRANSLATE_NOOP("bitcash-core", "Insufficient funds"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid -onion address or hostname: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid -proxy address or hostname: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid amount for -%s=<amount>: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid amount for -discardfee=<amount>: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid amount for -fallbackfee=<amount>: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid amount for -paytxfee=<amount>: '%s' (must be at least %s)"),
QT_TRANSLATE_NOOP("bitcash-core", "Invalid netmask specified in -whitelist: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Keep at most <n> unconnectable transactions in memory (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Keep the transaction memory pool below <n> megabytes (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Listen for JSON-RPC connections on <port> (default: %u or testnet: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Listen for connections on <port> (default: %u or testnet: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Loading P2P addresses..."),
QT_TRANSLATE_NOOP("bitcash-core", "Loading banlist..."),
QT_TRANSLATE_NOOP("bitcash-core", "Loading block index..."),
QT_TRANSLATE_NOOP("bitcash-core", "Loading wallet..."),
QT_TRANSLATE_NOOP("bitcash-core", "Maintain at most <n> connections to peers (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Make the wallet broadcast transactions"),
QT_TRANSLATE_NOOP("bitcash-core", "Maximum per-connection receive buffer, <n>*1000 bytes (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Maximum per-connection send buffer, <n>*1000 bytes (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Need to specify a port with -whitebind: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Nickname transactions for addresses with a viewkey are not yet allowed."),
QT_TRANSLATE_NOOP("bitcash-core", "Node relay options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Not enough file descriptors available."),
QT_TRANSLATE_NOOP("bitcash-core", "Only connect to nodes in network <net> (ipv4, ipv6 or onion)"),
QT_TRANSLATE_NOOP("bitcash-core", "Options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Password for JSON-RPC connections"),
QT_TRANSLATE_NOOP("bitcash-core", "Prepend debug output with timestamp (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Print this help message and exit"),
QT_TRANSLATE_NOOP("bitcash-core", "Print version and exit"),
QT_TRANSLATE_NOOP("bitcash-core", "Prune cannot be configured with a negative value."),
QT_TRANSLATE_NOOP("bitcash-core", "Prune mode is incompatible with -txindex."),
QT_TRANSLATE_NOOP("bitcash-core", "Pruning blockstore..."),
QT_TRANSLATE_NOOP("bitcash-core", "RPC server options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Rebuild chain state and block index from the blk*.dat files on disk"),
QT_TRANSLATE_NOOP("bitcash-core", "Rebuild chain state from the currently indexed blocks"),
QT_TRANSLATE_NOOP("bitcash-core", "Reducing -maxconnections from %d to %d, because of system limitations."),
QT_TRANSLATE_NOOP("bitcash-core", "Relay and mine data carrier transactions (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Relay non-P2SH multisig (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Replaying blocks..."),
QT_TRANSLATE_NOOP("bitcash-core", "Rescan the block chain for missing wallet transactions on startup"),
QT_TRANSLATE_NOOP("bitcash-core", "Rescanning..."),
QT_TRANSLATE_NOOP("bitcash-core", "Rewinding blocks..."),
QT_TRANSLATE_NOOP("bitcash-core", "Run in the background as a daemon and accept commands"),
QT_TRANSLATE_NOOP("bitcash-core", "Send trace/debug info to console instead of debug.log file"),
QT_TRANSLATE_NOOP("bitcash-core", "Send transactions with full-RBF opt-in enabled (RPC only, default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Set database cache size in megabytes (%d to %d, default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", "Set key pool size to <n> (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Set maximum BIP141 block weight (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", "Set the number of threads to service RPC calls (default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", "Show all debugging options (usage: --help -help-debug)"),
QT_TRANSLATE_NOOP("bitcash-core", "Shrink debug.log file on client startup (default: 1 when no -debug)"),
QT_TRANSLATE_NOOP("bitcash-core", "Signing transaction failed"),
QT_TRANSLATE_NOOP("bitcash-core", "Specified -walletdir \"%s\" does not exist"),
QT_TRANSLATE_NOOP("bitcash-core", "Specified -walletdir \"%s\" is a relative path"),
QT_TRANSLATE_NOOP("bitcash-core", "Specified -walletdir \"%s\" is not a directory"),
QT_TRANSLATE_NOOP("bitcash-core", "Specified blocks directory \"%s\" does not exist.\n"),
QT_TRANSLATE_NOOP("bitcash-core", "Specifies the password to unlock the wallet."),
QT_TRANSLATE_NOOP("bitcash-core", "Specify blocks directory (default: <datadir>/blocks)"),
QT_TRANSLATE_NOOP("bitcash-core", "Specify connection timeout in milliseconds (minimum: 1, default: %d)"),
QT_TRANSLATE_NOOP("bitcash-core", "Specify data directory"),
QT_TRANSLATE_NOOP("bitcash-core", "Specify your own public address"),
QT_TRANSLATE_NOOP("bitcash-core", "Spend unconfirmed change when sending transactions (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Starting network threads..."),
QT_TRANSLATE_NOOP("bitcash-core", "The source code is available from %s."),
QT_TRANSLATE_NOOP("bitcash-core", "The transaction amount is too small to pay the fee"),
QT_TRANSLATE_NOOP("bitcash-core", "The wallet will avoid paying less than the minimum relay fee."),
QT_TRANSLATE_NOOP("bitcash-core", "This address does not belong to this wallet."),
QT_TRANSLATE_NOOP("bitcash-core", "This is experimental software."),
QT_TRANSLATE_NOOP("bitcash-core", "This is the minimum transaction fee you pay on every transaction."),
QT_TRANSLATE_NOOP("bitcash-core", "This is the transaction fee you will pay if you send a transaction."),
QT_TRANSLATE_NOOP("bitcash-core", "This nickname is already taken."),
QT_TRANSLATE_NOOP("bitcash-core", "Threshold for disconnecting misbehaving peers (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Tor control port password (default: empty)"),
QT_TRANSLATE_NOOP("bitcash-core", "Tor control port to use if onion listening enabled (default: %s)"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction amount too small"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction amounts must not be negative"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction fee and change calculation failed"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction has too long of a mempool chain"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction must have at least one recipient"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction too large for fee policy"),
QT_TRANSLATE_NOOP("bitcash-core", "Transaction too large"),
QT_TRANSLATE_NOOP("bitcash-core", "Transactions from a Dollar account are not yet allowed."),
QT_TRANSLATE_NOOP("bitcash-core", "Transactions to a Dollar account are not yet allowed."),
QT_TRANSLATE_NOOP("bitcash-core", "Unable to bind to %s on this computer (bind returned error %s)"),
QT_TRANSLATE_NOOP("bitcash-core", "Unable to bind to %s on this computer. %s is probably already running."),
QT_TRANSLATE_NOOP("bitcash-core", "Unable to generate initial keys"),
QT_TRANSLATE_NOOP("bitcash-core", "Unable to start HTTP server. See debug log for details."),
QT_TRANSLATE_NOOP("bitcash-core", "Unknown network specified in -onlynet: '%s'"),
QT_TRANSLATE_NOOP("bitcash-core", "Unsupported argument -benchmark ignored, use -debug=bench."),
QT_TRANSLATE_NOOP("bitcash-core", "Unsupported argument -debugnet ignored, use -debug=net."),
QT_TRANSLATE_NOOP("bitcash-core", "Unsupported argument -tor found, use -onion."),
QT_TRANSLATE_NOOP("bitcash-core", "Unsupported logging category %s=%s."),
QT_TRANSLATE_NOOP("bitcash-core", "Upgrade wallet to latest format on startup"),
QT_TRANSLATE_NOOP("bitcash-core", "Upgrading UTXO database"),
QT_TRANSLATE_NOOP("bitcash-core", "Upgrading txindex database"),
QT_TRANSLATE_NOOP("bitcash-core", "Use UPnP to map the listening port (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Use the test chain"),
QT_TRANSLATE_NOOP("bitcash-core", "User Agent comment (%s) contains unsafe characters."),
QT_TRANSLATE_NOOP("bitcash-core", "Username for JSON-RPC connections"),
QT_TRANSLATE_NOOP("bitcash-core", "Verifying blocks..."),
QT_TRANSLATE_NOOP("bitcash-core", "Verifying wallet(s)..."),
QT_TRANSLATE_NOOP("bitcash-core", "Wallet %s resides outside wallet directory %s"),
QT_TRANSLATE_NOOP("bitcash-core", "Wallet debugging/testing options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Wallet needed to be rewritten: restart %s to complete"),
QT_TRANSLATE_NOOP("bitcash-core", "Wallet options:"),
QT_TRANSLATE_NOOP("bitcash-core", "Warning"),
QT_TRANSLATE_NOOP("bitcash-core", "Warning: unknown new rules activated (versionbit %i)"),
QT_TRANSLATE_NOOP("bitcash-core", "Whether to operate in a blocks only mode (default: %u)"),
QT_TRANSLATE_NOOP("bitcash-core", "Zapping all transactions from wallet..."),
QT_TRANSLATE_NOOP("bitcash-core", "ZeroMQ notification options:"),
};
