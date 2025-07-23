# ADR_0013: Native Rust SDK for smart contracts

## Date

Decision date: YYYY-MM-DD.  
Last status update: 2025-07-23.

## Status

- [ ] Proposed
- [ ] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [ ] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner

Alisher Khassanov, [@khssnv](https://github.com/khssnv).

### Consulted (Subject Matter Experts)

- Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- Memechi Kekamoto, [@MemechiKekamoto](https://github.com/MemechiKekamoto).

### Informed

- [ ] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [ ] Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).
- [ ] Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

## Decision

We will develop a native Rust SDK for PolkaVM and Revive project smart contracts, focusing on delivering a developer-friendly and ergonomic API.

## Context

- The official Polkadot documentation, <https://docs.polkadot.com/develop/smart-contracts/>, offers ink! as the Rust option for smart contracts development. The other option offered is Solidity.

- Native Rust smart contracts for PolkaVM exist only as test fixtures within the Polkadot SDK, see <https://github.com/paritytech/polkadot-sdk/tree/7a747ff/substrate/frame/revive/fixtures/contracts>.

- The QF Network's `qf-polkavm-sdk` project has a minimal set of abstractions, example contracts, and a CLI tool for deploying and invoking smart contracts, see <https://github.com/QuantumFusion-network/qf-polkavm-sdk/tree/850e169/>.

## Problem

Developing native Rust smart contracts currently faces several challenges due to limitations in the platform's public API.

- Leaky abstractions. Smart contracts must directly interact with both PolkaVM and `pallet-revive` entities, exposing internal implementation details.
- Excessive boilerplate. Developers need to repeatedly write similar code across different contracts.
- Insufficient separation of concerns. Smart contract authors are required to handle low-level operations, rather than focusing solely on business logic.
- Non-ergonomic API.

## Decision in Details (Optional)

[Describe in details the decision made, including:

- Key technical details
- Implementation approach
- Timeline considerations
- Who is responsible for implementation]

### Decision Drivers

- Why are we doing this?
- Why ink! isn't a sufficient replacement for Rust? What's the niche for native Rust smart contracts?

## Options

### Option 1: Native Rust SDK for smart contracts

[Brief description of this option.]

**Selected because:**

- [Benefit 1 that led to selection]
- [Benefit 2 that led to selection]

**Selected despite:**

- [Drawback 1 that we accept]
- [Drawback 2 that we accept]

**Risks and Mitigations:**

- [Risk 1]
  - [Mitigation strategy 1]
- [Risk 2]
  - [Mitigation strategy 2]

**Failure Recovery:**
[How will we recover if this option fails?]

### Option 2: [Name of alternative option]

[Brief description of this option.]

**Rejected because:**

- [Critical drawback 1 - reason for rejection]
- [Critical drawback 2 - reason for rejection]

**Rejected despite:**

- [Potential benefit 1 we're giving up]
- [Potential benefit 2 we're giving up]

## Implementation Notes (Optional)

[Any specific guidance for implementing this decision, including:

- Required dependencies
- Migration steps
- Testing considerations
- Failure Recovery / Rollback procedures]

## Confirmation (Optional)

[Describe how the implementation of this decision will be verified. Include:

- Acceptance criteria
- Testing approach
- Automated verification methods]

## Advice (Optional)

[Raw, unfiltered contributions from people who offered advice. his section provides transparency into the decision process and serves as a learning resource.]

- [Advice given] ([Advice-giver's name, role], YYYY-MM-DD)
- [Advice given] ([Advice-giver's name, role], YYYY-MM-DD)

## Glossary (Optional)

- **[Term]**: [Definition]

## References

- [Related documents, links, and research materials]
- [Previous ADRs that influence this decision]
- [External resources that informed this decision]
- [Requirements or standards]

## ADR Relationships

[Fill in the section if applicable or leave blank for further filling.]

### Supersedes

- ADR #[X]: [Brief description of superseded decision]

### Superseded By

- ADR #[X]: [Brief description of superseding decision]

### Related ADRs

- ADR #[X]: [Brief description of relationship]
