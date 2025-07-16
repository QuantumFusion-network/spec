# ADR_0012: Initial Precompiles

## Date

Decision date: YYYY-MM-DD
Last status update: YYYY-MM-DD

## Status

- [x] Proposed
- [ ] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [x] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner

- Alisher Khassanov, [@khssnv](https://github.com/khssnv)

### Consulted

### Informed

## Decision

We will create a set of initial precompiles for the smart contracts platform.

## Options

### Option 1: [Name of option] (SELECTED)

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

### Option 2: Expose governance functionality to smart contracts

See <https://github.com/paritytech/polkadot-sdk/issues/8366>.

**Rejected because:**

- Implementation already taken by Polkadot Technical Fellowship member.

**Rejected despite:**

- [Potential benefit 1 we're giving up]
- [Potential benefit 2 we're giving up]

### Option 3: ERC721, ERC1155 for `pallet-nfts`

**Rejected because:**

- Not related to QF Network priorities.

### Option 4: Utility pallets interface

- `pallet-scheduler` for scheduling runtime calls to occur at a specified block number or at a specified period.
- `pallet-multisig` to access existing multisig functionality from a smart contract.
- `pallet-indices` for smart contracts to be able to use short form address.

### Option 5: XCM precompile

- Proxy to Ethereum smart contracts. Data availability restrictions.

## Advice (Optional)

[Raw, unfiltered contributions from people who offered advice. his section provides transparency into the decision process and serves as a learning resource.]

- [Advice given] ([Advice-giver's name, role], YYYY-MM-DD)
- [Advice given] ([Advice-giver's name, role], YYYY-MM-DD)

## Glossary

- **Precompile**: runtime function available to smart contracts via a cross-contract call.

## References

- Revive project review, <https://coda.io/d/_df6rzXCWZj8/Revive-project-review_suwtiLjr>.
- How precompiles work, <https://coda.io/d/QF-Network_df6rzXCWZj8/How-precompiles-work_supZxHtN>.
- Governance for modifying precompiles set, <https://coda.io/d/_df6rzXCWZj8/Governance-for-modifying-precompiles-set_suEXoFy->.
