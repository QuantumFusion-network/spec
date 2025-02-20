# Testnet features set

## Basics

* Blocks are produced every 100 ms (on average) during a leader's tenure.
* Fast finality (notarization) from committee votes within seconds.
* Secure finality from the Polkadot testnet (Paseo) within tens of seconds.
* Configurable leader rotation period.
* Permissionless leader candidate accounts and committee accounts sets with stake requirements.
* Configurable leader tenure duration.

## Recovery

* The leader sends an alive message (block hash + notarizations) to the slow chain.
* Committee nodes track the availability of alive messages in the slow chain.
* Committee nodes validate alive messages.
* If a valid alive message is absent from the slow chain for a configurable period, recovery mode is initiated.
* Committee nodes stop notarization during recovery mode.
* During recovery mode, committee nodes post the latest block hash and notarization to the slow chain.
* Committee accounts that fail to post a notarization during recovery mode are removed from the committee account set.
* A new leader is selected at the end of recovery.
* The new leader resumes block production on top of the finalized block.

## Post testnet-launch

* High availability support for the leader node.
* High availability support for committee node.
* Leader rewards and penalties.
* Committee rewards and penalties.

### Yell message framework

* Any transaction on the fast chain can be executed via a transaction on the slow chain.

## Terms and definitions

* Leader - fast chain block producer.
* Committee - Thunderella committee.
* Fast chain - QF network blockchain.
* Slow chain - Thunderella "underlying blockchain", Polkadot.
