# Bref

Here storing related _public_ QF TestNet documents.

# Description

### TestNet public infra:
- 3 nodes of QF Collator + Validator with SPIN consensus. These nodes restricted by access by RPC protocol.
- 1 + 1 nodes of QF RPC (Full node with RPC). These nodes will be avaliable via DNS rpc.qfnetwork.xyz.
- 1 + 1 nodes of QF Archive (Archive node with RPC and GQL server). These nodes will be avaliable via DNS scan.qfnetwork.xyz.
- Cloudflare for DNS balancing and for a few L7 balancing scenarios.

### TestNet internal infra:
- RPC nodes, 1 + 1 nodes internal do failover by L7 balancing with active healthchecks.
- Monitoring & alerting, nodes metrics exporing reused from DevNet.
- All network communication are strongly controlled by ACL/FW.
- CI/CD reused from DevNet.
- Storage of secrets with access control reused from DevNet. Roles will be
updated for TestNet.

# References
- HLD (High level design) of TestNet: `docs/TestNet/TestNet.drawio`
- TCO of TestNet: https://github.com/QuantumFusion-network/infra/tree/main/docs/test_net_tco_Mar_2025.md
- The first iterations & action items for TestNet: https://github.com/QuantumFusion-network/infra/blob/main/docs/TestNet_v1.xlsx
- How we work with versions & upstream updates `docs/proc/how_we_work_in_the_team.md`

