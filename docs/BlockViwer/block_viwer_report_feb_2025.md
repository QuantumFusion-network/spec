# Block Viewer

`Note: Factual information for Jan - Fen 2025.`

Any blockchain project need a Block Viewer with UI and API; it allows to track and search transactions in the block for all history of the chain. Also QF chain is based on PolkaDot (Substrate) and PolkaDot ecosystem which is important factor for logic of this document, and all components SHOULD be open sources, since we have a target block time 0.1s, QF team already knows that not all UI components (ex: PolkaJS) can work well with such fast block production time.

#### Logical components of BlockViwer
- Data exporter: non-stop reading data from qf-node (QF is using archive node for that) for further indexing.
- Indexer: DBMS indexes and tables allows to run complex read queries (ex: search, track event).
- Query language (ex: GQL, RESTful API) server: A server connected to indexer and allow to use DSL (typically GQL) for reading indexer data.
- UI: connected to Query language server that allows to show dashboards via UI.

QF needs all components to be OpenSources, and UI should be re-brended to QF style.

#### List of OpenSource solutions

All solutions from this list have been tested with our DevNet and all solutions
be researched through reading codes and/or posted GH issues.

##### W/o UI (only Date exporter, Indexer and Quiry language)
- [squid-sdk](https://github.com/subsquid/squid-sdk): QF uses it for exporting data. GH: 1.2k starts at Feb 3 2025.
- [subql](https://github.com/subquery/subql): the same as squid-sdk. GH: 18k starts
at Feb 3 2025.
- [subscan-essentials](https://github.com/subscan-explorer/subscan-essentials):
GH: 198 start at Feb 3 2025. So it's less popular solution and focused on
subscan products only.

##### W/ UI
- [polkastats](https://github.com/polkastats/polkastats): does not work with
latest PolkaSDK. Last update was about 2 years ago at Feb 3 2025.
- [statescan-v2](https://github.com/opensquare-network/statescan-v2): does not
support many chains and does not look like production ready solution, i.e. https://github.com/opensquare-network/statescan-v2/issues - has perf issues and we have 0.1s blocks, https://github.com/opensquare-network/statescan-v2/issues/987 and https://github.com/opensquare-network/statescan-v2/blob/main/backend/packages/server/.env.example#L23 - limited numbers of chain supported.
- [explorer](https://github.com/polkascan/explorer): does not work with latest
PolkaSDK. Last update was (not including Dockerfile) about 2 years ago at Feb 3
2025.
- [explorer-ui](https://github.com/polkascan/explorer-ui): does not work well
with latest PolkaSDK. Last update was about 2 - 3 years ago at Feb 3 2025.
- [substrate-archive](https://github.com/paritytech/substrate-archive): does not
work well with latest PolkaSDK. Last update was about 3 - 4 years ago.

##### UI Kits (Frameworks)
- [subscan-widget-interface](https://github.com/subscan-explorer/widget-interface): compatible with subscan products.

#### List of non-free solutions
- [subscan.io](https://subscan.io): closed source and non-free solution.

#### Conclusion
`squid-sdk`, open source'ed components of `subscan` and `subql` look popular and great for
QF. However no UI component that can work with modern PolkaDot, only closed and non free is available, which is subscan.io.

#### Next steps
- (1) Introduce own open sourced UI compoment that would be connected to GQL server (for example squid-sdk).  Temporary solution for DevNet is Hasura which QF team used for dev purposes.
- (2) Use subscan.io.

