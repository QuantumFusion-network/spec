# PolkaVM Pallet

This document describe: key features of PolkaVM v2.
[High level design](https://github.com/QuantumFusion-network/spec/blob/main/docs/PolkaVM/PolkaVMv2.drawio).
![alt text](docs/PolkaVM/PolkaVMv2.drawio.png)

Polka VM Pallet has two type of extrinsic: uploading PolkaVM compiled blob and execute it via given address.
Both extrinsics are avaliable via Substrate RPC.

## Key features

- PolkaVM instance is running inside Substrate runtime, it allows to communicate
with Blockchain state w/o complicated development process. Please check that
functions it supports at section `Functions`.
- For PolkaVM Smart Contracts team introducing a simple QF Framework for TestNet first launch, the framework (Rust crate).
- Smart Contracs as well as result of it execution store on chain. More details
could be found in `Polka VM Blob hashing & addressing`. In short word: smart contracts have uniq address and any contract could be called via it.
- PolkaVM and Substrate runtime use as fast as possible arguments marshaling.
- Smart contracts execution support GAS (more details in `GAS` section).

## PolkaVM Blob hashing & addressing
[Desing](https://github.com/QuantumFusion-network/spec/blob/main/docs/PolkaVM/blob_hashing_addressing.md)

## GAS
PolkaVM pallet supports GAS using [PolkaVM gas](https://github.com/paritytech/polkavm).

## Storage
[Design](https://github.com/QuantumFusion-network/spec/blob/main/docs/PolkaVM/smart_contract_storage.md) and [example](https://github.com/QuantumFusion-network/qf-polkavm-sdk/blob/main/examples/example-smart-contract/src/main.rs).
[Modeling](https://github.com/QuantumFusion-network/spec/blob/main/docs/PolkaVM/qfPolkaVM-X_O_game_modeling.md) of the X|O game by using [qf-polkavm-sdk](https://github.com/QuantumFusion-network/qf-polkavm-sdk/tree/main) and [storage api](https://github.com/QuantumFusion-network/qf-polkavm-sdk/blob/main/src/lib.rs#L145).

## QF Framework for Smart Contracts PolkaVM v2
Please find example of the contract [here](https://github.com/QuantumFusion-network/qf-polkavm-sdk/blob/main/examples/example-smart-contract/src/main.rs). For getting starting also please read [readme](https://github.com/QuantumFusion-network/qf-polkavm-sdk/blob/main/README.md).

