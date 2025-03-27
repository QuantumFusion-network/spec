# ADR: Using NomtDB as Database

## Date
2024-09-05
Last status update: YYYY-MM-DD

## Status
- [ ] Proposed
- [ ] Accepted
- [ ] Rejected
- [ ] Deprecated
- [x] Superseded by ADR #*TBA*

### Implementation Status
- [ ] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [x] Discontinued

## People
- **Decision-makers**: [Team members who made this decision]
- **Consulted**: [Subject matter experts consulted]
- **Informed**: 
  - [ ] [Person 1] 
  - [ ] [Person 2]
  - [ ] [Person 3]

## Context
[Context description would be added here]

## Problem
Choosing a database is one of the critical decisions affecting the performance, reliability, and scalability of a blockchain.

## Decision
We selected NomtDB as the database because, according to their tests, this solution provides high speed and is designed specifically for use in blockchain.

### Alternatives Considered
- RocksDB - the database on which NomtDB was based, provides high performance and reliability
- WiredTiger
- MerkleTree
- LSM-tree

### Consequences
- **Positive**: 
  - High performance due to blockchain-specific optimizations
  - Easy scalability
  
- **Negative**: 
  - Raw project that requires refinement

## Implementation Notes
Implementation will need to address the refinement needs identified in the database.

## References
- [NomtDB GitHub Repository](https://github.com/thrumdev/nomt)