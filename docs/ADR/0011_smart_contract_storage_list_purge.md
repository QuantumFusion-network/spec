# ADR Template

## Title: [Descriptive title of the architectural decision]

## Date
2025-06-05
Last status update: 2025-09-05

## Status
- [X] Proposed
- [ ] Accepted
- [ ] Rejected
- [ ] Deprecated
- [ ] Superseded by ADR #X

### Implementation Status
- [X] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People
- **Decision-makers**: Vas, Alisher, Andrew
- **Consulted**: KP
- **Informed**:
  - [1] Svyat
  - [2] Max

## Context

The ADR try to answer on two questions. Please see secgions `Question 1` and `Question 2`.

### Question 1:
How the fee logic for the storing on chain items, and running operations on top of it?
Answer on this: the PolkaDot logic respects an idea that everething is going to be fee'ed and every stored item should be deposited, see more at [2] and [3]. For instance:
```
Alice stores two contracts and two random value, means Alice has been deposite'd  for storing these data [4], and also fee would be run over transaction [2]. For return token back Alice have to remove stored contracts and random values.
```

This logic allows to protect the system from the case 'store everething and forever w/o any regulation and pinalties', ex: Eth. stores everething and forever that a huge issue of Eth, since storage size is growing forever and _NOT_ regulated.

Based on this QF should have `deposit system` for storing _ANY_ data on chain.

#### Proposed deposit system changes
For the base of deposit system I suggested to copy-past (but with tuned runtime config[5]) and
new benchmarks original polkadot's logic, else we would meet with issue that Alise could store
any number of data unless she has token for the *fee.

*The fee is not an object for this ADR, so it would be in the further ADRs that.

### Question 2:
We declared in [1] a methods `list()` and `purge()`, the first one allows to
list() stored keys releated to owner of the data, the second one allows to
delete everething that stored by owner of the data.

Both methods are not typical for the blockchains. This ADR tries to find a user
cases there these methods could be helpful.

#### Basic scenario for the list (AKA lising of the keys)
Getting all keys of stored onchain values via RPC call.

The key scenario: Alice has 10 tokens, she spent 9 token for storing 5 values and she does not know these keys; she migth run one of implementations for getting all keys for 0.1 token. Using these keys Alice can remove a _few_ or all values from the storage.
If we have easy-to-use `lising of the keys` then Alice could solve the task _flawless_ and with less _fees_.

##### Possible implmentation #1
Alice can use `list()` for N token for getting all keys implmented by QF team.
###### Pros:
- Easy to implement and could be effective to use (no extra load, like sync of blocks, for RPC nodes
and for user).
- Easy to use by user.
- Does not required any other subsystem.
- UI ready solution
###### Cons:
- Not a free-to-use for a user, it requires fee to be run. Alisher consern: extr vs just RPC call?
  Desidion: Need Arch
- Require to be supported by DevTeam.

#### Possible implmentation #2
Alice can run archive node and connect it to one or RPC nodes to collect all
blocks and analise own transactions using squid, etc.
##### Pros:
- Does not required to implement by DevTeam since it's buitin feature.
##### Cons:
- Not a user frendly. User should be very expirienc'ed.
- Extra load for RPC nodes.
- Not a UI ready solution.

#### Possible implmentation #3
Alice can use UI on top of QFNetwork's qf-squid and its GQL API for searching keys in the block history.
Also QF can introduce UI for simplification of the search of such data.
##### Pros:
- UI easy to implement by our DevTeam.
- Very user frendly solution.
##### Cons:
- Support of UI.
- Extra load for qf-squid and hasura GQL.

TODO: Alisher add class of the programs + cases

#### Possible implmentation #4
Alice can save keys inside the notes or/and inside the contract code, etc. So
store it localy somehow.
##### Pros:
- Does not required anything from DevTeam.
##### Cons:
- The most not user frendly solution.

#### Possible implmentation #5
All of these implmentation could be exist.
Pros & Cons it's a combination.

#### Basic scenario for the purge()
Delete all items that releated to the owner via RPC call.

The key scenario: Alice wishes to clean up the mess w/o extra `remove` calls,
since remove much expensive operation. I.e. remove complexity via RPC would
be: O(n). With `purge` would be O(1) for the Alice.

## Decision
### Question 1:
Copy existed PolkaDot deposit system for any type of storing items, and prepare ADR for understanding the `depositing` logic for QFNetwork.

### Question 2:
#### For the listing of the keys:
- Suggest to introduce #1 and #3
- Motivation: both are the most user and developer frendly solutions.

#### For the purge of the keys and its values:
- Suggest to introduce it, since it's much frendly for cleaning the owner's storage on chain.

### Alternatives Considered
### For the listing of the data:
- Suggest to users and developers use #3 (but w/o UI) and #5.

## References
- [1] [Contract storage](docs/PolkaVM/smart_contract_storage.md)
- [2] [Fees](https://docs.polkadot.com/polkadot-protocol/basics/blocks-transactions-fees/fees/), [R/W operations fees](https://docs.polkadot.com/polkadot-protocol/basics/blocks-transactions-fees/fees/#weights-and-database-readwrite-operations), [W3 research respected by PolkaDot](https://research.web3.foundation/Polkadot/overview/token-economics#relay-chain-transaction-fees-and-per-block-transaction-limits)
- [3] [Example of optimising of storage deposit](https://github.com/paritytech/polkadot-sdk/issues/5012)
- [4] [FRAME references for revive](https://github.com/paritytech/polkadot-sdk/blob/master/substrate/frame/revive/src/storage.rs)
- [5] [For pallets](https://docs.polkadot.com/polkadot-protocol/basics/blocks-transactions-fees/fees/), [Base runtime formula](https://docs.polkadot.com/polkadot-protocol/basics/blocks-transactions-fees/fees/#how-fees-are-calculated), [Auto generated weights](https://github.com/paritytech/substrate/blob/master/frame/examples/basic/src/weights.rs#L18)
