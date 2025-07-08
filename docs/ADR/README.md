# Architectural Decision Record Guide

## Introduction

This guide describes the process for creating, reviewing, implementing, and maintaining Architectural Decision Records (ADRs) within the QF project.

## What is an ADR?

An ADR captures important architectural decisions, answering:

- What was decided?
- Why was it decided?
- How will it be implemented?

ADRs are short documents (target length: ~2 pages of text) that follow the **Reader-focused design principle** - structured for those who will read them in the future rather than optimized for the writer. They support the entire decision process from problem identification through knowledge-sharing and implementation.
**Immutability reminder** - Once an ADR reaches **Accepted**, its Decision, Context, Options, Consequences and Advice are *frozen*. If the decision changes later, create a **new ADR that Supersedes the old one**; never rewrite history.

## ADR Lifecycle Overview

### 1. Ideation & Creation
ADRs originate from team brainstorming, architecture reviews, problem resolution needs, or innovation proposals.

### 2. Review & Decision
Advice gathering from consulted experts and informed stakeholders, with iterative refinement based on feedback.

### 3. Implementation
Moving from accepted decision through planning, development, and verification phases.

### 4. Maintenance
Ongoing management including status updates, superseding when needed, and maintaining decision history.

*Detailed working methods for each phase are provided in the next section.*

## Working Methods with ADR Template

### Template Section - Completion Sequence

The template sections can be completed out of order.
**Recommended sequence:**
1. **Date** → Set creation and status update dates
2. **Status** → Set to "Proposed" initially
3. **People** → Identify Author, Consulted experts, Informed stakeholders
4. **Context** → Understand the problem space first
5. **Consequences** → Explore options with benefits/drawbacks/risks
6. **Options** → Extract clean numbered list from Consequences analysis
7. **Decision** → Write final decision after advice incorporation

*This sequence reflects methodology of using ADRs as decision-support tools rather than just documentation.*

### Method 1: Sequential Writing Process

#### Step 1: Create ADR and Announce Decision Process
1. **Create new ADR** from [template](./adr-template.md)
2. **Assign unique ADR_id**
3. **Set descriptive title** reflecting the decision question
4. **Set status** to "Proposed"
5. **Add dates** - creation date and last status update
6. **Identify Author/Decision Owner** - single point of accountability
7. **Set implementation status** to "Planned" if applicable
8. **CREATE PR IMMEDIATELY** - Submit PR to the ADR folder in spec repository as soon as ADR is created to announce the start of the decision process and ensure visibility

*Key principle: Create PR as early as possible so everyone knows decision work has started, even if sections are incomplete*

*Example:*
```
ADR_003: (DRAFTING) What if the Leader fails to produce blocks?

Status:

- [x] Proposed

Author/Decision Owner: John Smith
```

#### Step 2: Identify People and Stakeholders
1. **Author/Decision Owner** - Single point of accountability (you or your team)
2. **Consulted** - Subject matter experts who will provide advice
3. **Informed** - People/teams affected by this decision

*Key principle: Identify both those affected by the decision and those with relevant expertise*

#### Step 3: Write the Context Section
1. **Brain dump** everything relevant to the decision
2. **Focus on forces and constraints** that led to needing this decision
3. **Answer "What is the problem?" not "What's the solution?"**
4. **Include:**
   - Technical, business, and organizational context
   - Applicable requirements (functional and cross-functional)
   - Current state and why change is needed
   - Key stakeholders and their concerns
5. **Add Decision Criteria** if explicit evaluation criteria exist
6. **Add diagrams** if they help explain current state
7. **Self-check** for adviser audience - do they have enough info?

#### Step 4: Work in Consequences Section First
1. **Start in Consequences section** - skip Options initially
2. **Capture all options** you can think of, including:
   - Options you already have in mind
   - "Do nothing" option
   - "Not yet" option
   - Creative alternatives
3. **For each option, systematically analyze:**
   - Brief description
   - Benefits (what makes this attractive)
   - Drawbacks (what are the concerns)
   - Risks and mitigations
   - **Failure recovery approach**
4. **Use research and sources** - link to documentation, similar decisions
5. **Aim for 3-5 options** (avoid analysis paralysis with 10+)

*Key principle: Embrace creative freedom but stay focused on your Context*

#### Step 5: Extract Options List
Once Consequences section stabilizes:
1. **Create clean numbered list** in Options section
2. **Use descriptive names** for each option
3. **Include brief description** - detailed analysis stays in Consequences
4. **Always include "do nothing/status quo"** option

