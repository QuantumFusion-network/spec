# PolkaVM Pallet

This document describe: key features of PolkaVM v2 - v3 pallet.
High level design could be found at `docs/PolkaVM/PolkaVMv2.drawio`.

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
Desing could be found at `docs/PolkaVM/blob_hashing_addressing.md`.

## GAS
PolkaVM pallet supports GAS using PolkaVM feature
(https://github.com/paritytech/polkavm) for current integration of PolkaVM into Substrate.
Team planing to improve this solution in the future.

## Functions


## QF Framework for Smart Contracts PolkaVM v2

The first implementation of the QF Framework is too low level, team understand it. It was done for testing integration of two runtimes.
Here is an example of Smart contract code:

```rust
#![no_std]
#![no_main]

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    unsafe {
        core::arch::asm!("unimp", options(noreturn));
    }
}

#[polkavm_derive::polkavm_import]
extern "C" {
    fn balance() -> u64;
    fn print() -> u64;
    fn transfer(address_idx: u32, balance_idx: u32) -> u64;
}

#[polkavm_derive::polkavm_export]
extern "C" fn call_balance() -> u64 {
    unsafe { balance() }
}

#[polkavm_derive::polkavm_export]
extern "C" fn call_print() -> u64 {
    unsafe { print() }
}

#[polkavm_derive::polkavm_export]
extern "C" fn call_transfer() -> u64 {
    unsafe { transfer(0, 0) }
}
```

Supported functions:
- transfer(A, b): trasfering tokens,
- balance(): get balance info,
- print(): for logging.

All of this avaliable in QF DevNet (http://dev.qfnetwork.xyz).

## QF Framework for Smart Contracts PolkaVM v3

Planned that next version includes the next features: `https://github.com/QuantumFusion-network/spec/issues/9`.

