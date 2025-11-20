---
name: Case Brief
about: Product-level overview for stakeholders - defines engineered system and acceptance criteria
title: '[CASE] [Brief descriptive title]'
labels: 'case'
assignees: ''
---

[Case Brief writing rules:
- Product Focus: Define agent value and experience, not technical implementation
- Agent Priority: List agents by % importance with Human/System distinction (even if similar to other cases)
- Basic English: Write for non-native speakers, avoid complex technical terms
- Stakeholder Language: This brief is for business/product stakeholders
- Minimal Content: Engineers need context to understand "what" and "why", not extensive product analysis
- System Boundaries: Explicitly state what's included/excluded
- Link to Details: Extended analysis lives in Coda, link from here
- Acceptance Focus: Define observable outcomes that stakeholders can verify, not technical validation procedures
- Scope Limit: Target achievable work within project constraints (don't boil the ocean)
- DRY: Reference specifications, don't copy content
- Metrics Cascade: Case Product Specification defines product success metrics → Case Brief translates to verifiable acceptance criteria → Experiments validate technical implementation
- Dependencies: For complex dependency chains, create visual diagrams instead of listing in text
- ADRs: Technical decisions are documented in Architecture Decision Records (ADRs) within experiments, not in cases]

## Engineered System

[Which specific system/subsystem are we building and what is its position in the larger system architecture?]

## Agent Priority Overview

[High-level stakeholder priorities with percentages. Detailed analysis in Case Product Specification in Coda.]

**Priority Distribution:** [e.g., "Primary: 60% Developers; Secondary: 30% System Integrators; Minimal: 10% End Users"]

**Rationale:** *Optional* [1-2 sentence justification for these priorities]
## Expected Agent Experience & Acceptance

[Brief paragraph: What agents will be able to do after this case is complete. Focus on observable outcomes and agent value.]

### Acceptance Criteria

[Group criteria by agent type. Keep criteria simple and observable - verifiable by stakeholders in 5-10 minutes. Detailed validation procedures belong in Acceptance Experiment, not here. No experiment links - checkboxes show validation status when marked in stakeholder meetings.]

**For [Primary Agent Type]:**
- [ ] [Observable outcome or capability]
- [ ] [Measurable result or behavior]
- [ ] [Demonstrable functionality]

**For [Secondary Agent Type]:**
- [ ] [Observable outcome or capability]
- [ ] [Measurable result or behavior]

**For [Tertiary Agent Type]:**
- [ ] [Observable outcome or capability]
- [ ] [Measurable result or behavior]

[Continue for all relevant agent types. Focus on WHAT agents experience, not HOW the system works internally.]

## Scope Summary

### Engineered System Scope

**In Scope:** [What this system will do - boundaries included]

**Out of Scope:** [What explicitly will not be addressed - link to other cases handling these]

## References & Links *Optional*

[Include this section when you need to reference external context, related work, or technical background. Delete if not applicable.]

**Full Case Details:**
- [Case Product Specification](link-to-coda) - Extended product analysis, detailed agent journeys, business context

**Related Architecture:**
- [Case Architecture Specification](link-to-arch-doc) - Technical architecture, interfaces, integration points

**Related Cases:**
- [Case #XXX]: [Brief description of relationship]

## Learning Outcomes

[To be filled during and after case completion]

**What we learned:**
- Key insights gained:
- Assumptions validated/invalidated:
- Unexpected discoveries:

**What we would do differently:**
- Process improvements:
- Technical approach changes:

## Review & Acknowledgment

[People who should review and acknowledge understanding of this experiment]

- [ ] @github-handle-1
- [ ] @github-handle-2
- [ ] @github-handle-3

*Note: Check your name after reading and understanding this case to confirm awareness and reduce communication overhead.*

---

[Note: Delete this checklist section once the case is submitted]

[Final Checklist Before Submitting:
- [ ] Does this describe agent value, not technical implementation?
- [ ] Is Agent Priority Overview high-level with justification?
- [ ] Are acceptance criteria simple, grouped by agent?
- [ ] Are acceptance criteria verifiable by stakeholders (observable outcomes)? Are we focused on delivering demonstrable outcomes?
- [ ] Is scope limited to achievable work within project constraints?
- [ ] Are we solving the immediate problem, not building the ultimate solution (don't boil the ocean)?
- [ ] Are links to Case Product Specification and Architecture docs present?
- [ ] Is Review & Acknowledgment section complete with GitHub handles?]