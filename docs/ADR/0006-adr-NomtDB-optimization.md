# ADR: NomtDB Optimization

## Date
2024-09-11
Last status update: YYYY-MM-DD

## Status
- [ ] Proposed
- [ ] Accepted
- [ ] Rejected
- [x] Deprecated
- [ ] Superseded by ADR #X

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
On September 11, 2024, we discussed the results of comparative tests between NomtDB and RocksDB.

## Problem
The read/write time when using NomtDB was two orders of magnitude higher than for RocksDB.

## Decision
To solve this problem, NomtDB optimization and more careful/extended testing are required. On September 16, 2024, the optimization decision was postponed until the completion of consultation with the NomtDB developer.

### Alternatives Considered
Use RocksDB for testing

### Consequences
- **Positive**: 
  - The benefits of using NomtDB are described in ADR # [reference to previous ADR]
  
- **Negative**: 
  - Optimization may not yield results and development time will be spent

## Implementation Notes
Implementation will be guided by the consultation with the NomtDB developer.

## References
[References would be added here]