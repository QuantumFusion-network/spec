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

## Advice

- I would not focus on NFTs. The NFTs currently are not hype at all. I don't see this adding much value (Memechi Kekamoto, 2025-07-17)
- Explore account abstraction or other standards... like ERC-4337... to enable an AI-agent or other entity to control tokens, allowing them to be spent freely without signing additional transactions or requiring extra user input (Memechi Kekamoto, 2025-07-17)
- This ERC is 7857 (Sviatoslav Alekseev, 2025-07-17)
- Regarding account abstraction, this might be a nice-to-have thing and would require some further research (Memechi Kekamoto, 2025-07-17)
- Consider precompiles for utility pallets like `pallet-scheduler`, `pallet-multisig`, and `pallet-indices`, as they are pretty useful (Memechi Kekamoto, 2025-07-17)
- I definitely want to put somewhere some form of randomness whether it's via oracle or via internal pallet. I think that would be very cool (Memechi Kekamoto, 2025-07-17)
- Pyth provide data to all the like 50 or more blockchains and super cheap, super good (Memechi Kekamoto, 2025-07-17)
- Pyth not only provides information about prices but things like PolyMarket and many other Web2 things... If we can have this exposed somehow as a precompile, I believe this is a big added value to the whole ecosystem (Memechi Kekamoto, 2025-07-17)
- For Pyth, you just need u someone to put the data from their network to our blockchain and we will be able to access it just to through the storage (Sviatoslav Alekseev, 2025-07-17)
- Maybe there are parachains that provide decentralized oracle network feature? (Memechi Kekamoto, 2025-07-17)
- I think we all agree that having some form of oracle access inside the smart contract is very useful (Memechi Kekamoto, 2025-07-17)
- This XCM functionality is very cool functionality and in theory this could be later expanded to more blockchains or be built better (Memechi Kekamoto, 2025-07-17)
- Pyth also provide [entropy](https://docs.pyth.network/entropy). Pyth Entropy allows developers to quickly and easily generate secure random numbers on the blockchain (Sviatoslav Alekseev, 2025-07-17)
- There is also insecure randomness in Polkadot and we can also implement the precompile for it (Alisher Khassanov, 2025-07-17)
- I think insecure randomness is a good starting point (Memechi Kekamoto, 2025-07-17)
- Explore a REST-like storage for precompile ... provide an interface for easy access to storage with methods like update, delete as it is easy to understand for an inter developer (Memechi Kekamoto, 2025-07-17)
- Randomness could be [quantum ](https://aws.amazon.com/marketplace/pp/prodview-246kyrfjo3bag) (Alex Vyatkin, 2025-07-17)
- From an implementation standpoint, it's best to go from easiest to implement towards harder to implement to have a starting set (Memechi Kekamoto, 2025-07-17)
- Go through ideas of the SDK brainstorm and maybe add something from that to the ADR (Memechi Kekamoto, 2025-07-17)
- Question the need for a precompile for payment logic abstraction, as existing functions (account, transfer, check balance) allow developers to write this directly in smart contracts (Memechi Kekamoto, 2025-07-17)

## Glossary

- **Precompile**: runtime function available to smart contracts via a cross-contract call.

## References

- Revive project review, <https://coda.io/d/_df6rzXCWZj8/Revive-project-review_suwtiLjr>.
- How precompiles work, <https://coda.io/d/QF-Network_df6rzXCWZj8/How-precompiles-work_supZxHtN>.
- Governance for modifying precompiles set, <https://coda.io/d/_df6rzXCWZj8/Governance-for-modifying-precompiles-set_suEXoFy->.
