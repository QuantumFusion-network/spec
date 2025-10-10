# Brief

Complete system architecture documentation & references for QF TestNet with Paseo relay chain integration.

![Testnet with Paseo diagram](https://github.com/QuantumFusion-network/spec/blob/main/docs/TestNet_infra/Testnet_w_Paseo.png)

# Description

### TestNet public infra:
- 3 Validator Servers:
    - qf-validator-node: Testnet validator
    - qf-paseo-collator-node: Parachain collator interfacing with Paseo relay chain
    - qf-fast-validator-node: Fastnet validator
    - Monitoring stack (Grafana, Prometheus, Promtail)
- 1 RPC & Monitoring Server:
    - qf-paseo-rpc-node-1: Paseo relay chain RPC endpoint
    - qf-node-rpc-3: QF full node with RPC
    - qf-node-archive-3: QF archive node
    - Monitoring Stack (Grafana, Prometheus, Loki)
- Telemetry Server (telemetry.qfnetwork.xyz) for external network monitoring and observability.

### TestNet internal infra:
- P2P Network connecting all validator servers.
- Monitoring & alerting architecture.
- All network communication are strongly controlled by ACL/FW.
- CI/CD based on [GitHub actions](https://github.com/QuantumFusion-network/infra/blob/main/docs/provisioning_and_telemetry.md).
- SSH Key-Based Authentication for all administrative access
- Secret & password manager with [access control](https://github.com/QuantumFusion-network/infra/blob/main/docs/key_management_basic.md) is [Bitwarden](https://bitwarden.com).

### Additional information:
- [TCO of TestNet (only for team members)](https://github.com/QuantumFusion-network/infra/blob/main/docs/testnet_tco_mar_2025.md)
- [Provisioning & CI/CD](https://github.com/QuantumFusion-network/infra/blob/main/docs/provisioning_and_telemetry.md)
- [How we work with versions & upstream updates](https://github.com/QuantumFusion-network/spec/blob/main/docs/proc/how_we_work_in_the_team.md)

