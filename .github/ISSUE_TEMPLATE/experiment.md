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
- DRY: Reference Case Brief, Architecture docs - don't duplicate
- Dependencies: Use GitHub issue status ('Blocked') and comments for blockers. Don't list dependencies in the experiment description - that's project management, not technical specification
- ADRs Optional: Create Architecture Decision Records (ADRs) only when decisions affect other teams or have long-term consequences. Engineers have freedom for local implementation choices]

## Experiment Hypothesis

**Hypothesis:** [Technical approach or assumption we're testing]

**Rationale:** [Optional - brief rationale if not obvious]

## Out of Scope

[What's explicitly not included - prevents scope creep]

- [Exclusion with brief reason]
- [Link to other experiment handling this if applicable]

## Technical Approach *Optional*

[Optional - use if you need to document specific implementation approach, tech choices, or setup]

**Implementation Notes:** 
[Key technical decisions or approach details]

**Technology Stack:** [If relevant to hypothesis]
- [Technology/Tool/Library] - [Optional - brief reason. Detailed "why" in ADRs if architectural decision]

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

## Outcomes

[Checkbox list of concrete deliverables - when all checked, experiment is complete. If needed create categories that match your work. The following provides examples of the categories and outcomes]

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
- [Document only non-standard verification needs, e.g., load testing, security audit, manual testing protocol, etc.]

## Decision Log *Optional*

[Enumeration of related ADRs - decisions themselves live in ADR documents]

- [Date] - ADR #[XXXX] - [Case decomposition decision] - [Link to ADR]
  Status: [Active/Superseded by ADR #[XXXX]]
- [Date] - ADR #[XXXX] - [Brief description] - [Link to ADR]
  Status: [Active/Superseded by ADR #[XXXX]]

## References & Links *Optional*

[Include this section when you need to reference external context, related work, or technical background. Delete if not applicable.]

**Architecture Docs:** [Link if exists] - Technical architecture and design decisions

**Technical Documentation:**
- [Architecture docs, API specs, standards]

**External Resources:**
- [Research papers, library docs, similar implementations]

**Additional Resources:**
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

- [ ] @github-handle-1
- [ ] @github-handle-2
- [ ] @github-handle-3

*Note: Check your name after reading and understanding this experiment to confirm awareness and reduce communication overhead.*

---

[Note: Delete this checklist section once the experiment is submitted]

[Final Checklist Before Submitting:
- [ ] Is hypothesis clear and testable?
- [ ] Are outcomes concrete and verifiable?
- [ ] Are success criteria specific with measurable thresholds?
- [ ] Is scope limited (what's excluded is clear)?
- [ ] Is this focused on validating one specific technical approach?
- [ ] Are we running fast to test the hypothesis, not building the perfect solution?]