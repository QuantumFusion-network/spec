# Bref

Docs index & references of QF TestNet.

![alt text](https://github.com/QuantumFusion-network/spec/blob/main/docs/TestNet_infra/TestNet.drawio.png)

# Description

### TestNet public infra:
- 3 nodes of QF Collator + Validator with SPIN consensus. These nodes restricted by access by RPC protocol.
- 1 + 1 nodes of QF RPC (Full node with RPC). These nodes will be avaliable via DNS wss://test.qfnetwork.xyz.
- 1 + 1 nodes of QF Archive (Archive node with RPC and GQL server). These nodes will be avaliable via DNS scan.qfnetwork.xyz.
- VMs for PolkaJS Portal & telemetry, e.i.: portal.qfnetwork.xyz/, telemetry.qfnetwork.xyz.
- Cloudflare for DNS balancing and for a few L7 balancing scenarios.

### TestNet internal infra:
- RPC nodes, 1 + 1 nodes internal do failover by L7 balancing with active healthchecks.
- Monitoring & alerting, nodes metrics exporing reused from DevNet.
- All network communication are strongly controlled by ACL/FW.
- CI/CD based on [GitHub actions](https://github.com/QuantumFusion-network/infra/blob/main/docs/provisioning_and_telemetry.md).
- Secret & password manager with [access control](https://github.com/QuantumFusion-network/infra/blob/main/docs/key_management_basic.md) is [Bitwarden](https://bitwarden.com).
- HLD (High level design) of TestNet: `docs/TestNet/TestNet.drawio`

### Additional information:
- [TCO of TestNet (only for team members)](https://github.com/QuantumFusion-network/infra/blob/main/docs/testnet_tco_mar_2025.md)
- [Provisioning & CI/CD](https://github.com/QuantumFusion-network/infra/blob/main/docs/provisioning_and_telemetry.md)
- [How we work with versions & upstream updates](https://github.com/QuantumFusion-network/spec/blob/issue/infra_updates_1/docs/proc/how_we_work_in_the_team.md)

