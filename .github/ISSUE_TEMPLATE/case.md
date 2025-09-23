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
- Integration Points: Technical interfaces (Clearly separate from project dependencies)
- Basic English: Write for non-native speakers, avoid complex technical terms
- Scope Limit: Target achievable milestones of 3–6 months only
- Agent-Driven: Focus on agent behaviour and adoption, rather than system performance
- Experiment Mapping: Link agent outcomes to experiments when available, update during experiment planning phase]

## Target System

[Which system does this case address and what is its position in the larger system architecture?]

## Problem Statement

[Describe the agent/business problem this case solves. What needs to change in the current state and why? Focus on WHAT agents need and WHY it matters. Leave technical details for experiments]

### Current Agent Experience

[What agents experience today that needs improvement]

### Desired Agent Experience

[What agents should be able to do after this case is complete]

## Value Proposition

[Clear business / agent value that this case provides]

## Agent Analysis

[Map all agents (human and system) by priority with percentages. Focus on WHO / WHAT will interact with or benefit from the Target System]

**Agent Priority Overview**: [e.g., "Primary: 60% Developers; Secondary: 30% Monitoring Systems; Minimal: 10% End Users"]

[Optional: Include an evaluation / justification for why these priorities make sense for this case]

*Note: Initially, experiment links may show "TBD - [description]". Update with actual experiment links during experiment planning phase. When experiment scope changes significantly, review and update corresponding agent outcomes.*

### [Primary Agent Name] ([X%] - Primary)
- **Agent Type**: [Human Agent: group of people/person/role] OR [System Agent: machine/service/system]
- **Current Pain Points**: [What problems do they have today with existing systems]
- **Desired Outcomes**: [What success looks like]
  - *Outcome 1* → **Experiment**: [Title/Link when available]
  - *Outcome 2* → **Experiment**: [Title/Link when available]
- **Agent Journey**: [Action] → [Action] → [Successful Outcome]
- **Integration Requirements**: [For System Agents: APIs, data formats, protocols needed]
  
  *Note: This details the specific technical interfaces this agent needs (see Technical Interfaces section for system-wide view)*

### [Secondary Agent Name] ([Y%] - Secondary)

[Same structure as above]

[Continue the pattern for all Agents, ordered by priority]

## Expected Agent Experience & Acceptance

[Scenarios that define both the Target System behaviour and the acceptance criteria. Describe what agents will experience, NOT how the Target System works internally. Focus on acceptance testing, not repeating the desired outcomes already listed in Agent Analysis. Validation priorities are derived from Agent Priority Overview above – no separate priority statement needed here]

### Agent Acceptance Scenarios

**Scenario 1: [Primary Happy Path for Human Agent]**
- Given [agent context / starting point]
- When [agent performs action]
- Then [agent experiences result]
- And [additional agent benefit]

**Acceptance Criteria:**

[Each criterion should be demonstrable to non-developers within 5-10 minutes]
[Prefer outcomes that non-developers can verify directly, but developer demos are acceptable]

*Demonstration Examples: Screen Demo - Show working feature in browser/app; Metrics Dashboard - Display performance/usage numbers; Test Results - Show automated test passes/results; User Validation - Have actual user complete task successfully; Live Demo - Demonstrate feature working end-to-end*

[Each criterion must be verifiable through one of these methods:]
[Observable] - Can be seen in UI/logs/behavior
[Measurable] - Can be counted/timed/quantified  
[Testable] - Can be validated through test scripts
[User-Validated] - Can be confirmed by actual users/stakeholders

- [ ] [Specific criterion] [Validation method: ]
- [ ] [Performance requirement] [e.g. Dashboard showing metrics within targets]

**Scenario 2: [Primary Happy Path for System Agent]**

- Given [system agent needs specific data / functionality]
- When [system agent makes API call / integration request]
- Then [target system provides required response / data]
- And [system agent can successfully complete its function]

**Acceptance Criteria:**

[How to verify system agent integration works, e.g. API tests, data format checks]

