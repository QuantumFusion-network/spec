# ADR: Implementation of Nominated Proof of Stake in QF Blockchain

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
During a meeting to discuss the architecture of the future blockchain, we confirmed that we will use the consensus mechanism used in Polkadot - Nominated Proof of Stake (NPoS).

## Problem
The initially proposed Proof of Stake (PoS) consensus mechanism has several disadvantages (especially at the beginning of network operation):
- Most of the stake is concentrated among a small number of validators who continue to accumulate stake as the network grows
- High entry threshold for new validators
- Difficulties in selecting validators

## Decision
We decided to use the NPoS consensus mechanism, which allows network participants (nominators) to delegate their tokens to selected validators who will participate in validation and block production on their behalf.

### Alternatives Considered
- PoS - discussed above
- PoA (Proof of Authority) - validators are pre-selected. Typically used in private networks, so not suitable for a public blockchain; reduces decentralization and significantly decreases trust in the blockchain
- DPoS (Delegated Proof of Stake) - allows network participants to vote for "delegates" who will act as validators. Can lead to excessive centralization if many participants vote for a small number of delegates
- PoW (Proof of Work) - mechanism used in Bitcoin, requires significant computational resources, making network participation complex

### Consequences
- **Positive**: 
  - Increased decentralization, as potentially a large number of validators can emerge
  - Enhanced security by reducing the risk of attacks on validators
  - Simplified network participation and ability to receive validation rewards without running any node
  
- **Negative**: 
  - Dependency on Polkadot's implementation
  - Implementation complexity, as it requires an additional mechanism for token nomination and distribution of validation rewards
  - Difficulties for participants in selecting reliable validators for staking

## Implementation Notes
Implementation will follow Polkadot's established NPoS patterns while adapting to QF's specific requirements.

## References
- [Polkadot Consensus Documentation](https://wiki.polkadot.network/docs/learn-consensus#nominated-proof-of-stake)