# ADR_0024: Rust SDK storage API

## Date

Decision date: YYYY-MM-DD  
Last status update: YYYY-MM-DD

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

We will add an API for on-chain storage.

## Context

## Options

### Option 2: `qf-polkavm-sdk@v0.1.0::safe_api`

Storage operations with SCALE codec serialization.

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

**Rejected because:**

- Insufficient encapsulation. Similar operations already available in `pallet-revive`'s API'.
- Intended for adding API safety. Irrelevant for already safe API of the `pallet-revive`.

**Rejected despite:**

- Automatic SCALE encoding/decoding.
- Simplified `StorageCell<T>` interface.