- [ ] [Specific criterion] [Validation method: Observable/Measurable/Testable/User-Validated]

**Scenario 3: [Alternative Path]**

Given [Different initial conditions]
When [Alternative stakeholder action]
Then [Expected alternative response]

**Acceptance Criteria:**

- [ ] [Specific criterion for this scenario] [Validation method: Observable/Measurable/Testable/User-Validated]

**Scenario 4: [Error/Edge Case Handling]**

Given [Error conditions]
When [Action that triggers error]
Then [Expected error handling behavior]

**Acceptance Criteria:**

- [ ] [Specific measurable criterion for error handling] [Validation method: Observable/Measurable/Testable/User-Validated]

## Target System Context & Boundaries

### Target System Scope

In Scope: [What the Target System will do and the boundaries included]
Out of Scope: [What explicitly will not be addressed - link to other cases handling these]

### Integration Points & Dependencies

**Technical Interfaces**
[APIs, protocols, data formats this case will provide/require]

- [Interface 1]: [Description and purpose]
- [Interface 2]: [Description and purpose]

*Examples: REST API endpoints (POST /api/contracts/deploy), WebSocket connections for real-time updates, JSON message format for configuration data, HTTPS communication with external payment service*

**System Dependencies**  
- [Other systems this case requires to function]
  
**Case Dependencies**  
- [Other cases that must complete first]

**External Dependencies**
- [Outside decisions, resources, approvals needed]

**Critical Path**
- [Blocking factors and their resolution timeline]

*Examples: Case Dependencies - Authentication system (Case #45) must be complete; External Dependencies - Legal approval for terms of service; Technical Dependencies - PostgreSQL database cluster must be deployed*

### Quality Attributes

[High-level requirements overview. May duplicate metrics from Acceptance Criteria for stakeholder clarity]

**Performance**: [Response time, throughput requirements]
**Scalability**: [Growth expectations and constraints]
**Reliability**: [Uptime, error rate expectations]
**Security**: [Security requirements and compliance needs]
**Usability**: [User experience requirements]

### Constraints

**Technical Constraints**: 
- [Technical limitations and requirements]
- [Platform requirements, compatibility needs, performance limits]

**Business Constraints**: 
- [Business rules and regulatory requirements]
- [Human resource: Total estimated resources across all planned experiments]
- [Timeline constraints]

## Risks Assessment

|Risk|Impact|Probability|Mitigation|Owner|Experiment|
|---|---|---|---|---|---|
|[Risk description]|[High/Med/Low]|[High/Med/Low]|[Mitigation approach]|[Responsible person]|[Link to experiment if applicable]|

## Decision Log

[Record key architectural and design decisions]

[Date] - [Decision] - [Rationale] - [Impact on agents]
Status: [Active/Superseded]

## Learning Outcomes

[To be filled in during and after the case has been completed]

**What we learned:**

Key insights gained:
Assumptions validated/invalidated:
Unexpected discoveries:

**What we would do differently:**

Process improvements:
Technical approach changes:

## Review & Acknowledgment

[People/teams involved/affected by this case who should be aware]

- [ ] [Person 1]
- [ ] [Person 2]
- [ ] [Person 3]

*Note: People listed here should check their name after reading and understanding case. This aims to reduce communication and increase traceability of the review process.*

[
**Final Checklist Before Submitting:**
- [ ] Does this describe Agent value, not technical implementation?
- [ ] Are agents prioritized with clear percentages and Human / System distinction?
- [ ] Is the Target System clearly identified and distinguished from consumer / dependency systems?
- [ ] Are Integration Points clearly separated from Dependencies?
- [ ] Are system boundaries clearly defined?
- [ ] Is the language simple enough for non-native speakers?
- [ ] Is the scope limited to 3-6 months of achievable work?
- [ ] Do scenarios focus on agent behavior, not system performance?
- [ ] Are experiment links updated where available?
- [ ] Is the Review & Acknowledgment section completed?
]
