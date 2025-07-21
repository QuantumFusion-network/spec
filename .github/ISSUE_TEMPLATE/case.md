---
name: Case
about: Product-level description in stakeholder language - defines system boundaries and value propositions
title: '[CASE] [Brief descriptive title]'
labels: 'case'
assignees: ''

---

[Case writing rules:
- Product Focus: Define agent value and experience, not technical implementation
- Agent Priority: List agents by % importance with Human/System distinction (even if similar to other cases)  
- Target System Clarity: Explicitly identify target system and distinguish from consumer/dependency systems
- System Boundaries: Explicitly state what's included/excluded from this case
- Basic English: Write for non-native speakers, avoid complex technical terms
- Scope Limit: Target 3-6 month achievable milestones only
- Agent-Driven: Focus on agent behavior and adoption, not system performance]

## Target System

[Which system this case addresses and its position in the larger system architecture]

## Problem Statement
[Describe the agent/business problem this case solves. What current state needs to change and why? Focus on WHAT agents need and WHY it matters. Leave technical details for  `hypoteses` of experiments.]

### Current Agent Experience

[What agents experience today that needs improvement]

### Desired Agent Experience

[What agents should be able to do after this case is complete]


## Value Proposition

[Clear business/agent value this case provides]

## Agent Analysis

[Map all agents (human and system) by priority with percentages. Focus on WHO/WHAT will interact with or benefit from the Target System.]
**Agent Priority Overview**: [e.g., "Primary: 60% Developers, Secondary: 30% Monitoring Systems, Minimal: 10% End Users"]
[Optional: Include not only percentages but also evaluation/justification for why these priorities make sense for this case]

### [Primary Agent Name] ([X%] - Primary)
- **Agent Type**: [Human Agent: role/persona] OR [System Agent: system type/function]
- **Current Pain Points**: [What problems they have today with existing systems]
- **Desired Outcomes**: [What success looks like for them]
- **Agent Journey**: [Action] → [Action] → [Successful Outcome]
- **Success Metrics**: [How they measure success - can include system metrics for System Agents]
- **Integration Requirements**: [For System Agents: APIs, data formats, protocols needed]

### [Secondary Agent Name] ([Y%] - Secondary)
[Same structure as above]

[Continue pattern for all Agents, ordered by priority]

## Expected Agent Experience & Acceptance
[BDD scenarios that define both the Target System behavior and the acceptance criteria. Describe what agents will experience, NOT how the Target System works internally. Focus on acceptance testing, not repeating desired outcomes already listed in Agent Analysis. Validation priorities derive from Agent Priority Overview above - no separate priority statement needed here]

### Agent Acceptance Scenarios
**Scenario 1: [Primary Happy Path for Human Agent]**
- Given [agent context/starting point]
- When [agent performs action]
- Then [agent experiences result]
- And [additional agent benefit]

**Acceptance Criteria:**
[It would be preferable if non-developers can verify this work in 5-10 minutes]
- [ ] [Specific measurable criterion for this scenario]
- [ ] [Performance/quality requirement for this behavior]

**Scenario 2: [Primary Happy Path for System Agent]**
- Given [system agent needs specific data/functionality]
- When [system agent makes API call/integration request]
- Then [target system provides required response/data]
- And [system agent can successfully complete its function]

**Acceptance Criteria:**
[How to verify system agent integration works, e.g. API tests, data format checks]

**Scenario 3: [Alternative Path]**

Given [Different initial conditions]
When [Alternative stakeholder action]
Then [Expected alternative response]

**Acceptance Criteria:**
- [ ] [Specific measurable criterion for this scenario]

**Scenario 4: [Error/Edge Case Handling]**

Given [Error conditions]
When [Action that triggers error]
Then [Expected error handling behavior]

**Acceptance Criteria:**
- [ ] [Specific measurable criterion for error handling]

## System Context & Boundaries

### Target System Scope

In Scope: [What the Target System will do and boundaries included]
Out of Scope: [What explicitly won't be addressed]
Interfaces: [External systems (consumer systems, dependency systems, peer/interacting systems), data flows, and dependencies.]

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

[Date] - [Decision] - [Rationale] - [Impact on agents]
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


[
Final Checklist Before Submitting:
- [ ] Does this describe Agent value, not technical implementation?
- [ ] Are agents prioritized with clear percentages and Human/System distinction?
- [ ] Is the Target System clearly identified and distinguished from consumer/dependency systems?
- [ ] Are system boundaries clearly defined?
- [ ] Is the language simple enough for non-native speakers?
- [ ] Is the scope limited to 3-6 months of achievable work?
- [ ] Do scenarios focus on agent behavior, not system performance?
]
