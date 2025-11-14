# ADR_0016: Web apps hosting

## Date

Decision date: 2025-08-20
Last status update: 2025-08-22

## Status

- [ ] Proposed
- [ ] Accepted
- [x] Deprecated (2025-11-13)
- [x] Superseded by ADR-0029

### Implementation Status

- [x] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [x] Discontinued (replaced by ADR-0029)

## People

### Author/Decision Owner (Single Point of Accountability)
Vsevolod Rusinskiy

## Decision

We will migrate the Polkadot/Substrate portal hosting from the current manual setup to a modern hosting platform that provides built-in CI/CD.

## Context

Currently, the Polkadot/Substrate portal is deployed manually without automated processes.  
The current approach has several limitations:  

- No CI/CD — there is no automated pipeline for build, tests, and deployment.  
- No preview environments — it is not possible to quickly showcase changes before merging into the main branch.  
- High dependence on individuals — releases and testing require specific team members, which slows down the workflow and reduces process resilience.  
- Limited scalability — as the team and project grow, the process becomes a bottleneck.  

## Options

[Briefly list the considered options. Each option is numbered for easy reference, with the selected option marked clearly as `(SELECTED)`. Aim for 3-5 options minimum. Always include at least "do nothing" option. A detailed description of each option can be written in the Consequences section below.]

1. **(SELECTED) [Cloudflare Workers](https://workers.cloudflare.com/)**  
2. [Vercel](https://vercel.com/)  
3. [Netlify](https://www.netlify.com/)  
4. [GitHub Pages](https://pages.github.com/)  
5. Do nothing / Status quo (VPS)

### Hosting Platform Comparison

| **Criterion**                  | Cloudflare Workers ✅                                                 | Vercel ⚠️                  | Netlify  ⚠️                          | GitHub Pages ⚠️       |
| ------------------------------ | --------------------------------------------------------------------- | ---------------------------- | -------------------------------------- | ----------------------- |
| **CI/CD from Git**             | Auto-deploy + preview                                                 | Auto-deploy + preview        | Auto-deploy + preview                  | Only Actions            |
| **Builds per month**           | no limits (deploy via Wrangler/GitHub Actions)                        | 125 (Hobby), 1 000 (Pro)     | 300 build-minutes (Free), 25 000 (Pro) | Free                    |
| **Asset size limit**           | 25 MB per file                                                        | 100 MB per file              | 25 MB per file                         | 100 MB per file         |
| **Custom domains per project** | Unlimited (via routes/zones)                                          | 50 (Hobby), Unlimited* (Pro) | ~100 per site                          | 1 per site              |
| **Bandwidth / Requests**       | Free: 100k req/day, Paid: 10M req/mo incl. ($0.30 per 1M extra)       | Unlimited static traffic     | 100 GB/mo (Free)                       | ~100 GB/mo (soft limit) |
| **Paid plans**                 | Free, or $5/month incl. 10M req + 30M CPU-ms ($0.30 per 1M req after) | $20/user/mo                  | $19/user/mo                            | Free (no Pro plan)      |
| **DX (convenience)**           | Convenient                                                            | Best for Next.js             | Average                                | Minimal features        |
| **Already in use**             | Yes                                                                   | Yes                          | No                                     | No                      |
| **Team experience**            | Yes                                                                   | Yes                          | No                                     | No                      |
   
## Consequences (Optional)

### Option 1: Cloudflare Workers (SELECTED)

Cloudflare Workers is a serverless edge platform that can also host static assets via its integration with Pages. It provides a global CDN, built-in preview deployments, support for custom Workers/Functions and WebSockets, as well as unlimited static traffic. The platform also includes strong security features (WAF, DDoS protection, HTTPS/HTTP/3), which is especially important for public projects.

**Selected because:**
- Predictable entry-level plan at $5/month (includes 10M requests and 30M CPU-ms).  
- Unlike Vercel and Netlify, the cost does not grow with the number of team members.  
- Rich functionality: global CDN, preview deployments, Workers runtime, WebSockets, edge APIs.  
- Strong built-in security (WAF, DDoS protection, HTTPS/HTTP/3) even on free tier.   

## Advice

General adviсe:
- Define `build` and `deploy` in comparison table (Alisher Khassanov, 2025-08-20)
- Check platform limits such as requests, number of custom domains, etc. (Alisher Khassanov, 2025-08-20)
- Write down what stages the source code goes through before it becomes a page for the user (Alisher Khassanov, 2025-08-27)
- Create a table that defines these code change steps and think about the methods and artefacts (Alex Vyatkin, 2025-08-27)
- Сonsider using Vercel, as it is planned to be used for the W3zard and the team has experience working with it (Andreea Eftene, 2025-08-29)

Cloudflare Workers option:
- How is the build configured in Cloudflare Workers? For example, for GitHub Actions we write a YAML file in the Actions Workflow format
