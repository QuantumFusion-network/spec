## Title: Design of Polka VM pallet's execute() extrinsic

## Date
2025-05-20
Last status update: 2025-05-21

## Status
- [X] Proposed
- [X] Accepted
- [ ] Rejected
- [ ] Deprecated
- [ ] Superseded by ADR #X

### Implementation Status
- [ ] Planned
- [X] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People
- **Decision-makers**: KP, Vas
- **Consulted**: Andrei, Alisher
- **Informed**:
  - Sviat

## Context
For running a smart contract we have to have implemented pallet's extrinsic `execute()` and at least one method inside the contract to run it (i.e. `main()`).

## Problem
We have introduced [pallet's execute method](https://github.com/QuantumFusion-network/qf-solochain/blob/main/pallets/qf-polkavm/src/lib.rs#L333), it has signature:
```
execute(origin, contract_address, to, value, user_data, gas_limit, gas_price)
```
, where:
- `origin` is a caller address,
- `contract_address` is an address of stored on-chain contract,
- `user_data` is [SCALE] encoded structures passed to the contract's main() function,
- `gas_limit` is a limit of the gas for executing of the contract behind contract_address,
- `gas_price` is a price of the gas for auction; this argument is not implemented, it's for the future.

As we can see, the signature includes legacy arguments like `to` and `value`, inherited from PoC development.

## Decision
### Change signature of pallet's extrinsic to:
```
execute(origin, contract_address, data, gas_limit, storage_deposit_limit, gas_price)
```
, where:
- `origin` is a caller address,
- `contract_address` is an address of stored on-chain contract,
- `data` is encoded structures [_maybe_ SCALE encoded] passed to the contract's context and available via host function call,
- `gas_limit` [Weight](https://docs.rs/sp-weights/31.1.0/sp_weights/struct.Weight.html) is a limit of the gas for execution of the contract behind `contract_address`-- [implementation reference](https://docs.rs/pallet-revive/latest/src/pallet_revive/lib.rs.html#727),
- `storage_deposit_limit` is a limit of how many storage space could be used for storing data during contract execution, if out of this limit, then transaction fail with Out of Storage limit error message and no data stored. Thing about this case: we have a huge `gas_limit` and trying to save inside a contract, by mistaken, a huge blob of data. This argument is not implemented, it's for the future. Unit: bytes per a storage slot.
- `data` is [SCALE] encoded bytes passed to the contract's context and available via host function call,
- `storage_deposit_limit` is a maximum amount of balance that can be charged from the caller to pay for the storage consumed during contract execution. If this limit is exceeded, then transaction fails with `Out of Storage limit` error message and no data stored. Thing about this case: we have a huge `gas_limit` and trying to save inside a contract, by mistaken, a huge blob of data. This argument is not implemented, it's for the future. Unit: balance.
- `gas_price` is a price of the gas for auction; this argument is not implemented, it's for the future.


### Update function signatures
`transfer()` and `balance_of()` should read address and value from the `data` instead of `to` and `value`.

## References

[Ref to pallet contracts](https://docs.rs/pallet-contracts/latest/pallet_contracts/pallet/struct.Pallet.html#method.call)

[Concern: value](https://docs.rs/pallet-contracts/latest/pallet_contracts/pallet/struct.Pallet.html#method.call)
Research result: seems `value` introduced for optimization puposes for balance transfering and balance_of. I don't find any other reasons.

[Storage deposit limit explanation](https://github.com/paritytech/substrate-contracts-node/issues/23#issuecomment-1008751578)

[SCALE]: https://github.com/paritytech/parity-scale-codec

[Purpose of `value` param in `pallet-contracts::call` extrinsic?](https://substrate.stackexchange.com/questions/12363/purpose-of-value-param-in-pallet-contractscall-extrinsi)

