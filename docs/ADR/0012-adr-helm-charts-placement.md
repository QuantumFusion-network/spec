# ADR: Helm Charts Placement Strategy for QF Infrastructure

## Date

Decision date: 2025-07-30  
Last status update: 2025-07-30

## Status
- [x] Proposed
- [ ] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [x] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner

Alexey Karyagin, [@akablockchain2](https://github.com/akablockchain2).

### Consulted

- Alisher Khassanov, [@khssnv](https://github.com/khssnv).
- Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- Sviatoslav Alekseev, [@zotho](https://github.com/zotho).
- Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).

### Informed

- [ ] Alisher Khassanov, [@khssnv](https://github.com/khssnv).
- [ ]  Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- [ ]  Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [ ]  Sviatoslav Alekseev, [@zotho](https://github.com/zotho).
- [ ]  Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).

## Decision

The decision has not yet been made. We are choosing between centralized and distributed placement of Helm charts for QF infrastructure.

## Context

[Describe the situation that calls for a decision. Focus on forces, constraints, and circumstances that led to needing this decision. Answer "What is the problem?" not "What's the solution?" Include:
- Technical, business, and organizational context
- Applicable requirements (functional and cross-functional)
- Current state and why change is needed
- Key stakeholders and their concerns]

## Options

1. Centralized placement of Helm charts
2. Distributed placement of Helm charts  
3. Hybrid approach

### Option 1: Centralized placement of Helm charts

Helm charts are placed in the infrastructure repository in structured folders:
- `confs/k8s/addons/` - for system components and cluster add-ons
- `confs/k8s/apps/` - for application services

**Advantages:**
- Centralized management with single source of truth for infrastructure
- Enhanced security control and simplified audit processes
- Unified deployment process and GitOps workflow through ArgoCD
- Clear separation between system (addons) and application (apps) components
- Simplified disaster recovery and compliance management
- Excellent deployment visibility through unified ArgoCD UI
- Centralized dependency management and resource conflict prevention

**Disadvantages:**
- Potential bottleneck for application teams requiring infrastructure team coordination
- Slower development cycles for application configuration changes
- Repository size growth with increasing number of applications
- Reduced team autonomy for application-specific configurations
- Need for coordination between infrastructure and development teams

**Selected because/despite:**  
- TBD

**Rejected because/despite:**  
- TBD

### Option 2: Distributed placement of Helm charts

Helm charts are placed directly in the repositories of corresponding applications, usually in a `helm/` or `charts/` folder within each project.

**Advantages:**
- Complete independence of application development teams
- Ability for rapid iteration and experimentation
- No need for coordination with infrastructure team for application changes
- Helm charts are versioned together with application code
- Fast development and testing cycles
- Horizontal scaling of development without bottlenecks

**Disadvantages:**
- Lack of centralized overview of all deployed applications
- Difficulty ensuring unified standards and policies
- Potential security issues due to decentralization
- Possible duplication of common configurations
- Risk of inconsistency in security settings
- Complication of audit and compliance processes
- Difficulty managing inter-service dependencies

**Selected because/despite:**  
- TBD

**Rejected because/despite:**  
- TBD

### Option 3: Hybrid approach

Infrastructure Helm charts are managed centrally while service-related Helm charts are managed by respective teams in their application repositories.

**Advantages:**
- Balance between centralized control for critical infrastructure and team autonomy for applications
- Infrastructure components remain under strict control and standardization
- Application teams have flexibility for their specific deployment needs
- Reduced coordination overhead for application changes
- Maintains security and compliance for infrastructure while enabling development speed

**Disadvantages:**
- Increased complexity in management processes
- Need for clear boundaries between infrastructure and application charts
- Potential inconsistencies between centralized and distributed approaches
- More complex CI/CD pipeline setup
- Risk of configuration drift between different management approaches

**Selected because/despite:**  
- TBD

**Rejected because/despite:**  
- TBD

## Advice

- Why is one of options harder and why is one of them easier? Who is responsible for what in option? (Alisher Khassanov, 2025-07-30)
- What is a platform? Is it something developers use just as a service, or is it something developers communicate with through the role who maintains it? (Alisher Khassanov, 2025-07-30)
- How do developers access a platform? (Alisher Khassanov, 2025-07-30)
- Who are responsible for maintaining - developer or DevOps? (Alisher Khassanov, 2025-07-30)
- Advantage for the centralized approach - everything related to packaging is in one repository. So it's easier to maintain from the infrastructure maintainership perspective (Alisher Khassanov, 2025-07-30)
- Indeed less maintenance overhead to keep everything in a monorepository. But both approaches are possible. Argo CD allows you specifying any standalone repository, like Git or any container sourcing whatsoever, at any point of time (Denis Pisarev, 2025-07-30)
- Major architecture and major deployments can totally be held in a monorepository (Denis Pisarev, 2025-07-30)
- Specific deployments, maybe some test deployments by developers, can be kept in standalone repositories and maintained separately by them (Denis Pisarev, 2025-07-30)
- We can keep a template repository with everything relevant for deployment scaffolded, and any internal or external developer will be able to use that public template to spin off and run their own deployment if needed (Denis Pisarev, 2025-07-30)
- Disadvantage of centralized template repository - developers who develop an application and are responsible for packaging will have to work with both repositories. With the monorepo (with the related infrastructure), and the application code (Alisher Khassanov, 2025-07-30)
- From an application developer perspective, the 'dilution' is that part of an application is in the application repository and part of it is in the infrastructure monorepository (Alisher Khassanov, 2025-07-30)
- If we put charts in the application repository how CI works?
Update of chart will update Kubernetes whenever it sees an update of an app or the packaging files? (Alisher Khassanov, 2025-07-30)
- Advantage of centralized approach - we have more knowledge on it  (Alisher Khassanov, 2025-07-30)
- Are charts mainly come from external sources or we mainly use our own in-house developed applications? (Alisher Khassanov, 2025-07-30)

## References

[Helm best practices](https://codefresh.io/docs/docs/ci-cd-guides/helm-best-practices/)

## ADR Relationships

[Fill in the section if applicable or leave blank for further filling.]

### Supersedes
- ADR #[X]: [Brief description of superseded decision]

### Superseded By
- ADR #[X]: [Brief description of superseding decision]

### Related ADRs
- ADR #[X]: [Brief description of relationship]