#### Step 6: Gather Advice
1. **Share ADR** in current state to set up focused conversations
   - Use ADR to prime discussions
   - Show your thinking and where you need input
   - Make clear what stage you're at in the process

2. **Conduct advice sessions** with Consulted and Informed people:
   - Use ADR sections to focus discussion
   - Take notes during sessions (offer to be note-taker)
   - Listen actively and ask clarifying questions
   - Capture advice in raw, unfiltered form

3. **Format advice** in Advice section as:
   ```
   [Advice content] ([Name, Role], YYYY-MM-DD)
   ```

4. **Validate advice** with givers using negative assurance:
   - Share updated ADR with advice captured
   - "If you see nothing wrong with the notes, no action needed"
   - Allow corrections before decision is taken

#### Step 7: Update ADR Based on Advice
1. **Update ADR sections** based on advice:
   - **Enhance** Context/Options/Consequences with new insights
   - **Clarify** any misinterpretations from advice sessions
   - **Acknowledge** advice not incorporated (show transparency)

#### Step 8: Take Decision and Complete ADR
1. **Select final option** using structured Consequences format:
   - **Selected option:**
     - "Selected because..." for benefits that led to choice
     - "Selected despite..." for drawbacks you're accepting
   - **Rejected options:**
     - "Rejected because..." for critical drawbacks
     - "Rejected despite..." for benefits you're giving up

2. **Complete remaining sections:**
   - **Decision section:** Short "We will..." summary for implementers
   - **Update title:** Reflect actual decision taken
   - **Implementation Notes:** Specific guidance for implementation
   - **ADR Relationships:** Link to related/superseded ADRs

3. **Final validation:**
   - Review if you're confident in this decision
   - Ensure failure recovery is addressed
   - Check that implementation approach is actionable

4. **Change status** to "Accepted" and update date

#### Step 9: Share Decision and Begin Implementation
1. **Notify all stakeholders** of accepted decision
2. **Update implementation status** as work progresses
3. **Informed parties acknowledge** by checking their names via PR

### Method 2: Collaborative Development Process

For team decisions or complex contexts:

#### Phase 1: Context Development
1. **Collaborative brain dump** in team session
2. **Identify all stakeholders** for People sections
3. **Create PR immediately** for visibility
4. **Seek early advice** on problem definition if helpful
5. **Iterate context** based on initial feedback

#### Phase 2: Options Generation Workshop
1. **Creative brainstorming** - avoid early convergence on solutions
2. **Research similar decisions** in organization or industry
3. **Consider failure modes** and recovery for each option
4. **Map options to context forces** and constraints

#### Phase 3: Consequences Analysis
1. **Systematic evaluation** using consistent criteria
2. **Risk assessment** and mitigation strategies
3. **Cost-benefit analysis** where applicable
4. **Impact assessment** on identified stakeholders

#### Phase 4: Decision Taking
1. **Gather advice** from all identified stakeholders
2. **Update ADR** based on advice received
3. **Take decision** using structured selection criteria
4. **Complete and share** final ADR

## Roles and Responsibilities

### Author/Decision Owner (Single Point of Accountability)
- **Primary responsibility** for driving the decision process
- **Single contact point** for questions about the ADR
- **Accountable** for the decision outcome
- Usually architect, team lead, or designated decision owner
- Can be a team if decision is collective, but accountability must be clear

### Consulted (Subject Matter Experts)
- People with relevant technical or domain expertise
- Provide advice on options, risks, and implementation approaches
- Cross-functional representatives (InfoSec, UX, Performance, etc.)
- Previous decision makers on related topics

### Informed (Affected Parties)
- Teams that will implement the decision
- Teams that integrate with or depend on this decision
- Stakeholders who need awareness but aren't directly consulted
- End users or customer representatives if applicable

## ADR Status Tracking

### Status
- **Proposed** - ADR created, advice gathering in progress
- **Accepted** - Decision taken and ready for implementation
- **Deprecated** - Decision no longer applicable but not directly replaced
- **Superseded** - Decision replaced by another ADR

*Note: We do not use these statuses:* 
- "Rejected": Rejected decisions are actually decisions to "do nothing" and should be documented as Accepted ADRs with that option selected.
- "Draft": Any ADR inside a **Draft PR** is implicitly Draft.

### Implementation Status
*Implementation tracking extends beyond core ADR methodology to support delivery management.*

