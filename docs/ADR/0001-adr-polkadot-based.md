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
- **Consulted**: [Subject matter experts consulted]
- **Informed**: 
  - [ ] [Person 1] 
  - [ ] [Person 2]
  - [ ] [Person 3]

## Context
Using the existing Polkadot ecosystem simplifies blockchain development. Connecting to the Polkadot ecosystem, which positions itself as L0, has marketing advantages since an L1 network is perceived better by the community.

## Problem
Developing and maintaining a full-fledged L1 requires significant resources and expertise. Additionally, attracting users and validators to a new, unknown network is a challenging task. Connecting to Polkadot as a parachain solves these problems but imposes limitations on the design and functionality of our blockchain, which we plan to address by developing an "improved" Substrate and using a custom database.

## Decision
We've decided to develop our blockchain based on Substrate, a blockchain framework developed by Parity Technologies. This will allow us to leverage ready-made Substrate modules and tools, simplifying development and enhancing security. Our blockchain will connect to Polkadot (L0) as a parachain, gaining access to its ecosystem and the advantages of third-party validators and security systems.

### Alternatives Considered
- Developing an independent L1 blockchain would require significant time and labor resources and carries risks of project development deadline failures
- Connecting to the Ethereum network carries marketing risks, as our project would be positioned as an L2 parachain. Furthermore, numerous projects are already connected to and implemented on Ethereum, making market positioning difficult

### Consequences
- **Positive**: 
  - Accelerated development by using the Polkadot and Substrate framework
  - Enhanced security and protection against "51%" attacks by accessing the Polkadot ecosystem and using Polkadot for validation
  
- **Negative**: 
  - Dependency on Polkadot, constraints on our blockchain architecture
  - Need to use solutions compatible with Polkadot
  - Need to modify Polkadot solutions and tools to achieve target performance indicators

## Implementation Notes
Implementation will include customizing Substrate while maintaining compatibility with the Polkadot ecosystem.

## References
[Documentation and links would be added here]