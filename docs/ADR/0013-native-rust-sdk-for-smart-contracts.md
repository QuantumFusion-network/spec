# ADR_0013: Native Rust SDK for smart contracts

## Date

Decision date: 2025-07-23.  
Last status update: 2025-11-24.

## Status

- [ ] Proposed
- [x] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [ ] Planned
- [x] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Decision Owner

Alisher Khassanov, [@khssnv](https://github.com/khssnv).

### Consulted

- Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- Memechi Kekamoto, [@MemechiKekamoto](https://github.com/MemechiKekamoto).

### Informed

- [x] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [ ] Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).
- [ ] Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

## Decision

We will develop a native Rust SDK for `pallet-revive` smart contracts, a lightweight extension to `pallet-revive-uapi` to enhance developer ergonomics and provide the missing functionality for common use cases.

## Context

- The official Polkadot documentation, <https://docs.polkadot.com/develop/smart-contracts/>, offers ink! as the Rust option for smart contracts development. The other option offered is Solidity.

- Native Rust smart contracts for PolkaVM exist only as test fixtures within the Polkadot SDK, see <https://github.com/paritytech/polkadot-sdk/tree/7a747ff/substrate/frame/revive/fixtures/contracts>.

- The QF Network's `qf-polkavm-sdk` project has a minimal set of abstractions, example contracts, and a CLI tool for deploying and invoking smart contracts, see <https://github.com/QuantumFusion-network/qf-polkavm-sdk/tree/850e169/>.

### Competitive landscape

#### Polkadot ecosystem

#### pallet-revive-uapi

See [Problem](#problem) section.

<!-- markdownlint-disable-next-line MD026 -->
#### ink!

Developer may choose our SDK because:

- It provides native Rust developer experience.
- There is no additional DSL to learn (e.g., `message`, `contract`).
- Minimal API, small set of new entities to learn in addition to `pallet-revive`.
- Friendly to unsafe optimizations.

#### Solidity

Same as other "Rust over Solidity" rationale, see <https://www.parity.io/blog/what-is-paritys-ink>.

#### Smart contract platforms

Out of scope for this ADR.

#### dApp platforms

Out of scope for this ADR.

## Problem

Developing native Rust smart contracts currently faces several challenges due to limitations in the platform's public API.

- Leaky abstractions. Smart contracts must directly interact with both PolkaVM and `pallet-revive` entities, exposing internal implementation details.
- Excessive boilerplate. Developers need to repeatedly write similar code across different contracts.
- Insufficient separation of concerns. Smart contract authors are required to handle low-level operations, rather than focusing solely on business logic.
- Non-ergonomic API.

## Decision in Details

- Avoid implicit import (namespace pollution, poor discoverability).
- Provide "prelude" module.
- Where possible try to expand `pallet-revive-uapi`, not replace it.

### Decision Drivers

- Why are we doing this?
- Why ink! isn't a sufficient replacement for Rust? What's the niche for native Rust smart contracts?

See [Advice](#advice) section for a rationale answering these questions.

## Options

### Option 1: Native Rust SDK for smart contracts

We will develop a native Rust SDK for `pallet-revive` smart contracts, a lightweight extension to `pallet-revive-uapi` to enhance developer ergonomics and provide the missing functionality for common use cases.

**Selected because:**

- Provides native Rust developer experience
- Addresses the previously mentioned [Problems](#problem)

**Selected despite:**

- Higher cost of ownership
- Needs significant communication effort for successful adoption

**Failure Recovery:**

If the decision turns out to be wrong, we can fall back to other supported smart contract development options for pallet-revive such as ink! and Solidity.

### Option 2: use the existing technology, don't create a new SDK

Offer ink! and / or Solidity for smart contracts development on QF Network.

## Advice

- Avoid creating separate, language-specific SDKs for each language in future multiple language implementations; ideally, architecturally it needs to only require the language interpreter or compiler adopted to be compatible with PolkaVM and everything else like all the rest of the logic is dealt with by pallets and precompiles (Denis Pisarev, 2025-07-23)
- Everything should be as minimalistic as possible. Meaning that if you integrate the language, you only integrate the language and... web2 language and that's it. Nothing blockchain specific, nothing additional to the language, no like overrides, no new standards, no nothing like that. So simply put the let's say the same Python or TypeScript work in PolkaVM as intended as the regular language (Denis Pisarev, 2025-07-23)
- To minimize the job and maintenance and reduce the duplicated job we only do pallets and precompiles in Rust and make make sure that they are callable from this languages (Denis Pisarev, 2025-07-23)
- An additional library may provide a more friendly interface to blockchain-specific functions, ensuring the language itself is not polluted with blockchain-specific entities (Denis Pisarev, 2025-07-23, Alisher Khassanov)
- Use one of the prominent languages [Rust] and start with it (Denis Pisarev, 2025-07-23)
- Go our own way [instead of promoting Ink!], aiming to be the first in Rust native smart contracts, which can lead others to adopt it (Denis Pisarev, 2025-07-23)
- Lower the entry barrier for web2 developers by offering native Rust, as Ink! is seen as a niche of the niche and not particularly a Rust (Denis Pisarev, 2025-07-23)
- Leverage existing Rust capacities and team enjoyment for Rust development, establishing our project as the locomotive for Rust native smart contracts (Denis Pisarev, 2025-07-23)
- Adopt Rust Native as a low-hanging fruit because it's almost adopted (Denis Pisarev, 2025-07-23)
- Improve code ergonomics for the Rust SDK by avoiding implicit imports, which "pollutes the name space" and are "not really discoverable", and instead "provide standard prelude module which will do that for very basic things" and "allow the users to import what they actually need" (Alisher Khassanov, 2025-07-23)
- Do not create demos merely for the sake of it, such as a chess game, if they don't significantly highlight unique features or offer strong value propositions of the platform; I just kind of don't see the point of of this demo on chain (Denis Pisarev, 2025-07-23)
- Introduce demos based on unique features of SPIN that are entertaining or offer good value propositions, rather than just basic games (Denis Pisarev, 2025-07-23)
- Consider a payment application as a demo dApp to visually show how transactions below a threshold use fast finality, and those over use secure finality, serving as a template for payment providers (Denis Pisarev, 2025-07-23)
