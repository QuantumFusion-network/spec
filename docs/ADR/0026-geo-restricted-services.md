# ADR_0026: Using Third-Party Services with Geographic/Legal Access Restrictions

## Date

Decision date: 
Last status update: 2025-10-30

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

### Author/Decision Owner (Single Point of Accountability)
- Leonardo Malik

### Consulted (Subject Matter Experts)
- Alexei Karyagin
- Alisher Khassanov

### Informed (Affected Parties)
[People/teams affected by this decision who should be aware]

 [Person 1]

 [Person 2]

 [Person 3]

Note: People listed in "Informed" should submit a PR to check their name after reading this ADR.

## Decision

[To be completed after advice gathering and option analysis]

We will...

## Context

QF project requires various third-party cloud services and development tools for infrastructure, CI/CD, monitoring, storage, and development workflows. Some services explicitly restrict access from certain countries, either due to:

- US/EU sanctions compliance
- Local legal requirements
- Corporate risk management policies
- Export control regulations

The team is distributed internationally with team members in regions that may be subject to service restrictions. We found that, for example, iDrive explicitly states that it does not allow users from certain countries.

### Decision Criteria

- **Team Access**: Can all team members reliably access the service?
- **Business Continuity**: Risk of sudden service disruption
- **Data Sovereignty**: Critical data recovery capability
- **Cost**: Financial impact of alternatives
- **Operational Complexity**: VPN management overhead or access segregation overhead
- **Legal Risk**: Compliance with international regulations
- **User Impact**: Does restriction affect end users or only internal team?

## Problem

How should QF project approach third-party services that restrict access based on geographic location or legal jurisdictions, balancing team collaboration needs, infrastructure reliability, cost efficiency, and legal compliance?

## Options

1. **(SELECTED)** Confirm with Provider that it's Formally not an Issue
2. Use Restricted Services with Company-Provided VPN
3. Conditional Use Based on Service Criticality
4. Segregated Access by Region and Infrastructure Criticality

## Consequences

### Option 1: Confirm with Provider that it's Formally not an Issue (SELECTED)

**Description:** Formally confirm with the service provider that geographic or legal restrictions do not apply to our use case, or that exceptions can be granted for our team. This involves direct communication with the provider to clarify their policy, obtain written confirmation, and document any exceptions or waivers.

**Selected because:**
- Reduces risk of account suspension or blocking by obtaining explicit provider approval
- Maintains access to best-in-class services without operational overhead of VPNs
- Documents compliance and mitigates legal risk
- Enables transparent communication with affected team members

**Selected despite:**
- Provider may not grant exceptions or may change policy at any time
- Process can be time-consuming and may require legal review
- Written confirmation may not be legally binding in all jurisdictions
- Provider may still block access if detection mechanisms are sophisticated

**Risks and Mitigations:**
- **Risk**: Provider denies exception or changes policy
  - **Mitigation**: Maintain backup service alternatives and be prepared to implement Options 2-4 if needed, document all communications for legal record

- **Risk**: Written confirmation is not enforceable
  - **Mitigation**: Document all communications and seek legal advice if necessary, maintain data backups regardless of confirmation

- **Risk**: Provider detects and blocks access despite confirmation
  - **Mitigation**: Implement backup account strategy with team members from unrestricted regions, ensure critical data is backed up externally

**Failure Recovery:**
If provider does not grant exception or policy changes unexpectedly, migrate to unrestricted alternative service or implement Option 2 (company VPN) or Option 4 (segregated access) depending on service criticality.

### Option 2: Use Restricted Services with Company-Provided VPN

**Description:** Allow use of restricted services with company-managed VPN infrastructure for affected team members. Company provides, maintains, and monitors VPN access. Establish backup accounts with team members from unrestricted regions for disaster recovery.

**Rejected because:**
- Company assumes VPN infrastructure costs and maintenance
- Additional operational overhead for VPN management
- VPN represents single point of failure for affected team members
- May not fully eliminate account blocking risk (sophisticated detection)
- Privacy/trust considerations for routing team traffic

