# Architectural Decision Record Guide

## Introduction

This guide covers the process for creating, reviewing, implementing, and maintaining Architectural Decision Records (ADRs) within the QF project. ADRs document significant architectural decisions, their context, alternatives considered, and implementation plans.

## What is an ADR?

An Architectural Decision Record is a document that captures an important architectural decision made along with its context and consequences. It answers three main questions:
1. What was decided?
2. Why was it decided?
3. How will it be implemented?

## ADR Lifecycle

### 1. Ideation & Creation

ADRs can originate from multiple sources:

- **Team Brainstorming Sessions**: Any developer can propose an ADR during brainstorming or ideation sessions
- **Architecture Reviews**: Formal review processes identifying needed architectural decisions
- **Problem Resolution**: When addressing significant technical challenges
- **Innovation Proposals**: When exploring new technologies or approaches

**Creation Process:**
1. Use the [ADR template](adr-template.md)
2. Assign a unique ADR number (sequential)
3. Set status to "Proposed"
4. Complete all required sections
5. Submit as a pull request to the ADR folder in spec repository

### 2. Review & Decision

Once proposed, ADRs undergo review:

1. **Initial Review**: Team members and relevant stakeholders review for completeness and clarity
2. **Discussion Period**: Team members provide feedback, ask questions, and suggest alternatives
3. **Revision**: ADR author updates the document based on feedback
4. **Decision Meeting**: Key stakeholders meet to make a final decision
5. **Status Update**: ADR status changed to "Accepted" or "Rejected"

### 3. Acknowledgment Process

For accepted ADRs, team members should formally acknowledge they've read and understood the decision:

1. **Initial inclusion**: Key stakeholders are listed in the "Informed" section during ADR creation
2. **Acknowledgment options**:
   - During review: Reviewers can check their names as part of the review process for the initial ADR PR
   - After acceptance: Team members can submit a separate PR to check their name after the ADR is merged

### 4. Implementation

Accepted ADRs move to implementation:

1. **Planning**: Determine implementation approach, assign resources, establish timeline
2. **Development**: Implementation of the architectural decision
3. **Status Updates**: Regularly update implementation status
4. **Documentation**: Update external documentation to reflect the decision

**Implementation Statuses:**
- **Planned**: Implementation scheduled but not started
- **In Development**: Actively being implemented
- **Implemented**: Implementation complete but not verified
- **Verified**: Fully tested and confirmed in production

### 5. Maintenance

Implemented ADRs require ongoing maintenance:

1. **Regular Review**: Periodically review all ADRs for relevance
2. **Status Updates**: Update status if circumstances change
3. **Deprecation/Superseding**: Mark as deprecated or superseded when necessary
4. **Linking**: Ensure proper links between related or superseding ADRs

## Roles and Responsibilities

TBD

## ADR Status Tracking

### Primary Status
- **Proposed**: Initial status for newly created ADRs under consideration
- **Accepted**: The decision has been approved but implementation may not have started
- **Rejected**: The decision was considered but not approved
- **Deprecated**: The decision was previously accepted but is no longer valid
- **Superseded**: The decision has been replaced by a newer ADR (should reference the new ADR number)

### Implementation Status
For accepted ADRs:
- **Planned**: Implementation is scheduled but has not started
- **In Development**: Implementation is actively in progress
- **Implemented**: The decision has been fully implemented in the codebase
- **Verified**: The implementation has been tested and verified in production
- **Discontinued**: Implementation was started but stopped due to the ADR being superseded or rejected

When an ADR is superseded or rejected after development has begun:
1. Update the primary status to "Superseded" or "Rejected"
2. Update the implementation status to "Discontinued"
3. Add a note in the Decision section explaining why the approach was abandoned
4. If superseded, include a reference to the new ADR that replaces this one

### Status Updates
1. The person changing the status should:
   - Update the status in the ADR document
   - Update any status tracking table
   - Add a comment to the relevant GitHub issue
   - Update the "Last Updated" date

2. For major status changes, notify the team through appropriate channels