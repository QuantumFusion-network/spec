---
name: Case Brief
about: Product-level overview for stakeholders - defines engineered system and acceptance criteria
title: '[CASE] [Brief descriptive title]'
labels: 'case'
assignees: ''
---

[Case Brief writing rules:
- Product Focus: Define agent value and experience, not technical implementation
- Problem Analysis: Lives in Case Product Specification - Brief references Spec for context
- Agent Priority: List agents by % importance with Human/System distinction (even if similar to other cases)
- Basic English: Write for non-native speakers, avoid complex technical terms
- Stakeholder Language: This brief is for business/product stakeholders
- Minimal Content: Engineers need context to understand "what" and "why", not extensive product analysis
- System Boundaries: Explicitly state what's included/excluded
- Link to Details: Extended analysis lives in Coda, link from here
- Scenario-Driven: Focus on agent behavior and acceptance, not system performance
- Scope Limit: Target 3-6 month achievable milestones
- Experiment Mapping: Link acceptance criteria to implementing experiments
- Metrics Cascade: Case Product Specification defines product success metrics → Case Brief translates to verifiable acceptance criteria → Experiments validate technical implementation
- Link Don't Duplicate: Reference specifications, don't copy content]

## Engineered System

[Which specific system/subsystem are we building and what is its position in the larger system architecture?]

*For detailed system context, complete problem analysis including current/desired agent experience, see: [Case Product Specification](link-to-coda)*

## Agent Priority Overview

[High-level stakeholder priorities with percentages. Detailed analysis in Case Product Specification in Coda.]

**Priority Distribution:** [e.g., "Primary: 60% Developers; Secondary: 30% System Integrators; Minimal: 10% End Users"]

**Rationale:** *Optional* [1-2 sentence justification for these priorities]

*For detailed agent analysis with agent journeys and integration requirements, see: [Case Product Specification](link-to-coda)*

## Expected Agent Experience & Acceptance

[Define scenarios the Engineered System must handle and acceptance criteria. Focus on observable outcomes, not internal system operations.]

*Note: Link acceptance criteria to implementing experiments during experiment planning phase.*

### Agent Acceptance Scenarios

**Scenario 1: [Primary Scenario for Primary Agent]**
- Given [detailed initial conditions]
- When [agent performs action]
- Then [agent experiences result]
- And [additional agent benefit]

**Acceptance Criteria:**
[Each criterion should be demonstrable within 5-10 minutes by non-developers or through developer demo. Validation methods: Observable (UI/logs/behavior), Measurable (counted/timed), Testable (test scripts), User-Validated (actual users)]

- [ ] [Specific criterion] → **Experiment**: [Link #XXX when available or TBD]
  - *Validation: [How to verify - e.g., "Dashboard shows metric within target"]*
- [ ] [Performance/quality requirement] → **Experiment**: [Link #XXX when available or TBD]
  - *Validation: [Verification method]*

**Scenario 2: [Secondary Scenario - Success path for Secondary Agent]**
- Given [different initial conditions]
- When [alternative agent action]
- Then [expected alternative outcome]

**Acceptance Criteria:**
- [ ] [Specific criterion] → **Experiment**: [Link #XXX when available or TBD]
  - *Validation: [Verification method]*

**Scenario 3: [Alternative Scenario - Different approach or edge case]**
- Given [edge case conditions]
- When [action that triggers alternative path]
- Then [expected handling]

**Acceptance Criteria:**
- [ ] [Specific criterion] → **Experiment**: [Link #XXX when available or TBD]
  - *Validation: [Verification method]*

**Scenario 4: [Error Scenario - Failure case and recovery]**
- Given [error conditions]
- When [action that triggers error]
- Then [expected error handling and recovery]

**Acceptance Criteria:**
- [ ] [Error handling criterion] → **Experiment**: [Link #XXX when available or TBD]
  - *Validation: [Verification method]*

## Scope Summary

### Engineered System Scope

**In Scope:** [What this system will do - boundaries included]

**Out of Scope:** [What explicitly will not be addressed - link to other cases handling these]

*For detailed interfaces and integration points, see: [Case Architecture Specification](link-to-arch-doc)*

## Critical Dependencies & Blockers

**Blocking This Case:**
- [Case/System #X]: [What must complete before we can proceed]

**This Case Blocks:**
- [Case/System #Y]: [What depends on this case's completion]

**Bottlenecks** (Resource constraints):
- [Resource constraint] - Impact: [Description]

**External Blockers** (Third-party dependencies):
- [Third-party dependency] - Expected resolution: [Timeline]

**Critical Path Items:**
- [Dependency with resolution date]
- [Risk requiring immediate attention]

*For complete dependency analysis and technical interfaces, see: [Case Product Specification](link-to-coda) and [Case Architecture Specification](link-to-arch-doc)*

## Decision Log

[Enumeration of related ADRs - decisions themselves live in ADR documents]

- [Date] - ADR #[XXXX] - [Case decomposition decision] - [Link to ADR]
  Status: [Active/Superseded by ADR #[XXXX]]
- [Date] - ADR #[XXXX] - [Brief description] - [Link to ADR]
  Status: [Active/Superseded by ADR #[XXXX]]

## References & Links

**Full Case Details:**
- [Case Product Specification](link-to-coda) - Extended product analysis, detailed agent journeys, business context

**Related Architecture:**
- [Case Architecture Specification](link-to-arch-doc) - Technical architecture, interfaces, integration points

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

- [ ] [Person 1]
- [ ] [Person 2]
- [ ] [Person 3]

*Note: Check your name after reading and understanding this case to confirm awareness and reduce communication overhead.*

---

**Final Checklist Before Submitting:**
- [ ] Does this describe agent value, not technical implementation?
- [ ] Is problem analysis referenced (not duplicated) from Case Product Specification?
- [ ] Is Agent Priority Overview high-level with justification?
- [ ] Are acceptance criteria clear and verifiable?
- [ ] Do scenarios use correct terminology (Primary/Secondary/Alternative/Error)?
- [ ] Is scope limited to 3-6 months of achievable work?
- [ ] Are only critical dependencies and blockers listed?
- [ ] Are links to Case Product Specification and Architecture docs present?
- [ ] Are experiment links marked as TBD where not yet planned?
- [ ] Is Review & Acknowledgment section complete?