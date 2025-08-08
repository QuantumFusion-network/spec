# ADR_0015: Integrating SDK Entities

## Date

Decision date: YYYY-MM-DD.  
Last status update: 2025-08-06.

## Status

- [x] Proposed
- [ ] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [ ] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner

Alisher Khassanov, [@khssnv](https://github.com/khssnv).

### Consulted

- Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- Memechi Kekamoto, [@MemechiKekamoto](https://github.com/MemechiKekamoto).
- Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

### Informed

- [x] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [x] Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).

## Decision

We will choose how to include SDK entities into the smart contract scope.

## Context

## Problem

```rust
// hello_world/src/main.rs

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

### Option 1: explicit invocation, macro-based

```rust
// print_number/src/main.rs

// Crate-level attributes, can't add them by a macro.
#![no_std]
#![no_main]

extern crate alloc;

use alloc::format; // init!() provides global allocator implementation
use pallet_revive_uapi::{HostFn, HostFnImpl as api}
use sdk::prelude::{init, export};

// Includes SDK code to the smart contract.
//   - `init!()` with no arguments executes default behavior.
//   - `init!(entity_1, entity_2: entity_2_impl)` uses default implementation of the `entity_1` and user-provided implementation of the `entity_2`.
init!();

#[export]
pub extern "C" fn deploy() {}

#[export]
pub extern "C" fn call() {
    input!(parameter_1: u32,);

    api::deposit_event(&[], format!("Input: {}", parameter_1).as_bytes());
}
```

**Selected because:**

- Simple by explicitness and transparency, not by abstraction.
- `init!()` follows the general approach: sensible default, flexibility for those who need it.

### Option 2: implicit invocation, macro-based

### Option 3: custom CLI / compiler frontend

Like `cargo-contract`.

### Option 4: `build.rs` magic

```rust
// hello_world/src/main.rs
```

```rust
// hello_world/build.rs
```

## Advice

- Consider Anchor Framework, <https://www.anchor-lang.com/docs/basics/program-structure>. Abstract as much as we can, but keep the full control over what's happening in the smart contract (Sviatoslav Alekseev, 2025-08-06).
- Custom CLI / compiler frontend is nice, but additional work for us (Sviatoslav Alekseev, 2025-08-06).
- Add option number five. Just provide plain SDK code without any macro invocation required. Users will call it like library functions to work with structures and host functions (Sviatoslav Alekseev, 2025-08-06).
