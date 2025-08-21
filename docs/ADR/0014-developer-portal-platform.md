# ADR_0014: Developer Portal Platform

## Date

Decision date: YYYY-MM-DD.  
Last status update: 2025-07-29.

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

- Alisher Khassanov, [@khssnv](https://github.com/khssnv).
- Denis Pisarev, [@TriplEight](https://github.com/TriplEight).

### Consulted

- Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).
- Memechi Kekamoto, [@MemechiKekamoto](https://github.com/MemechiKekamoto).

### Informed

- [ ] Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [ ] Sviatoslav Alekseev, [@zotho](https://github.com/zotho).

## Decision

We will choose developer portal content creation, processing, and publishing tools and platforms in scope of the ADR.

## Context

Content types:

- Entry point.
- Guides and tutorials.
- Rust documentation.
  - Blockchain node internal documentation.
  - Native Rust SDK for smart contracts public documentation.

What we like:

- <https://polkadot.com/> -> <https://polkadot.com/developers> -> <https://docs.polkadot.com/> -> <https://docs.polkadot.com/develop/>.
- <https://paritytech.github.io/polkadot-sdk/>
- <https://crust.network/> - Build on Crust -> <https://wiki.crust.network/docs/en/build101>.

### Decision Criteria

#### Key principles

## Options

### Option 1

What works best for each content type.

- A page on the main website as an entry point.
- GitBook for guides and tutorials (at docs.qfnetwork.xyz).
- rustdoc and GitHub pages for Rust projects such as `qf-solochain` and native Rust SDK for smart contracts.

### Option 2

## Advice

- "I would exclude polkadot.com... I would generally start with docs.polkadot.com and wiki.polkadot.com." (Denis Pisarev, 2025-07-30)
- "Paritytech.github.io is generally just Rustdoc, and it needs to be merged into this similar domain or docs.polkadot.com regardless." (Denis Pisarev, 2025-07-30)
- "Let's conduct separate studies of what tools web projects use, and then compare and draw some conclusions." (Denis Pisarev, 2025-07-30)
- "I plan for like built-in documentation so there will be like question mark buttons and explanations everywhere... content will be published on documentation portal and... there will be a link to documentation." (Denis Pisarev, 2025-07-30)
- "Everything that supports a modern MD format is capable of having the links to the chapters, to the paragraphs, and that would be enough." (Denis Pisarev, 2025-07-30)
- "The central source of truth will move to... the developer portal." (Denis Pisarev, 2025-07-30)

### Option 1. What works best for each content type

- "Rustdoc is unavoidable. It's the only thing for Rust documentation... Rustdoc kind of doesn't fit for it [MD documentation]." (Denis Pisarev, 2025-07-30)
- "Making... the other documentation in MDbook or MK docs compatible in terms of linking or cross-linking between MDBook parts of portal and the Rustdoc part of portal that's going to be tricky and effectively no one is doing it." (Denis Pisarev, 2025-07-30)

Unified platform.

## Glossary

- Entry point - starting point for accessing developer portal content.
- GitHub Pages - website hosted directly from GitHub repository. Example: <https://paritytech.github.io/polkadot-sdk/>.
- rustdoc - a tool to generate documentation for Rust projects from the standard Rust distribution. Example: <https://paritytech.github.io/polkadot-sdk/>.
