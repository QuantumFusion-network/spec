# Bref
As team we should follow rules to have understandable processes and code. This document covers how we work with versions, codes and its styles. If repository does not contain own rules, then this rules SHOULD be used.

Also please pay attention that some repositories has more complicated rules, these rules have own sections inside this document.

# Code style guide

- Rust: we respect [rust code style guide](https://doc.rust-lang.org/nightly/style-guide/) and we should follow it. Exception: if repository has own code style guide (ex: [polkadot-sdk](https://github.com/paritytech/substrate/blob/master/docs/STYLE_GUIDE.md)) we should use it.
- JS: we respect [Google JS Style guide](https://google.github.io/styleguide/jsguide.html)
- Bash/Python/Other languages: please remember about basic styles and try to do not reach 80 columns limit.

# Develop and version guide

## General develop and version guide
- Each new feature or a fix SHOULD have a branch name with ticket number. Format: $username/issue-$number. If you have a huge ticket and dont have issue, please create a ticket.
- Each PR SHOULD contain a reference to releated ticket and please check our repo protected rules.
- After PR is merged ticket could be set to done, else it's in progress. And reviwing process is on developer side. Please feel free to ping other team mebers to done with review.
- A commit message SHOULD be clear but short, else PR could be rejected.
- Version SHOULD be MAJOR-MINOR-PARCH, for project that based on polkadot repos SOULD be PROJ_REPO_VERSION_MAJOR-PROJ_REPO_VERSION_MINOR-PROJ_REPO_VERSION_PATCH.

## Additinitional guide for polkadot-sdk

### Only for Fastchain
- Only `polkadot-sdk` master branch SHOULD be used to develop new features like SPIN, QMDB, etc.
- All changes SHOULD be stored at our fork of `polkadot-sdk` [repo](https://github.com/QuantumFusion-network/polkadot-sdk) in master branch, [qf-solochain](https://github.com/QuantumFusion-network/qf-solochain) depends on this repo.
- Please pay attention that we sync latest master time-to-time, please merge your branch to our master often. Else you may have unexpected broken build.

### Only for Parachain
- Only `polkadot-sdk` RELEASE [branch](https://github.com/paritytech/polkadot-sdk/releases) SHOULD be used to develop new features.
- All changes SHOULD be stored at our fork of `polkadot-sdk` [repo](https://github.com/QuantumFusion-network/polkadot-sdk) in release branch.
- Please pay attention that we sync latest release branches from time to time, please merge your branch to our master often. Else you may have unexpected broken build.
