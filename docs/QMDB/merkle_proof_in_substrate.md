# Bref
The current implmentation details and some guides about how we plan to delivery QMDB into Substrate. This relearch actually based on previous researches, for example some ideas about prefixes and iterators migth be taken from [2].

# QMDB pros
- Has indexer (https://github.com/LayerZero-Labs/qmdb/tree/main/qmdb/src/indexer) and two implmentation on boar (inmemory and hybrid). We could reuse it to implement prefixes and iterators (but with dirty reads). NOMT does not have.
- No key size limitations, it could be changed.
- Accoring to WP (https://layerzero.network/publications/QMDB_13Jan2025_v1.0.pdf) and sources; it's more mature solution and faster than NOMT.

# QMDB cons
- Does not have iterators and prefix search.
- Very specific API for implementing [trie-db].
- As well as NOMT it does not look like production ready solution.
- As well as NOMT it does not tested inside Substrate. 

# Phase 1: QMDB as Storage Proof
The first itereation is delivery QMDB as Storage Proof to our DevNet and run benchmarks and stability tests; all releated works will be in this experemet: https://github.com/QuantumFusion-network/spec/issues/16

## Current implementation

All functionality to work with Merkle Proof is located in crate [sp-trie]. This crate uses crate [trie-db] underhood.

## Future implementation

We are going to switch from [trie-db] to [qmdb]. For prefixes and iterators we have two possible solutions: full scan of the trie with dirty reads (QMDB is multy thread solution, and we can't lock for long time), introduce a new indexer; it's already used by QMDB for internal purposes.

## Benchmark & Stability
TBD

[sp-trie]: https://github.com/QuantumFusion-network/polkadot-sdk/tree/master/substrate/primitives/trie
[trie-db]: https://github.com/paritytech/trie
[qmdb]: https://github.com/LayerZero-Labs/qmdb
[2]: https://github.com/QuantumFusion-network/spec/blob/main/docs/NOMT/support_keys_and_prefix_impl_proposal.md
