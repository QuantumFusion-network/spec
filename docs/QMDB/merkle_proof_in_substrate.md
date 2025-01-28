## Current implementation

All functionality to work with Merkle Proof is located in crate [sp-trie].
This crate uses crate [trie-db] underhood.


## Future implementation

We are going to switch from [trie-db] to [qmdb].

[sp-trie]: https://github.com/QuantumFusion-network/polkadot-sdk/tree/master/substrate/primitives/trie
[trie-db]: https://github.com/paritytech/trie
[qmdb]: https://github.com/LayerZero-Labs/qmdb
