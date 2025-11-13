# ADR_0029: Web apps hosting (Cloudflare Pages)

## Date
Decision date: 2025-11-13

## Status
- [x] Accepted

## Author/Decision Owner
Vsevolod Rusinskiy

## Decision
We migrate Polkadot/Substrate portal hosting to Cloudflare Pages for static frontend, using its built-in CI/CD and CDN.

## Options
1. **(SELECTED) Cloudflare Pages**
2. Vercel
3. Netlify
4. GitHub Pages
5. Do nothing (status quo)

## Consequences
Cloudflare Pages is chosen because:
- Simpler and cheaper for pure static hosting than Workers/other options
- Global CDN, built-in CI/CD, free for our scale
- Supports preview deployments for QA

Supersedes: ADR-0016