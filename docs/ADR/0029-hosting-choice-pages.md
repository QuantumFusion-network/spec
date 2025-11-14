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

---

## Additional Consideration

Cloudflare does recommend starting new full-stack projects on Workers; however, this guidance applies primarily to dynamic applications that rely on SSR or edge logic. At the same time, Cloudflare has not announced any deprecation of Pages: in the official article “Pages and Workers are converging into one experience” (https://blog.cloudflare.com/pages-and-workers-are-converging-into-one-experience/) Cloudflare explicitly states that Pages remain a supported part of the platform.