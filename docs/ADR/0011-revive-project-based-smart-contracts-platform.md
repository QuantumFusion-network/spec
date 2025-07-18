# ADR_0011: Revive Project-Based Smart Contracts Platform

## Date

Decision date: 2025-07-16.  
Last status update: 2025-07-17.

## Status

- [ ] Proposed
- [x] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [ ] Planned
- [x] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner

Alisher Khassanov, [@khssnv](https://github.com/khssnv).

### Consulted

- Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- Memechi Kekamoto, [@MemechiKekamoto](https://github.com/MemechiKekamoto).

### Informed

- [ ] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [ ] Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).
- [x] Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

## Decision

We will implement a smart contracts platform based on Parity Tech's Revive project.

## Context

There was an effort to implement an in-house smart contracts platform by integrating PolkaVM into the blockchain and creating a Rust SDK for smart contracts.

## Options

1. Revive project-based smart contracts platform (SELECTED)
2. In-house smart contracts platform
3. Frontier project-based smart contracts platform

### Option 1: Revive Project-Based Smart Contracts Platform (SELECTED)

This option uses the Revive compiler (<https://github.com/paritytech/revive>) and includes PolkaVM integration. It allows extension via custom "precompiles" (built-in smart contracts).

**Selected because:**

- Implements most of the features planned in [Smart contract environment for TestNet #9](https://github.com/QuantumFusion-network/spec/issues/9) and [PolkaVM smart contract platform advanced development #145](https://github.com/QuantumFusion-network/spec/issues/145).
- Future-proof as part of the Polkadot SDK developed by Parity Tech.

**Selected despite:**

- Lack of a native Rust SDK for smart contracts (which we may implement).
- Currently produces larger blobs (approx. 80x larger than equivalent EVM bytecode, see <https://github.com/polkadot-evm/frontier/pull/1709/files>).

### Option 2: In-house smart contracts platform

This option consists of an in-house PolkaVM integration (<https://github.com/QuantumFusion-network/qf-solochain/tree/bdba37f/pallets/qf-polkavm>) and a native Rust SDK for smart contracts (<https://github.com/QuantumFusion-network/qf-polkavm-sdk/tree/93a21f4/>) with a set of examples.

**Rejected because:**

- Conditions have changed. Initially, there was no alternative, but now the Polkadot SDK provides PolkaVM integration and a smart contracts platform on top of it.
- High development cost.

**Rejected despite:**

- Significant progress already made in [Smart contract environment for TestNet #9](https://github.com/QuantumFusion-network/spec/issues/9) and [PolkaVM smart contract platform advanced development #145](https://github.com/QuantumFusion-network/spec/issues/145).

### Option 3: Frontier project-based smart contracts platform

This is a popular choice for EVM compatibility in Polkadot SDK-based blockchains (<https://github.com/polkadot-evm/frontier>). See:

- Astar, <https://github.com/AstarNetwork/Astar/tree/373fb07/Cargo.toml#L188-L225>
- Moonbeam, <https://github.com/moonbeam-foundation/moonbeam/blob/e1e8923/Cargo.toml#L246-L288>
- Bittensor, <https://github.com/opentensor/subtensor/blob/9f33e759acd763497135043504dc048dcc599c31/Cargo.toml#L196-L227>

**Rejected because:**

- Less performant than a PolkaVM-based execution environment.
- Does not enable new use cases that a PolkaVM-based environment does.
- Less recent than the Revive project.

**Rejected despite:**

- Being mature and well-adopted in the ecosystem.

## References

- Revive project review, <https://coda.io/d/QF-Network_df6rzXCWZj8/Revive-project-review_suwtiLjr>.

## ADR Relationships

### Supersedes

Supersedes the following ADRs related to the in-house smart contracts platform:

- [ADR #0008 Scale Coder Decoder](https://github.com/QuantumFusion-network/spec/blob/ec3f35d/docs/ADR/0008-adr-scale-coder-decoder.md).

- [ADR #0009 Smart Contract Return Value](https://github.com/QuantumFusion-network/spec/blob/ec3f35d/docs/ADR/0009-contract-return-value.md).

- [ADR #0010 Design of Polka VM pallet's execute() extrinsic](https://github.com/QuantumFusion-network/spec/blob/ec3f35d/docs/ADR/0010_qfpolkavm_pallet_execute.md).
