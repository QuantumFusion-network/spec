# PolkaVM Pallet

This document describe: key features of PolkaVM v2 pallet (not all are implmented).
Design could be found at `docs/PolkaVM/PolkaVMv2.drawio`.

## PolkaVM Blob hasing & addressing

Desing could be found at `docs/PolkaVM/blob_hashing_addressing.md`.

## Key features

- PolkaVM instance is running inside Substrate runtime, it allows to communicate
with state w/o complicated development process.
- For PolkaVM SmartContracts we introduce Framework, that allows to communicate
with state on chain within controlled limitations (eg: we don't expose that could be not safe to use). All communication wrapped in to linked functions into PolkaVM code; these functions might be used to run operations (eg balance transfering).
- PolkaVM SmartContracts have uniq, stored in the change address and any contract could be called via it.
- PolkaVM and Substrate runtime use as fast as possible arguments marshaling.


## GAS
WIP
