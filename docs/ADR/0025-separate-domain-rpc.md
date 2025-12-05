# ADR_0025: Separate Domain for RPC Nodes and Internal Services

## Date

Decision date: 2025-11-19
Last status update: 2025-11-25

## Status

- [ ] Proposed
- [x] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [ ] Planned
- [ ] In Development
- [x] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner (Single Point of Accountability)
- Leonardo Malik

### Consulted (Subject Matter Experts)
- Alexei Karyagin
- Denis Pisarev

### Informed (Affected Parties)

  - [x] Alisher Khassanov, @khssnv
  - [ ] Sviatoslav Alekseev, @zotho
  - [ ] Vadim Khafizov @khafizov-v
  - [ ] Alex Vyatkin, @actinfer
  - [x] Alex Lygin, @alexlygin
  - [ ] Memechi Kekamoto, @MemechiKekamoto

*Note: People listed in "Informed" should submit a PR to check their name after reading this ADR.*

## Decision

We will acquire and configure a separate domain (distinct from qfnetwork.xyz) dedicated exclusively to RPC nodes and internal services, while maintaining qfnetwork.xyz for public-facing production services (website, email).

## Context

Currently, QF Network uses a single domain (qfnetwork.xyz) for all infrastructure components including:
- Public website
- Email services
- RPC nodes for blockchain access
- Telemetry and monitoring infrastructure

### Decision Criteria

- Security isolation level required
- Maximum acceptable cost
- Implementation timeline constraints
- Operational complexity tolerance
- Access control granularity needed

## Options

1. **(SELECTED)** Separate dedicated domain for RPC and internal services
2. Use subdomains under qfnetwork.xyz
3. Maintain single-domain architecture

## Consequences

### Option 1: Separate Dedicated Domain (SELECTED)

Create entirely new domains (qfnode.net and theqfnetwork.xyz) for all infrastructure and RPC services.

**Selected because:**
- Complete separation between production brand and infrastructure services
- Anyone with domain access knows it's infrastructure-only
- Can grant full infrastructure domain access without production risk
- Compromised infrastructure domain doesn't expose website, email, or brand
- Full DNS automation freedom without production service impact
- New team members start with infrastructure access only
- Matches approach of major blockchain networks

**Selected despite:**
- Annual domain registration and renewal fees
- Multiple separate DNS configurations to maintain
- Moving existing RPC nodes and internal services to new domain
- Need to announce and document new RPC endpoints
- External services may need configuration changes

**Risks and Mitigations:**
- **Risk**: Confusion about which domain to use for different services
  - **Mitigation**: Clear documentation and naming conventions; internal service directory
- **Risk**: Increased DNS management complexity
  - **Mitigation**: Standardize DNS tooling across both domains; use infrastructure-as-code
- **Risk**: Domain expires or is not renewed
  - **Mitigation**: Multi-year registration; calendar reminders; ownership documentation

**Failure Recovery:**
If separate domain proves problematic:
1. Maintain qfnetwork.xyz as fallback for all services
2. Transition can be reversed by pointing new domain to same infrastructure
3. DNS TTL settings allow rapid switchback if needed
4. Parallel operation period provides safety buffer

### Option 2: Subdomains Under qfnetwork.xyz

Use structured subdomains under qfnetwork.xyz, either as:
- Single consolidated subdomain: infra.qfnetwork.xyz or internal.qfnetwork.xyz
- Multiple service-specific subdomains: rpc.qfnetwork.xyz, vpn.qfnetwork.xyz, dev.qfnetwork.xyz

**Rejected because:**
- DNS compromise affects entire qfnetwork.xyz domain tree regardless of subdomain structure
- Subdomain permissions still require parent domain access
- Automated DNS management still touches production domain
- Attack on subdomain can escalate to parent domain
- Cannot truly separate infrastructure from production access
- Less obvious that subdomains are infrastructure-only
- Multiple subdomains increase configuration complexity without addressing core security issues

**Rejected despite:**
- No additional domain registration fees
- Single wildcard certificate covers all subdomains
- Single DNS provider and configuration
- Everything under qfnetwork.xyz umbrella
- Service-specific subdomains provide clear naming

### Option 3: Maintain Single-Domain Architecture

Use qfnetwork.xyz for all services without separation.

**Rejected because:**
- All services share same attack surface
- Infrastructure changes can impact critical production services
- Cannot implement principle of least privilege
- Automated DNS management requires production domain exposure
- RPC scaling automation poses risk to website/email
- Does not align with industry security practices

**Rejected despite:**
- Single domain management
- No new domain fees


## Advice

- "we just have one domain that we use for everything. I would propose that we use a separate one for our VPN nodes and internal services that we run, rather than use the high-risk production qfnetwork.xyz for everything" (Leonardo Malik, 2025-10-22)
- "having a separate domain for RPC nodes that we eventually would run in Kubernetes would also allow us to do DNS-based automated DNS management without exposing the whole website domain as well to the Kubernetes cluster" (Leonardo Malik, 2025-10-22)
- "This is part of like a best practice for security approach as well like it's considered as part of like network segregation" (Leonardo Malik, 2025-10-22)
- "would something like a subdomain be okay for this task, or why do you need completely separate domain?" (Alexei Karyagin, 2025-10-22)
- "I think it's more useful to have a separate domain entirely, also for visibility purposes ... everything that's running on that domain ... are internal services and RPC nodes" (Leonardo Malik, 2025-10-22)
- "if you would hire a new person and then we have a separate domain for just RPC nodes, we can just give access to that domain initially and then step by step give the principle of least privilege approach" (Leonardo Malik, 2025-10-22)
- "core developing companies ... have their own name, and the network or some other products have a different name. So it dilutes the attack vector and attack surface" (Denis Pisarev, 2025-10-22)
- "If... our Kubernetes cluster gets attacked...the RPC node URLs changing is not a big deal, but it is a big deal if it's the main domain and things like our email server, our website URL, etc., can be changed" (Leonardo Malik, 2025-10-22)
- "the secondary domain, we could advertise on the website and then or via the portal" (Leonardo Malik, 2025-10-22)

## Glossary

- **RPC (Remote Procedure Call)**: Interface through which external applications interact with blockchain nodes
- **Network Segregation**: Security practice of separating different types of services into isolated network segments
- **Principle of Least Privilege**: Security principle where users/services receive minimum access needed for their role
- **DNS (Domain Name System)**: System translating human-readable domain names to IP addresses
- **Attack Surface**: Total number of points where unauthorized user could attempt to access system

## References

- Industry Example: Parity Technologies (parity.io vs polkadot.network / polkadot.com)

## ADR Relationships

[Fill in the section if applicable or leave blank for further filling.]

### Supersedes
- ADR #[X]: [Brief description of superseded decision]

### Superseded By
- ADR #[X]: [Brief description of superseding decision]

### Related ADRs
- ADR #[X]: [Brief description of relationship]
