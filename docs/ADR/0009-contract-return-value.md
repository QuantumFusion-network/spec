# Smart Contract Return Value

## Context

A PolkaVM program is expected to return a numeric value, such as a `u64`, as shown below:

```rust
extern "C" fn main() -> u64 {
```

Currently, the smart contract's `main()` function follows this convention.

This return value is used as the execution result of the smart contract in `pallet-qf-polkavm` and is stored after each call.

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

- Always stores the contract execution result of type `u64` in on-chain storage.
- Limits future support for cross-contract calls.
- Requires a transaction for every smart contract function invocation, even for read-only functions.

## Decision

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

### Proposed Solution

#### Alternative 1: Primary

- Remove the saving of smart contract return values.
- Reserve the return value for future use, such as acting as a "pointer" to a composite return type (e.g., `SomeVec<AccountId>`).
- Allow execution of read-only functions without requiring a transaction.

**Pros:**

- Prevents unnecessary on-chain storage growth and unifies smart contract data writing (writes are defined within the contract body).
- Defers the decision on how to utilize return values until it is actually needed.
- Enables getter functions similar to those in Polkadot SDK's `pallet-contracts` and ink!, allowing dApp developers to define state-reading logic within the contract itself (so UIs are not limited to raw state keys).

#### Implementation Notes

- Live networks, such as the QF Network Testnet, may require a migration to remove the `ExecutionResult` storage item.
- Existing examples will need to be updated to remove reliance on return value storage.
- Supporting read-only function dispatch without a transaction will require significant changes across multiple layers and may necessitate additional architectural decisions.

### Alternative 2: return value is an error code

### Alternative 3: return value is a pointer to a larger struct
