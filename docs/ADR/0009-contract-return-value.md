# Smart contract return value

## Context

A PolkaVM program is expected to return a numeric type value (e.g. `u64`), as shown below.

```rust
extern "C" fn main() -> u64 {
```

Similarly, the current smart contract's `main()` function does the same.

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

### Current implementation

- Forcefully saves contract execution value type of `u64` in the on-chain storage.
- Doesn't facilitate future implementation of the cross-contract calls.

## Decision

### Polkadot SDK's `pallet-contracts`

TODO(khssnv)

### Polkadot SDK's `pallet-revive`

TODO(khssnv)

### Ethereum

TODO(khssnv)

### Proposed solution

### Alternative 1: primary

- Remove smart contract return value saving.
- Reserve return value for future use, e.g. as a "pointer" where the caller may find a composite return type result.

**Pros**:

- Avoid forceful on-chain storage growth and utilization, unifies smart contract data writing (writes defined in the smart contract body).
- Postpones unnecessary engineering decision (return value utilization) for future.

**Cons**:

TODO(khssnv)

### Alternative 2: return value is an error code

### Alternative 3: return value is a pointer to a larger struct
