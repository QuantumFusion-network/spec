# ADR

## Title: Account's contract storage number and size limit

https://github.com/QuantumFusion-network/spec/issues/329

## Date
2025-05-14
Last status update: 2025-05-14

## Status
- [X] Proposed
- [ ] Accepted
- [ ] Rejected
- [ ] Deprecated
- [ ] Superseded by ADR #X

### Implementation Status
- [ ] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People
- **Decision-makers**: 
  - [ ] Vas
  - [ ] Alisher
- **Consulted**: Alisher
- **Informed**: 
  - [ ] Dastan
  - [ ] Svat
  - [ ] Andrew
  
*Note: People listed in "Informed" should submit a PR to check their name after reading this ADR. This can be done during the initial review process of the ADR upload/commit PR (when the file is first uploaded to GitHub and the author requests reviews), or in a separate PR after the ADR is merged.*

## Context
qf-solochain has limited number of contract by 1 per account.

Account's contract storage is Hash-like datastorage (e.g. pallet storage): [hash_table[key] = contract](https://docs.rs/pallet-contracts/latest/src/pallet_contracts/lib.rs.html#1326), where key is string-like data and contract is a binary data (contract itself).

The methodology of addressing are described  in [this document](https://github.com/QuantumFusion-network/spec/blob/main/docs/PolkaVM/blob_hashing_addressing.md#how-hash-and-address-are-set-for-an-uploaded-pvm-blob).

### Solana account storage limitations
- Max contact size: 10 Mb
- Has a rent for contact storing: yes (a rent)
- Max key size: 256b
- Number of storage slots: the size of storage hash table.

[1] [Ref. and more details about Solana](https://solana.com/docs/core/accounts#:~:text=Accounts%20can%20store%20up%20to,account%20has%20a%20program%20owner).

### PolkaDot account storage limitations
- Max contact size: not defined directly
- Has a rent for contact storing: yes (deposit)
- Max key size: not defined directly
- Number of storage slots: the size of storage hash table

NOTES:
- [VM limits](https://docs.rs/pallet-contracts/latest/pallet_contracts/struct.Limits.html) could be changed via sudo.
- [pallet-contract](https://docs.rs/pallet-contracts/latest/pallet_contracts/index.html)
- [Cargo for contract projects](https://use.ink/docs/v5/getting-started/calling-your-contract)
- [RPC calls](https://docs.rs/pallet-contracts/latest/pallet_contracts/pallet/struct.Pallet.html#method.upload_code) for account's storage managment (set(), e.g. rewrite, get via storage, delete(), upload())
- [No direct versioning](https://docs.rs/pallet-contracts/latest/pallet_contracts/pallet/struct.Pallet.html#method.upload_code): "If the code does not already exist a deposit is reserved from the caller and unreserved only when Self::remove_code is called. The size of the reserve depends on the size of the supplied code."

## Problem
The limited number of stored contract by 1.

## Decision
Logic:
```
#
# NOTE `contract_address` is described in
# https://github.com/QuantumFusion-network/spec/blob/issues/329/docs/PolkaVM/blob_hashing_addressing.md
#
upload_code(account, contract_code) ->

    metadata_key = H(contract_address + contract_code)

    #
    # Metadata structure:
    # KEY = {
    #   versions = [{version: INT8, contract_storage_key: STR, acc_addr: STR}]
    # }
    #
    metadata = contract_metadata_hash_table[key]
    contract_storage_key = metadata.versions.back().contract_storage_key

    if contract_storage_key == None:
        contract_version = 0
        contract_storage_key = H(contract_code + contract_version)
        contract_metadata_hash_table[metadata_key] = {
            .versions = [{0, contract_storage_key, account}]
        }
        hash_table[contract_storage_key] = contract_code
    else:
        contract_version = metadata.back().version + 1
        contract_storage_key = H(contract_code + contract_version)
        push_back(metadata.versions, {version: contract_version,
                                      contract_storage_key: contract_storage_key,
                                      acc_addr: account})
        hash_table[contract_storage_key] = contract_code

    , where hash_table is a storage_map<T> for storing contract code,
            contract_metadata_hash_table is a storage_map<T> for storing
            metadata of the contract, including owner and version of the
            contract.
            A value of contract_metadata_hash_table could be used to find
            associated contract code. For example: iteration other this map
            allows to get all uploaded `contract_code` by `account`.
```
References: [uploading of the contract](https://docs.rs/pallet-contracts/latest/src/pallet_contracts/lib.rs.html#860), [call of the contract](https://docs.rs/pallet-contracts/latest/src/pallet_contracts/lib.rs.html#954)
- Extend account's contract storege slots limit to theoretical maximum

### Next steps:
- ADRs describes managment functions for account's contract storage, ex:
```
- set_code(account, contract_code) -> bool
- delete_code(account) -> bool
```
- ADRs describes depositing.

References: [set_code](https://docs.rs/pallet-contracts/latest/src/pallet_contracts/lib.rs.html#893), [delete_code](https://docs.rs/pallet-contracts/latest/src/pallet_contracts/lib.rs.html#869)

### Consequences (Optional)
- **Positive**: [List positive impacts of this decision]
- **Negative**: [List negative impacts or trade-offs]
- **Risks**: [List any risks associated with this decision and mitigation strategies]

## Implementation Notes (Optional)
[Any specific guidance for implementing this decision, including:
- Required dependencies
- Migration steps
- Testing considerations]

## Confirmation (Optional)
[Describe how the implementation of this decision will be verified. Include:
- Acceptance criteria
- Testing approach
- Any automated verification methods]

## References
- [Related documents, links, and research materials]
- [Previous ADRs that influence this decision]
- [External resources that informed this decision]
