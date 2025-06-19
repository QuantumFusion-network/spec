# ADR Template

## Title: Deposit system for the on chain storage & list, purge possible implementation

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
  - Sviat
  - Max

## Context

The ADR tries to answer on two questions. Please see sections `Question 1` and `Question 2`.

### Question 1:
How the fee logic for the storing on chain items, and running operations on top of it?
Answer on this: the Polkadot logic respects an idea that everything is going to be fee'd and every stored item should be deposited, see more at [2] and [3]. For instance:
- Alice stores two contracts and two random value.
- Means Alice has been spent (frozen) tokens, i.e. made deposit, for storing this data [4][2].
- To return deposit'ed tokens back: Alice would have to removed stored contracts and random values.

This logic allows to protect the system from the case 'store everything and forever w/o any regulation and penalties', ex: Ethereum. stores everything and forever that a huge issue of Ethereum, since storage size is growing forever and _NOT_ regulated.

Based on this QF should have `deposit system` for storing _ANY_ data on chain.

#### Proposed deposit system changes
For the base of deposit system I suggested to copy-and-paste (but with tuned runtime config[5]) and
new benchmarks original Polkadot logic, else we would meet with issue that Alice could store
any number of data unless she has token for the *fee.

*The fee is not an object for this ADR, so it would be in the further ADRs.

### Question 2:
We declared in [1] methods `list()` and `purge()`, the first one allows to
list() stored keys related to owner of the data, the second one allows to
delete everything that's stored by owner of the data.

Both methods are not typical for the blockchains. This ADR tries to find and describe user cases for both.

#### Basic scenario for the list (AKA listing of the keys)
Getting all stored on chain values keys via RPC call and inside the contract via SDK (SDL's `list` is optional, could be implemented just because it's easy-to-be-done).

_The scenario_: Alice has 10 tokens, she spent 9 tokens for storing 5 values and she does not know keys. She might run one of implementations (via RPC or SDK) for getting all keys for 0.1 token. Using output of `list` Alice can remove a _few_ or all values from the storage and return back deposited tokens. If QF has easy-to-use `listing of the keys` then Alice could solve the task _flawlessly_, else see `possible implementations`.

For getting more details please find [List | User case](docs/ADR/0011_implmentations_visualization.drawio) that shows search cases.


##### Possible implmentation #1: RPC's list
Alice can use `list()` for getting all keys via single RPC call.

The scenario and the concept of architecture could be found at [page I1](docs/ADR/0011_implmentations_visualization.drawio).

###### Pros:
- Easy to implement and could be effective to use (no extra load, like sync of blocks, for RPC nodes
and for user).
- Easy to use by user.
- Does not required any other subsystem.
- UI ready solution
###### Cons:
- Require to be supported by DevTeam.

#### Possible implmentation #2: self hosted archive node or Alice saves reminders somehow
Alice can install (or have installed) archive node and connect it to one or QF Full Node to collect all blocks. The sync is finished Alice can traverse over self hosted arhive node directly or via ETL tooling (like squid).

Or/And Alice can save keys inside the notes or/and inside the contract code, etc. So she is storing it somehow off chain.

The scenario and the concept of architecture could be found at [page I2](docs/ADR/0011_implmentations_visualization.drawio).

##### Pros:
- Does not required to implement anything by DevTeam - it's buitin feature of Substrate.
##### Cons:
- Not a user frendly. Alice have to be very experienced.
- Extra load for QF nodes.

#### Possible implmentation #3: QF hosted service
Alice can use UI on top of QFNetwork's qf-squid and its GQL API for searching keys in the block history.
Also QF can introduce UI for simplification of the search of such data.

The scenario and the concept of architecture could be found at [page I3](docs/ADR/0011_implmentations_visualization.drawio).

##### Pros:
- UI easy to implement by our DevTeam.
- Very user frendly solution.
##### Cons:
- Support of UI.
- Extra load for qf-squid and hasura GQL.

TODO: Alisher add class of the programs + cases

#### Possible implmentation #4: mix
All of these implmentation could be exist.
Pros & Cons it's a combination.

#### Basic scenario for the purge()
Delete all items that releated to the owner via RPC call.

_The key scenario_: Alice wishes to clean up the mess w/o extra `remove` calls,
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
- [6] [The scenario and the concept of architecture](docs/ADR/0011_implmentations_visualization.drawio)]

