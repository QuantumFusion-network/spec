---
name: Implementation Experiment
about: Hypothesis-driven technical implementation - validates specific technical approach
title: '[EXPERIMENT] [Brief descriptive title]'
labels: 'experiment'
assignees: ''
---

[Experiment writing rules:
- Hypothesis-Driven: Clear technical assumption being tested
- Lightweight: Minimal verification - focus on validating hypothesis
- Engineer Freedom: Choose verification approach that fits hypothesis
- Run Fast: Code may be thrown away if hypothesis fails
- Technical Focus: Success criteria are technical, not product/user outcomes. Product criteria live in Case Brief
- Link, Don't Copy: Reference Case Brief, Architecture docs - don't duplicate]

## Experiment Type & Hypothesis

**Type:** [Implementation / Research / Analysis / Proof-of-Concept]

**What we believe:** [Technical approach or assumption we're testing]

**Expected outcome:** [Measurable technical result we expect]

**How we'll verify:** [Brief verification approach - detailed in Success Criteria below, expand in Verification Approach if non-standard]

## Implementation Scope

[What we're building/testing in 1-2 sentences - keep brief and specific]

**In Scope:**
- [Specific technical work included]
- [Component/feature being implemented]

**Out of Scope:**
- [What's explicitly not included - link to other experiments if applicable]

## Technical Approach *Optional*

[Optional - use if you need to document specific implementation approach, tech choices, or setup]

**Implementation Notes:** 
[Key technical decisions or approach details]

**Technology Stack:** [If relevant to hypothesis]
- [Technology/tool/Library] - [Optional - brief reason. Detailed "why" in ADRs if architectural decision]

## Engineered System Context *Optional*

[Optional - use if experiment context isn't obvious from Case Brief and Architecture docs]

**Engineered System Focus:** [Which part of the system this experiment addresses]

**Component:** [Specific component being modified/created/tested]

**Architecture Layer:** [Where this fits - e.g., Presentation / Business Logic / Data / Infrastructure]

**Integration Points:** [Only if relevant to this experiment]
- [Interface/API this experiment provides or consumes]
- [System this experiment integrates with]

*Example Integration Points:*
- *REST API endpoint: POST /api/contracts/deploy*
- *WebSocket connection for real-time updates*
- *Integration with external payment service via HTTPS*

*For complete integration architecture, see: [Architecture Documentation](link)*

**Critical Path:**

*Impediments* (Active obstacles):
- [Active obstacle preventing work] - Status: [Active/Resolved]

*Bottlenecks* (Resource constraints):
- [Resource constraint slowing progress]

*External Blockers* (Third-party dependencies):
- [Dependency causing delays] - Expected resolution: [Timeline]

*Blocking this experiment:*
- [Experiment/System #X must complete first]

## Outcomes

[Checkbox list - when all checked, experiment is ready to close]

**Code/Artifacts:**
- [ ] [Specific code module/component committed to branch X]
- [ ] [Configuration file updated]
- [ ] [Database migration script created]
- [ ] [API endpoint implemented]
- [ ] [Test suite added]

**Documentation:**
- [ ] [Technical specification document created]
- [ ] [API documentation updated]
- [ ] [Architecture diagram added to wiki]

**Analysis/Research:**
- [ ] [Performance analysis report completed]
- [ ] [Technology comparison matrix documented]
- [ ] [Proof-of-concept demo recorded]

**Required Completion Items:**
- [ ] Hypothesis outcome documented in Results section (Confirmed/Rejected/Inconclusive)
- [ ] Key learnings captured in Results section
- [ ] Impact on parent case documented in Results section
- [ ] Next steps identified based on outcome

## Success Criteria & Metrics

[Focus on technical criteria - product criteria are in Case Brief]

**Hypothesis Confirmed If:**
- [ ] [Specific measurable technical criterion with threshold]
- [ ] [Performance metric with acceptable range]
- [ ] [Quality/capability demonstrated]

**Hypothesis Rejected If:**
- [ ] [Specific technical failure condition]
- [ ] [Performance below minimum threshold]
- [ ] [Critical quality requirement not met]

**Inconclusive If:**
- [ ] [Conditions requiring further investigation]
- [ ] [Mixed results needing additional experiments]

## Verification Approach *Optional*

[Optional - Document only if you're NOT doing standard code review + basic testing]

**Standard approach assumed:** Code review + linter + basic testing to verify hypothesis

**Special verification for this experiment:**
- [Document only non-standard verification needs, e.g.:
  - Load testing with specific parameters
  - Security review due to sensitive operations
  - Integration testing with specific external system]

## Resources & Timeline

**Team:**
- [Role/Person] - [Time commitment]

**Timeline:** [Estimated duration for experiment]

## Decision Log

[Enumeration of related ADRs - decisions themselves live in ADR documents]

- [Date] - ADR #[XXXX] - [Case decomposition decision] - [Link to ADR]
  Status: [Active/Superseded by ADR #[XXXX]]
- [Date] - ADR #[XXXX] - [Brief description] - [Link to ADR]
  Status: [Active/Superseded by ADR #[XXXX]]

## References & Links

**Case Brief:** [Link] - See acceptance criteria for product context

**Full Case Details:**
- [Case Product Specification](link-to-coda) - Extended product analysis, detailed agent journeys, business context

**Architecture Docs:** [Link if exists] - Technical architecture and design decisions

**Additional Resources:** [Optional]
- [Tool documentation]
- [Best practices guide]
- [Research paper]
- [Meeting notes]
- [Related experiments]

## Results & Learning

[Fill after experiment completion]

**What Happened:**
[Actual results compared to expected outcome]

**Hypothesis Outcome:** [Confirmed / Rejected / Inconclusive]

**Confidence Level:** [High / Medium / Low]

**Key Insights:**
- [What we learned about the technical approach]
- [Unexpected technical discoveries]

**Impact on Parent Case:**
- [How these results affect parent case acceptance criteria]
- [What case assumptions were validated/invalidated]

**Next Steps:**

*If Confirmed:*
- [ ] [Specific next action]
- [ ] [Next experiment to validate]

*If Rejected:*
- [ ] [Alternative approach to investigate]
- [ ] [Case pivot consideration]

*If Inconclusive:*
- [ ] [Additional investigation needed]
- [ ] [Refinement to experiment design]

## Review & Acknowledgment

[People who should review and acknowledge understanding of this experiment]

- [ ] [Person 1]
- [ ] [Person 2]
- [ ] [Person 3]

*Note: Check your name after reading and understanding this case to confirm awareness and reduce communication overhead.*

---

**Final Checklist Before Submitting:**
- [ ] Is hypothesis clear and testable?
- [ ] Are success criteria measurable and technical (not product-focused)?
- [ ] Is scope limited and specific to this experiment?
- [ ] Are links to Case Brief and Architecture docs present?
- [ ] Are only critical dependencies listed?
- [ ] Is verification approach appropriate (standard or documented special needs)?
- [ ] Is this lightweight enough for experimental approach (not production feature development)?
- [ ] Does Decision Log enumerate relevant ADRs?
- [ ] Are Outcomes specific and actionable?