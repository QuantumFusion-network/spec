# ADR_0024: Rust SDK storage API

## Date

Decision date: YYYY-MM-DD  
Last status update: 2025-10-01

## Status

- [ ] Proposed
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

- Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

### Informed

- [ ] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [ ] Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).

## Decision

We will add an API for on-chain storage. It will improve storage operations ergonomics.

## Context

## Options

Common properties:

- Automatic key generation by default. Optional user-defined key.

### Option 1: TODO

### Option 2: `qf-polkavm-sdk@v0.1.0::safe_api`

Storage operations with SCALE codec serialization.

**Rejected because:**

- Insufficient encapsulation. Similar operations already available in `pallet-revive`'s API'.
- Intended for adding API safety. Irrelevant for already safe API of the `pallet-revive`.

**Rejected despite:**

- Automatic SCALE encoding/decoding.
- Simplified `StorageCell<T>` interface.

#### Public API

```rust
// Load user data from contract input
pub fn load_data<T: scale::Decode>() -> Result<T, LoadDataError>

// Load value from storage by key
pub fn load<T: scale::Decode>(key: &StorageKey) -> Result<Option<T>, LoadError>

// Save value to storage with key
pub fn save<T: scale::Decode>(value: &T, key: &StorageKey) -> Result<(), SaveError>

// Convert string to storage key
pub fn try_into_key(s: &str) -> Result<StorageKey, KeyError>

// Storage cell abstraction
struct StorageCell<T> {
    pub data: T,
    pub storage_key: StorageKey,
}

impl StorageCell<T> {
    pub fn load_from_key<K: TryIntoKey>(storage_key: K) -> Result<Option<Self>, LoadError>
    pub fn load(&self) -> Result<Option<Self>, LoadError>
    pub fn save(&self) -> Result<(), SaveError>
}
```

### Option 3: REST-like

Focus on resources and operations on them.
On-chain storage is accessible through an object (similar to an endpoint) with a given set of operations (similar to HTTP verbs).
Could look familiar to frontend engineers.

```rust
use sdk::storage;

struct StudentId(u32);
struct Student {
    name: String
}

let alice = Student { name: "Alice".to_string() };
let id: StudentId = storage::post(alice);

let mut bob = storage::get(id);

bob.name = "Bob".to_string();
storage::put(id, &bob);
```

### Option 4: GraphQL-like

GraphQL ideas: schema-first, selection-driven i/o, mutations, partial errors, subscriptions.
Could look familiar to frontend engineers.

**Rejected because**:

- Core ideas of the approach address another set of problems and irrelevant for smart contracts case.

### Option 5: CRUD-like

Could look familiar to backend engineers.

### Option 6: Substrate-like

The storage layout of the smart contract is defined by a set of structs annotated with a macro that makes them the interface to the on-chain storage.

## References

1. Rust API Guidelines, <https://rust-lang.github.io/api-guidelines/about.html>.
1. Elegant Library APIs in Rust, <https://deterministic.space/elegant-apis-in-rust.html>
1. Pragmatic Rust Guidelines, <https://microsoft.github.io/rust-guidelines/>
1. GraphQL Core Concepts, <https://www.howtographql.com/basics/2-core-concepts/>.
