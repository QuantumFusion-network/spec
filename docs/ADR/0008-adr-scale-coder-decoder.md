# ADR: Creating L1 Blockchain Based on Polkadot as L0 Network

## Date
2024-09-02
Last status update: YYYY-MM-DD

## Status
- [ ] Proposed
- [x] Accepted
- [ ] Rejected
- [ ] Deprecated
- [ ] Superseded by ADR #X

### Implementation Status
- [ ] Planned
- [x] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People
- **Decision-makers**: [Team members who made this decision]
  - [x] [Alisher]
  - [x] [Andrew]
  - [x] [Svat]
  - [x] [Vas]

- **Consulted**: [Subject matter experts consulted]
- **Informed**:

## Context
For Smart Contract's storage require to code & decode user structure in the most
frendly way.

## Problem
The current implmentation of storage allows to store only vec and (u)int types.

## Decision
Use Scale framwework to coding / encoding user defined structure.

### Alternatives Considered
- Use Borsh. Solution is not frendly with Polka Ecosystem. Ex: PolkaJS can't
decode Borsh. Borsh does not store scheme wich means we need to store scheme for
decoding it on UI/client side.
- Use Cap'n Proto. Solution is to heavy for storage coder/encoder.

### Consequences
- **Positive**:
  - Scale accelerated development by using the Polkadot and Substrate framework
  - Scale is Polkadot ecosystem frendly solution

- **Negative**:
  - Dependency on Polkadot
  - To change solution we need to migrate old data or support a few way to
  code/encode stoted data

## Implementation Notes

## References

