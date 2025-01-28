# Current implementation

All functionality to work with Merkle Proof is located in crate [sp-trie][1].
This crate uses crate [trie-db][2] underhood.


# Future implementation

We are going to switch from [trie-db][2] to [qmdb][3].


Links:

[1]: https://github.com/QuantumFusion-network/polkadot-sdk/tree/master/substrate/primitives/trie (sp-trie)
[2]: https://github.com/paritytech/trie (trie-db)
[3]: https://github.com/LayerZero-Labs/qmdb (qmdb)