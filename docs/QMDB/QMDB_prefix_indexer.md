# Bref

This document is a comment to `docs/QMDB/QMDB_prefix_indexer.drawio`.

# Problems

QMDB does not support prefixes and iterators. Both features are required to
introduce `HashDB` (https://lib.rs/crates/hash-db); HashDB is used by Substrate's ProofStorage.

# Goal

Integrate QMDB into Substrate (PolkadotSDK) and also try to have plugable
solution as sub-goal; sub-goal is optional because we have limited time for development as well. What is "plugable solution"? We also wish to reuse solution to test Substrate with NOMT, but iff we achive our sub-goal.

# QFHashDB

So key object of our idea is QFHashDB. QFHashDB is a glue that tie togther QMDB
and Substrate. QFHashDB defenetly will have the same API that HashDB. The key
different will be in implmentation.

# QFHashDB Inmemory Indexer

The key feature of QFHashDB is inmemory indexer. The indexer features:
- restorable from QMDB at start; in the future it could be shared memory, that allows to
support `hot reload`;
- for storing BTree family strucure should be used. Since it support ordered and unordered (if needed) iterators and prefix search (that actually based on it);
- Before any operations (read/write) passed to underlying storage (QMDB in that case) indexer update do the same operation. Yeah, that migth be unconsistente in some cases; we know that and we ignore it for the first version. In the schema we called it possibility of `dirty reads`, it means: indexer is alread apply operation but the same operation is still in progress inside underlying storage;
- QFHashDB hash the same API as HashDB.

If you wish lear more about data flow please check this document `QMDB_prefix_indexer.drawio`.

# Testing

We recognize two type of testing for QFHashDB with QMDB: functional tests and stability testing for.

## For functional tests:

Implmentation should pass all builtin tests of Substrate and HashDB.

## Testing

In the end of Q4 2024 we launched DevNet. So this would be our stability testing playground. What exectly we are planning to do?

First one: create dApp that would run (in Round Robin for 3 validator nodes); dApp features are:
- transfer tokens and wait until transaction finilized using validator 1;
- read balance from Validator 2 and check that balance value is expected;
- runs <= 100 such calls per second.
Second one: create checker, that checks validators erorr logs, prometeus metrics; evething should work w/o any error or issues with consensus. If something went wrong, then we would fix it or explain it. 
Third one and last: dApp and checker are workign 24/7 permamently.

