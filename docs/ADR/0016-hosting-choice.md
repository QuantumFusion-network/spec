# ADR_0016: Hosting choice


## Date

Decision date: 2025-08-20
Last status update: 2025-08-22

## Status

- [x] Proposed
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

### Author/Decision Owner (Single Point of Accountability)
Vsevolod Rusinskiy

### Consulted (Subject Matter Experts)
[List of people with relevant expertise who provided advice]

  - [Person 1]
  - [Person 2]
  - [Person 3]

### Informed (Affected Parties)
[People/teams affected by this decision who should be aware]

  - [ ] [Person 1]
  - [ ] [Person 2]
  - [ ] [Person 3]

*Note: People listed in "Informed" should submit a PR to check their name after reading this ADR. This can be done during the initial review process of the ADR upload/commit PR (when the file is first uploaded to GitHub and the author requests reviews), or in a separate PR after the ADR is merged.*

## Decision

We will migrate the Polkadot/Substrate portal hosting from the current manual setup to a modern hosting platform that provides built-in CI/CD.

## Context

Currently, the Polkadot/Substrate portal is deployed manually without automated processes.  
The current approach has several limitations:  

- No CI/CD — there is no automated pipeline for build, tests, and deployment.  
- No preview environments — it is not possible to quickly showcase changes before merging into the main branch.  
- High dependence on individuals — releases and testing require specific team members, which slows down the workflow and reduces process resilience.  
- Limited scalability — as the team and project grow, the process becomes a bottleneck.  

### Decision Criteria (Optional)

[Explicit criteria for evaluating options, such as:
- Performance requirements
- Cost constraints
- Security requirements
- Maintainability needs
- Time-to-market considerations]

## Problem (Optional)

[Clearly state the problem being addressed. What issue or opportunity requires this architectural decision?]

## Decision in Details (Optional)

[Describe in details the decision made, including:
- Key technical details
- Implementation approach
- Timeline considerations
- Who is responsible for implementation]

### Decision Drivers (Optional)

- [Driver 1: Key force or requirement influencing the decision]
- [Driver 2: Another key consideration]
- [...]

## Options

[Briefly list the considered options. Each option is numbered for easy reference, with the selected option marked clearly as `(SELECTED)`. Aim for 3-5 options minimum. Always include at least "do nothing" option. A detailed description of each option can be written in the Consequences section below.]

1. **(SELECTED) [Cloudflare Pages](https://pages.cloudflare.com/)**  
2. [Vercel](https://vercel.com/)  
3. [Netlify](https://www.netlify.com/)  
4. [GitHub Pages](https://pages.github.com/)  
5. Do nothing / Status quo (VPS)

### Hosting Platform Comparison

| **Criterion**                  | Cloudflare Pages ✅                                | Vercel ⚠️                  | Netlify  ⚠️                          | GitHub Pages ⚠️       |
| ------------------------------ | -------------------------------------------------- | ---------------------------- | -------------------------------------- | ----------------------- |
| **CI/CD from Git**             | Auto-deploy + preview                              | Auto-deploy + preview        | Auto-deploy + preview                  | Only Actions            |
| **Builds per month**           | 500 (Free), 5 000 (Pro), 20 000 (Business)         | 125 (Hobby), 1 000 (Pro)     | 300 build-minutes (Free), 25 000 (Pro) | Free                    |
| **Asset size limit**           | 25 MB per file                                     | 100 MB per file              | 25 MB per file                         | 100 MB per file         |
| **Custom domains per project** | 100 (Free), 250 (Pro), 500 (Business)              | 50 (Hobby), Unlimited* (Pro) | ~100 per site                          | 1 per site              |
| **Bandwidth / Requests**       | Unlimited static traffic                           | Unlimited static traffic     | 100 GB/mo (Free)                       | ~100 GB/mo (soft limit) |
| **Paid plans**                 | $25/mo or $20/yr (Pro: 5 000 builds, 5 concurrent) | $20/user/mo                  | $19/user/mo                            | Free (no Pro plan)      |
| **DX (convenience)**           | Convenient                                         | Best for Next.js             | Average                                | Minimal features        |
| **Already in use**             | Yes                                                | Yes                          | No                                     | No                      |
| **Team experience**            | Yes                                                | Yes                          | No                                     | No                      |
   




## Consequences (Optional)

### Option 1: Cloudflare Pages (SELECTED)

Cloudflare Pages is a hosting platform for static sites with a global CDN, built-in preview deployments, support for Workers/Functions and WebSocket, as well as unlimited traffic. The platform also provides strong security (WAF, DDoS protection, HTTPS/HTTP/3), which is especially important for public projects.  

**Selected because:**
- Fixed Pro plan at $25/month (or $20/month with annual billing), not tied to the number of team members.  
- Unlike Vercel and Netlify, the cost does not grow as the team scales.  
- Rich functionality: global CDN, preview deployments, Workers, WebSocket, unlimited traffic.  
- Powerful built-in security against attacks, included even in the base plan.  


**Selected despite:**
- [Drawback 1 that we accept]
- [Drawback 2 that we accept]

**Risks and Mitigations:**
- [Risk 1]
  - [Mitigation strategy 1]
- [Risk 2]
  - [Mitigation strategy 2]

**Failure Recovery:**
[How will we recover if this option fails?]

### Option 2: [Name of alternative option]

[Brief description of this option.]

**Rejected because:**
- [Critical drawback 1 - reason for rejection]
- [Critical drawback 2 - reason for rejection]

**Rejected despite:**
- [Potential benefit 1 we're giving up]
- [Potential benefit 2 we're giving up]

*(Repeat for additional options if applicable)*


## Implementation Notes (Optional)

[Any specific guidance for implementing this decision, including:
- Required dependencies
- Migration steps
- Testing considerations
- Failure Recovery / Rollback procedures]

## Confirmation (Optional)

[Describe how the implementation of this decision will be verified. Include:
- Acceptance criteria
- Testing approach
- Automated verification methods]

## Advice

- Define `build` and `deploy` in comparison table (Alisher Khassanov, 2025-08-20)
- Check platform limits such as requests, number of custom domains, etc. (Alisher Khassanov, 2025-08-20)

## Glossary (Optional)

- **[Term]**: [Definition]

## References

- [Related documents, links, and research materials]
- [Previous ADRs that influence this decision]
- [External resources that informed this decision]
- [Requirements or standards]

## ADR Relationships

[Fill in the section if applicable or leave blank for further filling.]

### Supersedes
- ADR #[X]: [Brief description of superseded decision]

### Superseded By
- ADR #[X]: [Brief description of superseding decision]

### Related ADRs
- ADR #[X]: [Brief description of relationship]