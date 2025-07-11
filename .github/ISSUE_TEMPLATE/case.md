---
name: Case
about: Product-level description in stakeholder language - defines system boundaries and value propositions
title: '[CASE] [Brief descriptive title]'
labels: 'case'
assignees: ''

---

System Context: [Which system/subsystem this case addresses and its position in the larger system architecture]

## Problem Statement
[Describe the problem from the stakeholder's perspective. What current state needs to change and why? Leave technical details for `hypoteses`.]

### Current State

[What exists today]

### Desired State

[What we want to achieve]

### Gap

[What's missing or broken]

## Value Proposition

[Clearly articulate the value this case will deliver to the organization and stakeholders]

## Stakeholder Analysis

[Map all stakeholders with their roles, interests, and influence on the system]

**[Actor 1]**
Role:
Interest/Goal:
Influence Level: [High/Medium/Low]
[How they measure success]

**[Actor 2]**
Role:
Interest/Goal:
Influence Level: [High/Medium/Low]
[How they measure success]

## Expected Behaviors & Acceptance
[BDD scenarios that define both the expected system behavior and the acceptance criteria]

### Primary Happy Path

Given [Initial system state and context]
When [Stakeholder performs action]
Then [Expected system response and outcome]
And [Additional expected behaviors]

**Acceptance Criteria:**
- [ ] [Specific measurable criterion for this scenario]
- [ ] [Performance/quality requirement for this behavior]

### Alternative Path

Given [Different initial conditions]
When [Alternative stakeholder action]
Then [Expected alternative response]

**Acceptance Criteria:**
- [ ] [Specific measurable criterion for this scenario]

### Error/Edge Case:

Given [Error conditions]
When [Action that triggers error]
Then [Expected error handling behavior]

**Acceptance Criteria:**
- [ ] [Specific measurable criterion for error handling]

## System Context & Boundaries

### System Scope

In Scope: [What the system will do and boundaries included]
Out of Scope: [What explicitly won't be addressed]
Interfaces: [External systems, data flows, and dependencies]

### Quality Attributes

Performance: [Response time, throughput requirements]
Scalability: [Growth expectations and constraints]
Reliability: [Uptime, error rate expectations]
Security: [Security requirements and compliance needs]
Usability: [User experience requirements]

### Constraints & Dependencies:

Dependencies: [External dependencies and other cases/systems this depends on]
Technical Constraints: [Technical limitations and requirements]
Business Constraints: [Business rules, resource, and timeline constraints]

## Risks Assessment

**[Risk 1]**
Impact: [High/Med/Low]
Probability: [High/Med/Low]
Mitigation Strategy: [Mitigation approach]
Owner: [Responsible person]

## Decision Log
[Record key architectural and design decisions]

Date: [Date]
Decision: [Decision made]
Rationale: [Why this decision]
Impact: [What it affects]
Status: [Active/Superseded]

## Learning Outcomes
[To be filled during and after case completion]

**What we learned:**

Key insights gained:
Assumptions validated/invalidated:
Unexpected discoveries:

**What we would do differently:**

Process improvements:
Technical approach changes:
