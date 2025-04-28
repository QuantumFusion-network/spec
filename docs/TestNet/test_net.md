# Bref

Docs index & references of QF TestNet.

# Description

### TestNet infra:
- 3 nodes of QF Collator + Validator with SPIN consensus.
- 1 + 1 nodes of QF RPC (Full node with RPC). These nodes will be avaliable via DNS rpc.qfnetwork.xyz.
- 1 + 1 nodes of QF Archive (Archive node with RPC and GQL server). These nodes will be avaliable via DNS scan.qfnetwork.xyz.
- Cloudflare for DNS balancing and for L7 balancing and for caching static
resources.
- Please find more information in High level design of TestNet: `docs/TestNet/TestNet.drawio`.

### TestNet internal infra:
- RPC nodes, 1 + 1 nodes internal do failover by L7 balancing with active healthchecks.
- Monitoring & alerting, nodes metrics exporing reused from DevNet.
- All network communication are strongly controlled by ACL/FW.
- CI/CD based on [GitHub actions](https://github.com/QuantumFusion-network/infra/blob/main/docs/provisioning_and_telemetry.md).
- Secret & password manager with [access control](https://github.com/QuantumFusion-network/infra/blob/main/docs/key_management_basic.md) is [Bitwarden](https://bitwarden.com).
- HLD (High level design) of TestNet: `docs/TestNet/TestNet.drawio`

### Additinition information:
- [TCO of TestNet (allowed only for team members)] (https://github.com/QuantumFusion-network/infra/tree/main/docs/test_net_tco_Mar_2025.md)
- [Provisioning & CI/CD] (https://github.com/QuantumFusion-network/infra/blob/main/docs/provisioning_and_telemetry.md)
- [How we work with versions & upstream updates] (`docs/proc/how_we_work_in_the_team.md`)