**Rejected despite:**
- Access to best-in-class services regardless of restrictions
- Company controls VPN reliability and uptime
- Centralized VPN management and monitoring
- Can implement circuit breakers for automatic failover
- Professional-grade VPN service with SLA
- Backup account strategy ensures access even if primary accounts are blocked

**Risks and Mitigations:**
- **Risk**: VPN failure blocks critical work for affected team members
  - **Mitigation**: Redundant VPN providers, circuit breaker mechanisms, backup service alternatives

- **Risk**: Account blocked despite VPN, no access to critical data
  - **Mitigation**: Maintain backup accounts owned by team members from allowed countries who can access in emergency, query service providers about policy before adoption, maintain data backups

- **Risk**: VPN costs become prohibitive as team scales
  - **Mitigation**: Cost monitoring, periodic service usage review, consider transitioning high-cost services to Option 4 if needed

**Failure Recovery:**
If company VPN proves unreliable or cost-prohibitive, transition to Option 3 (conditional use).

### Option 3: Conditional Use Based on Service Criticality

**Description:** Evaluate each service individually based on:
- Whether it affects end users or only internal team
- Criticality of data stored (e.g., Terraform state vs. disposable logs)
- Availability of backup/recovery mechanisms
- Account blocking policy (full account termination vs. access blocking only)

**Decision Matrix:** 
- High-criticality services → avoid restricted services
- Low-criticality services → allow with company VPN and backup accounts

**Rejected because:**
- More complex policy requiring judgment calls for each service
- Requires service-by-service evaluation (time overhead)
- May create inconsistent tooling experience across team
- Need clear criteria for "criticality" assessment
- Requires ongoing policy maintenance and periodic reviews

**Rejected despite:**
- Balanced approach optimizing for both access and risk
- Protects critical infrastructure from geo-blocking risk
- Allows best-in-class tools for less critical use cases
- Can evolve policy based on experience

**Risks and Mitigations:**
- **Risk**: "Criticality" criteria interpreted inconsistently across team
  - **Mitigation**: Document explicit decision framework with examples, require review/approval for high-stakes services

- **Risk**: Low-criticality service becomes critical over time without policy update
  - **Mitigation**: Periodic service audit, migration plan for upgraded criticality

- **Risk**: Complex policy difficult to communicate/enforce
  - **Mitigation**: Simple decision tree documentation, service approval workflow

**Failure Recovery:**
If conditional approach proves too complex to manage or creates too many edge cases, simplify to Option 2 (allow all restricted services with company VPN).

---

### Option 4: Segregated Access by Region and Infrastructure Criticality

**Description:** Implement access segregation strategy where:
- **Critical infrastructure** (Terraform state, production secrets, core CI/CD, authentication) is accessed ONLY by team members from unrestricted regions
- **Non-critical infrastructure** (development tools, monitoring, collaboration tools) is accessible by all team members regardless of location
- Small trusted team from allowed countries maintains critical infrastructure; broader team uses non-critical services freely

**Rejected because:**
- Creates team access inequality (some members excluded from critical infrastructure)
- Requires trusted "core infrastructure team" from specific regions
- May create bottlenecks if only small team can access critical systems
- Potential team morale/trust issues from access segregation
- Need clear criteria for what is "critical" vs "non-critical"
- May conflict with hiring/team distribution strategy

**Rejected despite:**
- Eliminates geo-blocking risk for critical infrastructure entirely (no VPN needed)
- No VPN operational overhead for most critical systems (highest reliability)
- Broader team can still use best-in-class tools for day-to-day work
- Clear separation of responsibilities by risk level
- Scales well with team growth
- Backup access inherent in design (multiple people from unrestricted regions have access)

**Risks and Mitigations:**
- **Risk**: Core infrastructure team becomes bottleneck for operations
  - **Mitigation**: Ensure minimum 3-4 people from unrestricted regions on core team, document all procedures for broader team understanding, automate infrastructure operations where possible

- **Risk**: Team members feel excluded or distrusted
  - **Mitigation**: Transparent communication that this is regulatory/risk mitigation not a trust issue; ensure affected members have meaningful access to non-critical systems