- **Planned**: Implementation is scheduled but has not started
- **In Development**: Implementation is actively in progress
- **Implemented** - Decision fully implemented in the system
- **Verified** - Implementation tested and verified working
- **Discontinued** - Implementation stopped, rolled back, or abandoned

### Status Update Protocol
- Update ADR document when status changes
- Update last status update date
- Notify affected teams for major status changes
- **Ready‑for‑Review note** – Switch the PR from *Draft* to *Ready for review* only when:

  1. Preferred option is marked and Decision section drafted.
  2. Advice section is complete or a one‑line note states that external advice is unnecessary.
  3. All mandatory sections are filled enough for final sign‑off.
- Maintain decision immutability - no changes to decision content after acceptance

### Acknowledgment Process

People listed in "Informed" section should:
- Submit PR to check their name after reading the ADR
- Can be done during initial review process or after ADR acceptance
- Ensures affected parties are aware of decisions

### Maintenance and Superseding

**Ongoing ADR Management:**
- **Regular reviews** of implemented decisions
- **Status updates** as circumstances change
- **Superseding process** when new decisions override old ones:
  - Create new ADR for the replacement decision
  - Link new ADR in "Supersedes" section
  - Update old ADR status to "Superseded"
  - **Never modify** the original decision content (immutability principle)

## Quality Guidelines

### Essential Template Sections (Always Required)
1. **Date & Status** - When and what state
2. **People** - Who's accountable, consulted, informed
3. **Context** - Why is this decision needed?
4. **Options** - What alternatives were considered?
5. **Consequences** - Why was this option selected over others?
6. **Decision** - What will be implemented?

### Optional But Valuable Sections
- **Decision Criteria** - Explicit evaluation criteria
- **Problem** - Clear problem statement
- **Decision in Details** - Technical implementation details
- **Advice** - Raw stakeholder input (transparency and learning)
- **Implementation Notes** - Specific implementation guidance
- **ADR Relationships** - Links to related decisions

### Core Principles

**Reader-Focused Design**
- Optimize template structure for future readers
- Decision section accessible for implementers
- Context and reasoning available for those who need deeper understanding
- Clear section hierarchy and logical flow

**Lightweight Approach**
- Target ~2 pages of content
- Focus on architecturally significant decisions
- Avoid unnecessary bureaucracy
- Use diagrams when they clarify, not decorate

**Immutable Once Accepted**
- Never update decision content after acceptance
- Create new superseding ADR for changes
- Maintain historical decision record
- Link related ADRs for navigation

**Transparent Process**
- Document both selected and rejected options
- Show reasoning for all choices
- Capture raw advice for learning
- Make decision process visible to organization

**Clear Accountability**
- Single point of responsibility for each decision
- Clear contact for questions and follow-up
- Defined roles for advisers and stakeholders
- Explicit implementation ownership

### Common Quality Issues to Avoid

**Process Anti-Patterns:**
- Single option analysis (always consider alternatives)
- Post-hoc documentation (ADR written after implementation)
- Vague problem definition (unclear why decision needed)
- Missing stakeholder identification (advice from wrong people)
- Late PR creation (decision work hidden from organization)

**Content Anti-Patterns:**
- Vague titles that don't convey the decision
- Missing context about forces and constraints
- Advice not captured in raw form
- Benefits without acknowledging trade-offs
- No consideration of failure scenarios

**Management Anti-Patterns:**
- Updating accepted ADRs instead of superseding
- Decisions scattered across multiple tools
- No linking between related decisions
- Inconsistent status tracking

## Pre-Decision Quality Checklist

Before finalizing any ADR, verify:

**Content Completeness:**
- [ ] Context captures forces requiring this decision
- [ ] 3-5 options considered (including "do nothing")
- [ ] Decision consequences clearly articulate selection rationale
- [ ] Failure recovery approach considered for selected option
- [ ] Implementation approach is actionable

**Stakeholder Engagement:**
- [ ] All affected parties identified in "Informed" section
- [ ] Subject matter experts identified in "Consulted" section
- [ ] Advice gathered from required stakeholders
- [ ] Advice validated with givers using negative assurance

**Process Integrity:**
- [ ] Single point of accountability clearly defined
- [ ] ADR relationships documented (supersedes/related)
- [ ] Status and dates accurately reflect current state
- [ ] PR created early for process visibility

This checklist ensures ADR quality while maintaining the lightweight approach essential to the methodology.