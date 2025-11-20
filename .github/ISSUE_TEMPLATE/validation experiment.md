---
name: Acceptance Experiment
about: Validates case acceptance criteria through detailed technical procedures
title: '[ACCEPTANCE] [Case Name] Validation'
labels: 'experiment, acceptance'
assignees: ''
---

[Acceptance Experiment writing rules:
- Technical Focus: Document HOW to verify case acceptance criteria technically
- Detailed Procedures: Step-by-step validation that engineers can execute
- DRY: Reference case for what to validate, focus on how to validate
- Executable: Engineers with appropriate access can follow and verify
- Evidence-Based: Document what evidence proves each criterion is met]

## Prerequisites

[What needs to be in place before validation can begin]

**Environment Access Required:**
- [Server/system access needed]
- [Credentials or permissions]

**Setup Steps:**
- [Environment configuration]
- [Test data preparation]
- [Tool installation if needed]

## Validation Procedures

[Group by agent type matching the case acceptance criteria structure. For each criterion, provide detailed technical validation procedures.]

### For [Primary Agent Type]

**Criterion: [Brief reference to criterion - e.g., "Network starts and maintains consensus"]**

*Procedure:*
1. [Detailed step-by-step validation procedure]
2. [Commands to run, APIs to call, UI actions to perform]
3. [What to observe/measure]
4. [Where to find evidence - logs, dashboards, metrics, etc.]

*Automated validation:* [If applicable, reference test script: `./scripts/validate_consensus.sh`]

*Success Evidence:*
- [What specifically proves this criterion is met]
- [Metrics thresholds, log entries, observable behavior, screenshots]

---

**Criterion: [Next criterion for this agent type]**

*Procedure:*
1. [Step-by-step validation]
2. [Technical verification steps]

*Automated validation:* [Script or tool if applicable]

*Success Evidence:*
- [What proves success]

---

### For [Secondary Agent Type]

**Criterion: [Brief reference to criterion]**

*Procedure:*
1. [Detailed validation steps]
2. [How to verify technically]

*Success Evidence:*
- [Evidence requirements]

---

[Continue for all agent types and their acceptance criteria from the case]

## References & Links *Optional*

[Include this section when you need to reference external context, test environments, data, or tools. Delete if not applicable.]

**Test Environments:**
- [Environment name]: [URL or access information]

**Test Data:**
- [Dataset location]: [Description]

**Validation Scripts:**
- [Script location]: [What it validates]

## Results & Learning

[To be filled after validation execution - focus on the validation PROCESS, not outcomes]

**What Worked Well:**
- [Tools/approaches that were effective]
- [Clear documentation or procedures]
- [Good tooling or automation]

**Process Issues:**
- [Confusing steps or unclear procedures]
- [Tool limitations - e.g., "CLI output barely understandable, should use dashboard"]
- [Missing documentation or prerequisites]
- [Time-consuming manual steps that should be automated]

**Improvements for Future Validations:**
- [Better tools or approaches to use next time]
- [Documentation that needs updating]
- [Automation opportunities]

*Note: Validation OUTCOMES (whether criteria passed/failed) are documented in the parent case "Learning Outcomes" section, not here.*

## Review & Acknowledgment

[People who should review and acknowledge understanding of this experiment]

- [ ] @github-handle-1
- [ ] @github-handle-2
- [ ] @github-handle-3

*Note: Check your name after reading and understanding this experiment to confirm awareness and reduce communication overhead.*

---

[Note: Delete this checklist section once the experiment is reviewed and work begins.]

**Final Checklist Before Submitting:**
- [ ] Are validation procedures detailed enough for engineers to execute?
- [ ] Are success evidence requirements specific and observable?
- [ ] Are prerequisites and access requirements clear?
- [ ] Are we documenting HOW to validate, not duplicating WHAT to validate?
- [ ] Do procedures cover all acceptance criteria from the parent case?
- [ ] Is Review & Acknowledgment section complete with GitHub handles?