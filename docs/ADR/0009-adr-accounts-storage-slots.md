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
- **Decision-makers**: [List of people who made the decision]
- **Consulted**: [List of subject matter experts consulted]
- **Informed**: 
  - [ ] [Person 1] 
  - [ ] [Person 2]
  - [ ] [Person 3]
  
*Note: People listed in "Informed" should submit a PR to check their name after reading this ADR. This can be done during the initial review process of the ADR upload/commit PR (when the file is first uploaded to GitHub and the author requests reviews), or in a separate PR after the ADR is merged.*

## Context
qf-solochain has limited number of contract by 1 for an account. For blockchain it's too low lomit. Team need to find how we should extend it.

Account's contract storage is Hash-like datastorage: hash_table[key] = contract, where key is string-like data and contract is a binary data (contract itself).

The methodology of keys are described in [this section](https://github.com/QuantumFusion-network/spec/blob/main/docs/PolkaVM/blob_hashing_addressing.md#how-hash-and-address-are-set-for-an-uploaded-pvm-blob), e.g. (owner, version) = contract in short words.

### Solana account storage limitations
- Max contact size: 10 Mb
- Has a rent for contact storing: yes
- Max key size: 256b
- Number of storage slots: theoretical the size of storage hash table.

[1] [Ref](https://solana.com/docs/core/accounts#:~:text=Accounts%20can%20store%20up%20to,account%20has%20a%20program%20owner).

### PolkaDot account storage limitations
- Max contact size: undefined
- Has a rent for contact storing: no
- Max key size: undefined
- Number of storage slots: theoretical the size of storage hash table

NOTES:
[VM limits](https://docs.rs/pallet-contracts/latest/pallet_contracts/struct.Limits.html) could be changed via sudo.
[1] [pallet-contract](https://docs.rs/pallet-contracts/latest/pallet_contracts/index.html)
[2] [Cargo for contract projects](https://use.ink/docs/v5/getting-started/calling-your-contract)
[3] [RPC calls](https://docs.rs/pallet-contracts/latest/pallet_contracts/pallet/struct.Pallet.html#method.upload_code) for account's storage managment (set(), e.g. rewrite, get(), delete(), upload())
[4] [No versioning or nonce](https://docs.rs/pallet-contracts/latest/pallet_contracts/pallet/struct.Pallet.html#method.upload_code): "If the code does not already exist a deposit is reserved from the caller and unreserved only when Self::remove_code is called. The size of the reserve depends on the size of the supplied code."

## Problem
The limited number of stored contract by 1.

## Decision
- Add `nonce` or `versioning` of the contract to upload(contract, version)
- Rewrite a contract, if hash is the same during the upload:
```
upload(contract [, version]) ->
    version = 0 if version == None
    hash_table[H(owner, version)] = contract
```
- Extend account's contract storege slots limit to theoretical maximum
- Add managment functions for account's contract storage, ex:
```
- set(key, contract, nonce) -> bool
- get(key) -> contract or None
- delete(key) -> bool
```

### Alternatives Considered (Optional)
- Alternative 1: Extend account's contract slots limit to 100, and allow to extend it via sudo
- Alternative 2: Replace `version` to `nonce` for adressing


#### Alternative 1: [Name/Title]
**Description**: [Explanation of the approach]

**Pros**:
- [Advantage 1]
- [Advantage 2]

**Cons**:
- [Disadvantage 1]
- [Disadvantage 2]

**Why Not Selected**: [Reasons for rejection]

Repeat for each alternative considered.]

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
