# ADR: Smart Contract Return Value

## Date

2025-05-02
Last status update: 2025-05-02

## Status

- [ ] Proposed
- [x] Accepted
- [ ] Rejected
- [ ] Deprecated
- [ ] Superseded by ADR #X

### Implementation Status

- [x] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

- **Decision-makers**: KP
- **Consulted**: @dedok, @andor0
- **Informed**:
  - [x] @rnbta
  - [x] @zotho

## Context

A PolkaVM program is expected to return a numeric value, such as a `u64`, as shown below.

```rust
extern "C" fn main() -> u64 {
```

The smart contracts' `main()` function must follow this convention and have the same signature.

Currently, in the QF Network Smart Contracts platform, the return value is used as the computation result handler from the smart contract to the `pallet-qf-polkavm` runtime module. And it is stored on-chain after each call.

```rust
let result: u64 = instance.call_typed_and_get_result::<u64, ()>(&mut state, "main", ());

let (result, not_enough_gas, trap) = match result {
    Err(CallError::NotEnoughGas) => (None, true, false),
    Err(CallError::Trap) => (None, false, true),
    Err(_) => Err(Error::<T>::PolkaVMModuleExecutionFailed)?,
    Ok(res) => (Some(res), false, false),
};

// snip

ExecutionResult::<T>::insert(
    (&contract_address, version, &who),
    ExecResult {
        result,
        not_enough_gas,
        trap,
        gas_before: gas_limit,
        gas_after: instance.gas(),
    },
);
```

## Problem

### Current Implementation

- Each smart contract call writes the return value to the on-chain storage.
- Existing implementation limits future support for cross-contract calls, return values handing over the oh-chain storage is inefficient.
- Even read-only smart contract's functions require a transaction to get the computation result.

## Decision

### Proposed Solution

#### Alternative 1: Primary

- Remove the saving of smart contract return values.
    1. Remove `ExecutionResult` storage item (with its data deletion using a migration).
    1. Update `execute` extrinsic removing `ExecutionResult` usage.
    1. Update affected smart contract examples.
- Reserve the return value for future use (see Alternative 2, Alternative 3).
- Consider read-only[^1] [^2] functions invocation without a transaction (through the "dry run"[^3]) separately.
    1. Blockchain data, thus the contract state, is available for UIs over RPC. Keys are known in advance as well as the value decoding algorithm.
    1. Currently all smart contracts state is written to the pallet storage item and can be easily retrieved over the Polkadot/Substrate Portal RPC without an additional UI. See <https://youtu.be/Xs_uBU86XIE?si=MvOd0-qqw13-nSkL>.

**Pros:**

- Prevents unnecessary on-chain storage growth and unifies smart contract data writing (writes are defined within the contract body).
- Doesn't prevent efficient cross-contract calls implementation with return value exchange over the non-persistent memory.
- Defers the decision on how to utilize return values until it is actually needed.

#### Implementation Notes

- Live networks, such as the QF Network Testnet, may require a migration to remove the `ExecutionResult` storage item.
- Existing examples will need to be updated to remove reliance on return value storage.

### Alternative 2: return value is an error code

### Alternative 3: return value is a pointer to a larger struct

### Comparison

#### Polkadot SDK's `pallet-contracts`

The runtime may receive a `Vec<u8>` as the return value from a smart contract call.

```rust
// https://github.com/paritytech/polkadot-sdk/blob/c2174ff3505eaa1ea1eb047b784a0ed7afe1cbd7/substrate/frame/contracts/src/primitives.rs#L112
pub struct ExecReturnValue {
    /// Flags passed along by `seal_return`. Empty when `seal_return` was never called.
    pub flags: ReturnFlags,
    /// Buffer passed along by `seal_return`. Empty when `seal_return` was never called.
    pub data: Vec<u8>,
}
```

This value is not persisted on-chain, but is instead written to WASM sandbox memory.

```rust
// https://github.com/paritytech/polkadot-sdk/blob/c2174ff3505eaa1ea1eb047b784a0ed7afe1cbd7/substrate/frame/contracts/src/wasm/runtime.rs#L1048-L1057
if let Ok(output) = &call_outcome {
    self.write_sandbox_output(
        memory,
        output_ptr,
        output_len_ptr,
        &output.data,
        true,
        |len| Some(RuntimeCosts::CopyToContract(len)),
    )?;
}
```

A dry run, implemented via the [pallet-contracts::ContractsApi runtime API](https://github.com/paritytech/polkadot-sdk/blob/c2174ff3505eaa1ea1eb047b784a0ed7afe1cbd7/substrate/frame/contracts/src/lib.rs#L1937), is used for state queries and getters. This approach is demonstrated in [ink-examples](https://github.com/use-ink/ink-examples/blob/c72b4cb0d6cfd7229a4c441b789d86c07e995451/flipper/frontend/src/App.tsx#L162) and the [use-inkathon](https://github.com/scio-labs/use-inkathon/blob/496538322521bcb49b454be7bd05ca40ef9e2aaf/src/helpers/contractCall.ts#L18) library.

#### Polkadot SDK's `pallet-revive`

The runtime handles smart contract function return values similarly to `pallet-contracts`. Notably, host functions exposed to the smart contract - which must also return a numeric value - are treated either as a `ReturnCode` or as a value containing the actual output.

```rust
// https://github.com/paritytech/polkadot-sdk/blob/c2174ff3505eaa1ea1eb047b784a0ed7afe1cbd7/substrate/frame/revive/uapi/src/lib.rs#L125
pub struct ReturnCode(u32);

// https://github.com/paritytech/polkadot-sdk/blob/c2174ff3505eaa1ea1eb047b784a0ed7afe1cbd7/substrate/frame/revive/uapi/src/host/riscv64.rs#L39
pub fn set_storage(
    flags: u32,
    key_ptr: *const u8,
    key_len: u32,
    value_ptr: *const u8,
    value_len: u32,
) -> ReturnCode;

// snip

pub fn gas_price() -> u64;
```

## References

[^1]: Solidity view functions, <https://docs.soliditylang.org/en/latest/contracts.html#view-functions>.
[^2]: ink! immutable functions, <https://use.ink/docs/v5/basics/mutating-values#mutable-and-immutable-functions>.
[^3]: Dry-run via RPC, <https://use.ink/docs/v5/getting-started/calling-your-contract/#dry-run-via-rpc>.
