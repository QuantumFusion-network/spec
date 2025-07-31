# ADR: Helm Charts Placement Strategy for QF Infrastructure

## Date

Decision date: 2025-07-30.  
Last status update: 2025-07-30.

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

- [x] Alisher Khassanov, [@khssnv](https://github.com/khssnv).
- [x]  Denis Pisarev, [@TriplEight](https://github.com/TriplEight).
- [x]  Alex Vyatkin, [@actinfer](https://github.com/actinfer).
- [x]  Sviatoslav Alekseev, [@zotho](https://github.com/zotho).
- [x]  Alexander Lygin, [@alexlygin](https://github.com/AlexLgn).

## Decision

The decision has not yet been made. We are choosing between centralized and distributed placement of Helm charts for QF infrastructure.

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

## References

[Helm best practices](https://codefresh.io/docs/docs/ci-cd-guides/helm-best-practices/)