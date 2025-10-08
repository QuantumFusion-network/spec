---
name: ADR - Case Decomposition
about: Documents how a case was decomposed into experiments and why
title: 'ADR #[ID]: Case Decomposition - [Case Name]'
labels: 'adr, case-decomposition'
assignees: ''
---

# ADR #[ID]: Case Decomposition - [Case Name]

*This ADR documents the decomposition of a case into implementing experiments. For full case context, see the Case Brief.*

## Date

**Decision date:** YYYY-MM-DD  
**Last status update:** YYYY-MM-DD

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

### Decision Owner
[Person/team accountable for this decomposition decision]

### Consulted (Architects/Tech Leads)
- [Person 1]
- [Person 2]

### Informed (Affected Teams)
- [ ] [Person 1]
- [ ] [Person 2]

*Note: Check your name after reading this ADR.*

## Decision

**Parent Case:** [Link to Case Brief]

**Experiment List:**

1. [Experiment Name/ID] - [Brief description]
   - Addresses acceptance criteria: [Link to specific criterion in Case]
   - Focus: [What this experiment validates/builds]

2. [Experiment Name/ID] - [Brief description]
   - Addresses acceptance criteria: [Link to specific criterion in Case]
   - Focus: [What this experiment validates/builds]

3. [Experiment Name/ID] - [Brief description]
   - Addresses acceptance criteria: [Link to specific criterion in Case]
   - Focus: [What this experiment validates/builds]

[Continue for all experiments...]

**Decomposition Approach:** [Brief 1-2 sentence summary - e.g., "Split by user-facing features to enable parallel development" or "Layered approach from infrastructure to UI"]

## Decision in Details *Optional*

[Use this section to explain the rationale for this specific decomposition]

**Why This Decomposition:**
- [Key reason 1 - e.g., "Enables parallel work streams"]
- [Key reason 2 - e.g., "Validates riskiest assumptions first"]
- [Key reason 3 - e.g., "Aligns with team expertise"]

**Decomposition Logic:**
[Explain how you arrived at this particular split - by feature? by layer? by risk? by dependency?]

**Sequencing Considerations:**
[If experiment order matters, explain why certain experiments must come before others]

**Team/Resource Considerations:**
[If team structure or available skills influenced the decomposition]

## Options *Optional*

[Use only if alternative decomposition approaches were seriously considered. Keep compact.]

**Alternative approaches considered:**

### Option 1: [Brief name] (NOT SELECTED)
- **Approach:** [1 sentence description]
- **Why not:** [Brief reason for rejection]

### Option 2: [Brief name] (NOT SELECTED)
- **Approach:** [1 sentence description]
- **Why not:** [Brief reason for rejection]

## Consequences *Optional*

[Use only if there are significant implications worth documenting. Keep compact.]

**Positive Consequences:**
- [Benefit of this decomposition approach]
- [What this enables]

**Trade-offs Accepted:**
- [What we're giving up with this approach]
- [Challenges this decomposition introduces]

**Risks:**
- [Risk if experiments don't compose correctly]
- [Mitigation approach]

## Advice *Optional*

[Raw, unfiltered input from people who provided advice during decomposition decision]

- [Advice given] ([Name, Role], YYYY-MM-DD)
- [Advice given] ([Name, Role], YYYY-MM-DD)

## References & Links

**Parent Case:**
- [Case Brief](link) - Full case context and acceptance criteria

**Related Architecture:**
- [Architecture Document](link) - System design influencing decomposition

**Related Cases:**
- [Case #X](link) - Related case that influenced this decomposition

**Background Material:**
- [Meeting notes](link)
- [Technical research](link)
- [Similar decomposition examples](link)

## ADR Relationships

### Supersedes
- ADR #[X]: [Previous decomposition decision if this replaces it]

### Superseded By
- ADR #[X]: [Future decomposition decision if this gets replaced]

### Related ADRs
- ADR #[X]: [Technical decision that influenced this decomposition]
- ADR #[X]: [Other case decomposition that this coordinates with]

---

**Checklist Before Accepting:**
- [ ] All case acceptance criteria mapped to experiments?
- [ ] Experiment sequence makes sense?
- [ ] No major gaps in coverage?
- [ ] Team capacity considered?
- [ ] Dependencies between experiments identified?
- [ ] Discussed in architectural forum if required?