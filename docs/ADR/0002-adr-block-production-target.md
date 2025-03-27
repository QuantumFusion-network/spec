# ADR: Performance Targets - Block Production Time and Preliminary Finalization Time

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
- **Consulted**: [Subject matter experts consulted]
- **Informed**: 
  - [ ] [Person 1] 
  - [ ] [Person 2]
  - [ ] [Person 3]

## Context
We discussed the target indicators for the blockchain and tried to determine appropriate performance targets.

## Problem
It's desirable to define blockchain performance metrics at the beginning of the journey, as without them it's difficult to choose priority areas for optimization, select technologies for blockchain creation, and subsequently evaluate the effectiveness of the developed blockchain.

## Decision
We have established the following target indicators:
- Block production time: 0.3-0.5 seconds
- Preliminary finalization time: 2-3 seconds

### Alternatives Considered
Higher values for block production time and preliminary finalization time would simplify development but reduce blockchain throughput.

### Consequences
- **Positive**: 
  - High performance and throughput will allow processing more transactions per second
  - Relatively short preliminary finalization time will allow users who don't require full finalization to receive confirmation of their transactions faster
  - Increases the number of possible applications and improves user experience
  
- **Negative**: 
  - Complex solution implementation requiring careful selection of development technologies and their thorough optimization
  - Increased requirements for the equipment on which these operations will be performed

## Implementation Notes
Implementation will require careful technology selection and significant optimization work to meet these ambitious targets.

## References
[Documentation and links would be added here]