- **Risk**: Difficult to define "critical" boundary, scope creep
  - **Mitigation**: Explicit written criteria with examples, periodic review, err on side of restricting less

- **Risk**: Core team members leave or unavailable during incident
  - **Mitigation**: Maintain minimum team size, cross-training, documented emergency procedures

- **Risk**: Hiring constraints limit ability to build core team
  - **Mitigation**: Factor regional requirements into hiring strategy, consider enabling team members to work from unrestricted regions

**Failure Recovery:**
If segregated access creates unsustainable bottlenecks or team issues, transition to Option 2 (company VPN for all) or Option 3 (conditional use with VPN) to broaden access.


## Advice

- "I saw on idrive.com or .net, they explicitly mentioned, 'we do not allow users from Russia and two other countries.'" (Leonardo Malik, Infrastructure, 2025-10-22)
- "Should we take this limitation into account?" (Leonardo Malik, Infrastructure, 2025-10-22)
- "Is the decision: we're not going to use those services because we don't want to have any risk at some point?" (Leonardo Malik, Infrastructure, 2025-10-22)
- "Is the alternative that we can use these services if they're interesting enough (e.g., they have a good free tier or they're really cheap), but then we require Russian users to use VPNs?" (Leonardo Malik, Infrastructure, 2025-10-22)
- "And then the next question is: should the company provide the VPN service or should the user have a VPN service ready?" (Leonardo Malik, Infrastructure, 2025-10-22)
- "How do we mitigate the potential risk of (services) detecting some Russian IP and then eventually blocking the account and for situation of state storage of Terraform or Open Tofu that's quite a big risk" (Leonardo Malik, Infrastructure, 2025-10-22)
- "What criteria do you think we should consider to make the decision? For instance, if it affects end users or not?" (Alisher Khassanov, Product, 2025-10-22)
- "If there is a need for (VPN), I can set this up" (Alexei Karyagin, Infrastructure, 2025-10-22)
- "Do they block an account from a restricted location, or are they just block access, but the account remains operating, and you just turn on VPN and continue working?" (Alisher Khassanov, Product, 2025-10-22)
- "(If we decide to not use such services who restrict locations...) consider alternative to this service or think about like a circuit breaker in case the VPN is disconnected" (Alisher Khassanov, Product, 2025-10-22)
- "If maybe they block the entire account... we also keep a backup of data... easy to recover, that's fine" (Alisher Khassanov, Product, 2025-10-22)
- "Let's ask their customer support first as the next step and then we can continue this conversation" (Leonardo Malik, Infrastructure, 2025-10-22)

## Glossary

- **Geographic Restriction**: Service policy that blocks or restricts access based on user location, IP address, or jurisdiction
- **Circuit Breaker**: Automated failover mechanism that detects service failure and switches to backup alternative
- **Terraform/OpenTofu State**: Infrastructure-as-code state files that are critical for infrastructure management and difficult to reconstruct if lost
- **ToS**: Terms of Service - legal agreement between service provider and user
- **Backup Account Strategy**: Maintaining secondary service accounts owned by team members from unrestricted regions, enabling disaster recovery if primary accounts are blocked due to geographic restrictions
- **Critical Infrastructure**: Systems and services whose unavailability would cause immediate production outage or irreversible data loss (e.g., Terraform state, production databases, authentication systems)
- **Core Infrastructure Team**: Small trusted team from unrestricted geographic regions with exclusive access to critical infrastructure in segregated access model

## References

- iDrive geographic restriction [policy](https://www.idrive.com/online-backup-security-faq#blocked-countries)
- [Service Availability Catalog](https://coda.io/d/_d5nO5kXkau6/_su4LM4K3#_luVstOTG) (for internal use)

## ADR Relationships

[Fill in the section if applicable or leave blank for further filling.]

### Supersedes

- ADR #[X]: [Brief description of superseded decision]

### Superseded By

- ADR #[X]: [Brief description of superseding decision]

### Related ADRs

- ADR #[X]: [Brief description of relationship]