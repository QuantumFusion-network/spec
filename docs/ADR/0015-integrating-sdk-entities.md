# ADR_0015: Integrating SDK Entities

## Date

Decision date: 2025-08-13.  
Last status update: 2025-08-06.

## Status

- [x] Proposed
- [ ] Accepted
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

- Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

### Informed

- [ ] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [x] Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).

## Decision

We will choose how to add SDK entities into the smart contract scope.

## Context

The SDK is intended to provide an ergonomic API for smart contracts developers [^1]. The next section demonstrates a non-ergonomic integration of the existing `pallet-revive` API which we aim to improve.

## Problem

See "ADR #0013 Native Rust SDK for smart contracts: Problem" [^2] for the description of existing API flaws.

```rust
// hello-world/src/main.rs

#![no_std]
#![no_main]

use pallet_revive_uapi::{HostFn, HostFnImpl as api};

#[no_mangle]
#[polkavm_derive::polkavm_export]
/// Called once on deployment.
pub extern "C" fn deploy() {}

#[no_mangle]
#[polkavm_derive::polkavm_export]
/// Entrypoint for smart contract calls.
pub extern "C" fn call() {
    api::deposit_event(&[], b"Hello, World!");
}
```

## Options

1. (SELECTED) Conditional compilation using "features".
2. Macro-based, explicit invocation, implicit behavior.
3. Custom CLI / compiler frontend.
4. `build.rs` magic.

### Option 1: conditional compilation using "features"

Take advantage of Cargo "features" to conditionally add entities such as an allocator or program failure (panic) handler.

```toml
# print-number/Cargo.toml
[package]
name = "print-number"

[dependencies]
polkavm-derive = { git = "https://github.com/paritytech/polkavm.git", tag = "v0.21.0" }
pallet-revive-uapi = { tag = "polkadot-stable2503-6", git = "https://github.com/paritytech/polkadot-sdk.git", default-features = false }

# Add SDK entities specifying features.
sdk = { version = "0.1.0", features = ["global-allocator", "panic-handler"] }
```

```rust
// print-number/src/main.rs

// Crate-level attributes, can't add them from an external package.
#![no_std]
#![no_main]

extern crate alloc;

// `features = ["global-allocator"]` provides global allocator implementation.
use alloc::format; 

use pallet_revive_uapi::{HostFn, HostFnImpl as api}

// At least one import required, otherwise other entities are not linked.
use sdk::prelude::export;

#[export] // better DX, explicitly add what makes sense in scope of the smart contract avoiding implementation details exposure
fn deploy() {}

#[export]
fn call() {
    input!(parameter_1: u32,);

    api::deposit_event(&[], format!("Input: {}", parameter_1).as_bytes());
}
```

### Option 2: macro-based, explicit invocation, implicit behavior

C-style code inclusion using a macro

```rust
// print-number/src/main.rs

// Crate-level attributes, can't add them by a macro.
#![no_std]
#![no_main]

extern crate alloc;

use alloc::format; // init!() includes global allocator implementation
use pallet_revive_uapi::{HostFn, HostFnImpl as api}
use sdk::prelude::{init, export};

// Includes SDK code to the smart contract.
//   - `init!()` with no arguments executes default behavior.
//   - `init!(entity_1, entity_2: entity_2_impl)` uses default implementation of the `entity_1` and user-provided implementation of the `entity_2`.
init!();

#[export]
fn deploy() {}

#[export]
fn call() {
    input!(parameter_1: u32,);

    api::deposit_event(&[], format!("Input: {}", parameter_1).as_bytes());
}
```

**Rejected despite:**

- Simple by explicitness and transparency, not by abstraction.
- `init!()` follows the general approach: sensible default, flexibility for those who need it.

### Option 3: custom CLI / compiler frontend

Like `cargo-contract`.

**Rejected because:**

- Complicates workflow requiring the developer to use an additional compilation tool.
- Harder to implement and maintain.

**Rejected despite:**

- Provides full control of the SDK call-site compilation.

### Option 4: `build.rs` magic

Provide initial `build.rs` for smart contracts project which will integrate SDK entities without imports in `src/*` files.

```rust
// hello-world/src/main.rs
```

```rust
// hello-world/build.rs
```

## Advice

- Consider Anchor Framework, <https://www.anchor-lang.com/docs/basics/program-structure>. Abstract as much as we can, but keep the full control over what's happening in the smart contract (Sviatoslav Alekseev, 2025-08-06).
- Custom CLI / compiler frontend is nice, but additional work for us (Sviatoslav Alekseev, 2025-08-06).
- Add option number five. Just provide plain SDK code without any macro invocation required. Users will call it like library functions to work with structures and host functions (Sviatoslav Alekseev, 2025-08-06).
- `#[export]` to add function parameters replacing raw arguments accessing (Sviatoslav Alekseev, 2025-08-13).
- Reduce unexpected arguments usage such as `&[]` in `event_deposit` (Sviatoslav Alekseev, 2025-08-13).

### References

[^1]: <https://github.com/QuantumFusion-network/spec/blob/khssnv/native-rust-sdk-for-smart-contracts/docs/ADR/0013-native-rust-sdk-for-smart-contracts.md#decision> "ADR #0013 Native Rust SDK for smart contracts: Decision".
[^2]: <https://github.com/QuantumFusion-network/spec/blob/khssnv/native-rust-sdk-for-smart-contracts/docs/ADR/0013-native-rust-sdk-for-smart-contracts.md#Problem> "ADR #0013 Native Rust SDK for smart contracts: Problem".

## ADR Relationships

### Supersedes

### Superseded By

### Related ADRs

- [ADR #0013: Native Rust SDK for smart contracts](https://github.com/QuantumFusion-network/spec/blob/khssnv/native-rust-sdk-for-smart-contracts/docs/ADR/0013-native-rust-sdk-for-smart-contracts.md#decision).
