# ADR_0014: Developer Portal Platform

## Date

Decision date: YYYY-MM-DD  
Last status update: 2025-09-25

## Status

- [x] Proposed
- [ ] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [x] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner

- Alisher Khassanov, [@khssnv](https://github.com/khssnv)
- Denis Pisarev, [@TriplEight](https://github.com/TriplEight)

### Consulted

- Andreea Eftene [@statictype](https://github.com/statictype)
- Alexander Lygin, [@alexlgn](https://github.com/AlexLgn)
- Memechi Kekamoto, [@MemechiKekamoto](https://github.com/MemechiKekamoto)

### Informed

- [ ] Alex Vyatkin, [@actinfer](https://github.com/actinfer)
- [ ] Sviatoslav Alekseev, [@zotho](https://github.com/zotho)

## Decision

We will use Starlight/Astro as the unified platform for the QF developer portal, implementing the Diataxis documentation framework for content organization, with rustdoc integration for Rust-specific API documentation.

## Context

QF Network requires a comprehensive developer portal supporting multiple content types and audiences. The decision involves selecting tools and platforms that balance technical capabilities, maintenance overhead, and team expertise while delivering an excellent developer experience.

**Content Types:**

- Entry point and developer onboarding
- Guides and tutorials for various skill levels
- Live documentation by w3zard
- Rust documentation:
  - Blockchain node internal documentation
  - Native Rust SDK for smart contracts public documentation

**Current Tech Stack:**

- Main website: Svelte
- Other applications: React

### Decision Criteria

- **Developer Experience**: Search functionality, code snippets, navigation, and modern UX
- **Technical Capabilities**: SSR support, SEO optimization, framework flexibility
- **Team Alignment**: Compatibility with existing tech stack and skills
- **Maintenance Overhead**: Long-term support and update requirements
- **Documentation Architecture**: Support for Diataxis pattern and cross-linking
- **Hiring and Skills**: Impact on recruitment and team development

## Options

1. Starlight/Astro-based Unified Platform (SELECTED)
2. Docusaurus-based Platform
3. Mixed Platform Approach (GitBook + rustdoc)
4. Status Quo

## Consequences

### Option 1: Starlight/Astro-based Unified Platform (SELECTED)

Starlight built on Astro framework as the primary documentation platform, with rustdoc integration for Rust API documentation.

**Selected because:**

- Superior technical features (search, code snippets, SSR for islands)
- SEO-friendly with server-side rendering capabilities
- Framework-agnostic - can integrate existing React and Svelte components
- Modern appeal for developer hiring and team satisfaction
- Better maintenance characteristics than alternatives
- Built-in support for versioning through extensions
- Supports Diataxis documentation pattern effectively

**Selected despite:**

- Introduces new technology (Astro) to the team's stack
- Learning curve for team members unfamiliar with Astro
- Potential maintenance overhead from additional framework
- Potential fragmentation concerns

**Risks and Mitigations:**

- **Risk**: Team skill gap with Astro framework
  - **Mitigation**: Astro uses familiar JavaScript/TypeScript concepts; documentation framework requires minimal ongoing development
- **Risk**: Fragmented tooling and deployment complexity
  - **Mitigation**: Modern SSGs deploy similarly across hosting platforms; tooling alignment is consistent

**Failure Recovery:**
Migration to Docusaurus or GitBook remains possible as content is primarily markdown-based.

### Option 2: Docusaurus-based Platform

React-based Docusaurus for documentation with separate rustdoc hosting.

**Rejected because:**

- React components not SEO-friendly without SSR
- Less advanced search and code snippet capabilities
- More limited modern documentation features
- Not significantly better aligned with existing React usage

**Rejected despite:**

- Familiarity with React ecosystem
- More standardized choice in React ecosystem
- Potentially lower learning curve for team

### Option 3: Mixed Platform Approach (GitBook + rustdoc)

Different tools for different content types:

- GitBook for guides and tutorials (at docs.qfnetwork.xyz)
- rustdoc and GitHub Pages for API docs and Rust projects such as `qf-solochain` and native Rust SDK for smart contracts, separate entry point.

**Rejected because:**

- Fragmented user experience across different platforms
- Complex cross-linking between different documentation systems
- Higher maintenance overhead across multiple platforms
- Suboptimal search experience across platforms
- Inconsistent branding and navigation

### Option 4: Status Quo

**Rejected because:**

- Fails to address developer portal requirements
- Maintains poor developer onboarding experience
- No unified content strategy

## Implementation Notes

- Deploy Starlight site to match existing infrastructure patterns
- Follow Diataxis documentation framework for content organization (tutorials, how-to guides, technical reference, explanations)
- Use starlight-versions plugin for documentation versioning
- Integrate rustdoc output for Rust API documentation within Starlight navigation structure
- Implement cross-linking strategy between Starlight content and rustdoc sections
- Maintain consistency with main website branding and navigation patterns

## Confirmation

- [ ] Starlight deployment successfully hosts sample content
- [ ] rustdoc integration maintains cross-linking functionality
- [ ] Search functionality works across all content types
- [ ] Successful integration of React/Svelte components from existing codebase
- [ ] Version management working effectively for multiple documentation versions

## Advice

### General Architectural and Documentation Advice

- "I would exclude polkadot.com... I would generally start with docs.polkadot.com and wiki.polkadot.com." (Denis Pisarev, 2025-07-30)
- "Paritytech.github.io is generally just rustdoc, and it needs to be merged into this similar domain or docs.polkadot.com regardless." (Denis Pisarev, 2025-07-30)
- "Let's conduct separate studies of what tools web projects use, and then compare and draw some conclusions." (Denis Pisarev, 2025-07-30)
- "I plan for like built-in documentation so there will be like question mark buttons and explanations everywhere... content will be published on documentation portal and... there will be a link to documentation." (Denis Pisarev, 2025-07-30)
- "The central source of truth will move to... the developer portal." (Denis Pisarev, 2025-07-30)
- "Have you considered diataxis? <https://diataxis.fr/application/> the most useful docs for me follow this pattern. it is quite common in the JavaScript world. I find it more meaningful than what Astar has." (Andreea Eftene, 2025-09-17)

### Option 1: Starlight/Astro Platform

**Technical Arguments Supporting Starlight:**

- "In a nutshell, I like Starlight because of its focus on user friendly technical documentation and modern approaches. The search is better, the code snippets are better, it is the only one that supports SSR for its islands" (Andreea Eftene, 2025-09-17)
- "The content that comes from React in a Docusaurus setup will not be SEO friendly" - highlighting SEO advantages (Andreea Eftene, 2025-09-17)
- "I'd move from Docusaurus to it [Starlight]." (Denis Pisarev, 2025-09-17)
- "I've seen many Starlight example deployments with versioning." (Denis Pisarev, 2025-09-17)

### Technology Stack Concerns and Responses

**Concerns About Third Framework:**

- "I'm a little concerned about the third JavaScript framework in the company, we already have the website built using Svelte and React for everything else" (Alisher Khassanov, 2025-09-16)
- "This means all the typical considerations apply: weaker skill concentration, reduced code reuse, fragmented tooling/infra, probably higher hiring overhead, increased maintenance cost" (Alisher Khassanov, 2025-09-17)
- "What do you think makes Starlight more compelling for us than, say, Docusaurus, which is probably be the default choice for teams working primarily with React?" (Alisher Khassanov, 2025-09-17)

**Responses Addressing Technology Stack Concerns:**

- "Astro is framework-agnostic. You can use both Svelte and React components with it" - addressing code reuse concerns (Andreea Eftene, 2025-09-17)
- "... working with Astro Starlight and React vs working with Docusaurus and React should not be that different in terms of skills needed" (Andreea Eftene, 2025-09-17)
- "You can deploy any JavaScript framework to any hosting platform (Cloudflare, Vercel etc) with more or less the same code. The instructions to do so are spoon-fed on each tool's website. Tooling is 100% the same." (Andreea Eftene, 2025-09-17)
- "It is expected from frontend devs to juggle multiple frameworks... also, frontend devs love modern stuff, so tech stack mentioning Astro Starlight is more appealing than Docusaurus" (Andreea Eftene, 2025-09-17)
- "We have to maintain the project either way. I would argue that Astro is a more modern framework that makes maintenance easier." (Andreea Eftene, 2025-09-17)

### Option 3: Mixed Platform Approach

- "rustdoc is unavoidable. It's the only thing for Rust documentation... rustdoc kind of doesn't fit for it [MD documentation]." (Denis Pisarev, 2025-07-30)
- "Making... the other documentation in MdBook or MK docs compatible in terms of linking or cross-linking between MdBook parts of portal and the rustdoc part of portal that's going to be tricky and effectively no one is doing it." (Denis Pisarev, 2025-07-30)
- "Everything that supports a modern MD format is capable of having the links to the chapters, to the paragraphs, and that would be enough." (Denis Pisarev, 2025-07-30)

## Glossary

- **Astro**: Modern web framework focusing on content-driven websites with component flexibility
- **Diataxis Framework**: Documentation framework organizing content into four types: tutorials, how-to guides, technical reference, and explanations
- **Entry point**: Starting page for accessing developer portal content, integrated into main website
- **Framework-agnostic**: Ability to work with or integrate components from multiple JavaScript frameworks (React, Svelte, etc.)
- **GitHub Pages**: Website hosted directly from GitHub repository. Example: <https://paritytech.github.io/polkadot-sdk/>
- **Islands Architecture**: Astro's approach to selectively hydrating interactive components
- **SSR (Server-Side Rendering)**: Technique where web pages are rendered on the server before being sent to the client, improving SEO and initial load performance
- **Starlight**: Documentation framework built on Astro, specifically designed for technical documentation sites
- **Static Site Generator (SSG)**: Tool that generates static HTML pages from templates and content, enabling fast-loading websites
- **rustdoc**: Official documentation generation tool for Rust projects, part of the standard Rust toolchain

## References

- [Starlight Documentation](https://starlight.astro.build/)
- [Astro Framework Documentation](https://docs.astro.build/)
- [Astro vs Docusaurus Migration Guide](https://docs.astro.build/en/guides/migrate-to-astro/from-docusaurus/)
- [Starlight Versions Plugin](https://github.com/HiDeoo/starlight-versions)
- [Starlight Search Example](https://starlight.astro.build/guides/site-search/)
- [Astro React Integration](https://docs.astro.build/en/guides/integrations-guide/react/)
- [Astro Svelte Integration](https://docs.astro.build/en/guides/integrations-guide/svelte/)
- [Diataxis Documentation Framework](https://diataxis.fr/)
- [Docusaurus Documentation](https://docusaurus.io/)
- [MdBook for Rust Projects](https://rust-lang.github.io/mdBook/)
- Polkadot documentation portals: <https://polkadot.com/> -> <https://polkadot.com/developers> -> <https://docs.polkadot.com/> -> <https://docs.polkadot.com/develop/>
- [Modern Polkadot documentation portal built with rustdoc](https://paritytech.github.io/polkadot-sdk/)
- [Build on Crust guide](https://wiki.crust.network/docs/en/build101)

## ADR Relationships

### Supersedes

- ADR #[X]: [Brief description of superseded decision]

### Superseded By

- ADR #[X]: [Brief description of superseding decision]

### Related ADRs

- ADR #[X]: [Brief description of relationship]
