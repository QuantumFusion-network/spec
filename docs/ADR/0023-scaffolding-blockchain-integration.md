# ADR_007: Blockchain Integration and Network Management

## Date

Decision date: 2025-07-28
Last status update: 2025-08-06

## Status

- [x] Proposed
- [ ] Accepted
- [ ] Deprecated
- [ ] Superseded

### Implementation Status

- [ ] Planned
- [ ] In Development
- [ ] Implemented
- [ ] Verified
- [ ] Discontinued

## People

### Author/Decision Owner (Single Point of Accountability)
Denis Pisarev

### Consulted (Subject Matter Experts)
- Alisher Khassanov
- Andreea Eftene
- Sviatoslav Alekseev

### Informed (Affected Parties)
[People/teams affected by this decision who should be aware]

  - [ ] [Person 1]
  - [ ] [Person 2]
  - [ ] [Person 3]

## Decision

We will use PAPI (Polkadot API) with network configuration management, chain connection handling, and RPC endpoint management for all Polkadot ecosystem connectivity, network switching, and blockchain interactions in generated projects.

## Context

The dApp composer must generate projects that can connect to multiple Polkadot ecosystem networks and provide reliable blockchain interactions. Generated projects need robust network management to support diverse deployment environments and network configurations.

Key requirements from case:
- Integration with Polkadot development tools (PAPI, Zombienet, Chopsticks) per case interfaces
- Support for QF network infrastructure and RPC endpoints per case dependencies
- Generated projects must build successfully without additional configuration per case acceptance criteria
- Educational scaffolding for Web2 developers entering Polkadot ecosystem per case value proposition
- Standardized development patterns for blockchain connectivity
- Template-based approach supporting multiple network configurations per case constraints

Network requirements from scaffolding architecture:
- Support for Polkadot, Kusama, Asset Hub, and custom networks through network registry
- RPC endpoint management with failover capabilities
- Environment-specific network configurations (local, dev, prod)
- Type-safe blockchain interactions for generated dApp projects
- Chain connection handling in base and feature templates
- Development tools integration for local blockchain environments

Technical considerations:
- PAPI stability concerns with note "research: reactive DOT instead?" from scaffolding architecture
- Network configuration management for relay chains and parachains
- RPC endpoint reliability and fallback mechanisms
- Type safety for blockchain API interactions
- Integration with template generation system
- Support for custom network configurations alongside registry networks

## Options

1. PAPI + Network Config Management + RPC Management (SELECTED)
2. polkadot{.js} API + Manual Network Setup + Static RPC
3. Custom RPC Client + Direct Network Calls + Manual Type Management

## Consequences

### Option 1: PAPI + Network Config Management + RPC Management (SELECTED)

**Selected because:**
PAPI provides next-generation Polkadot API with improved performance and type safety for generated dApp projects, network configuration management supports multiple chains including Polkadot Kusama Asset Hub and custom networks through registry system, RPC endpoint management with failover capabilities ensures reliable connectivity across different deployment environments, type-safe blockchain interactions reduce development errors for Web2 developers learning Polkadot ecosystem, automated network switching supports template-based approach with environment-specific configurations, future-proof architecture as PAPI becomes standard Polkadot API replacing legacy polkadot{.js}

**Selected despite:**
PAPI development status may have stability concerns as noted in scaffolding architecture research notes, smaller ecosystem compared to established polkadot{.js} with fewer community resources and examples, potential compatibility issues during PAPI development phases requiring fallback strategies

**Risks and Mitigations:**
- **PAPI stability issues affecting generated project reliability**
  - Mitigation: Regular synchronization with PAPI team per case risk assessment, fallback to stable alternatives, feature flags for experimental functionality, comprehensive testing with PAPI updates
- **Network configuration complexity overwhelming Web2 developers**
  - Mitigation: Simplified default configurations, educational scaffolding in templates, comprehensive documentation with examples
- **RPC endpoint failures disrupting dApp functionality**
  - Mitigation: Multiple endpoint failover, connection retry logic, local development fallbacks, clear error messaging and recovery guidance

**Failure Recovery:**
Fallback to polkadot{.js} integration patterns, manual network configuration options when registry fails, local development tools provide offline blockchain environments

### Option 2: polkadot{.js} API + Manual Network Setup + Static RPC

**Rejected because:**
Legacy API architecture conflicts with future-proof development goals, manual network setup increases complexity for Web2 developers requiring educational scaffolding, static RPC endpoints lack reliability features needed for production dApp deployment, maintenance overhead for legacy API integration patterns

**Rejected despite:**
Mature ecosystem with extensive documentation and community support, proven stability in production environments across many existing dApps, comprehensive feature set supporting all Polkadot ecosystem capabilities, extensive tooling and debugging support

### Option 3: Custom RPC Client + Direct Network Calls + Manual Type Management

**Rejected because:**
Custom RPC client development timeline conflicts with MVP timeline constraints from case, manual type management increases development complexity and error potential, direct network calls lack abstraction benefits for Web2 developer education, maintenance overhead for custom blockchain integration code

**Rejected despite:**
Maximum control over network interactions and optimization opportunities, lightweight implementation without external API dependencies, custom optimization for specific QF network requirements, direct integration with QF-specific blockchain features

## Implementation Notes

**Network Registry Architecture:**
Centralized network configuration supporting relay chains (Polkadot, Kusama) and parachains (Asset Hub variations) with parachain-specific settings. Custom network support for QF and development environments. Environment-specific RPC endpoints for local development testing and production deployment. Network feature flags indicating supported capabilities like governance staking and assets.

**RPC Management Strategy:**
Multi-endpoint configuration with automatic failover for network reliability. Connection pooling and retry logic for handling network interruptions. Health checking for endpoint availability and performance monitoring. Load balancing across multiple RPC providers when available.

**PAPI Integration Patterns:**
Type-safe API clients generated for each supported network configuration. Connection management handling network switching and reconnection scenarios. Event subscription patterns for real-time blockchain data in generated dApps. Transaction signing integration with wallet connectivity patterns.

**Template Integration:**
Base templates include network configuration utilities and connection management. Feature templates leverage network-specific capabilities like Asset Hub token operations. Chain templates provide network-specific development configurations. Educational components explain network concepts for Web2 developers.

**Development Tools Integration:**
Chopsticks integration for local network forking and testing. Zombienet configuration for multi-node development environments. Binary management for local blockchain node execution. Configuration generation for development tool network setup.

*For detailed implementation code examples and configuration details, see Scaffolding Service Architecture*

## Confirmation

**Acceptance Criteria:**
PAPI integration provides reliable blockchain connectivity for generated projects, network configuration management supports multiple Polkadot ecosystem networks without manual setup, RPC endpoint management handles failover scenarios gracefully, generated projects connect to blockchain networks successfully without additional configuration per case requirement, type-safe blockchain interactions reduce development errors for Web2 developers

**Testing Approach:**
PAPI integration testing across multiple network configurations, network switching and failover testing under various connection scenarios, generated project testing with blockchain connectivity validation, performance testing with concurrent network connections, compatibility testing with PAPI development updates

## References

- [PAPI Documentation and Getting Started](https://papi.how/getting-started/)
- [Polkadot Network Configuration Reference](https://docs.polkadot.com/develop/networks/)
- [RPC Calls to Polkadot SDK-based chains](https://papermoonio.github.io/polkadot-mkdocs/develop/toolkit/parachains/rpc-calls/)
- [polkadot{.js} Documentation](https://polkadot.js.org/docs/)

## ADR Relationships

### Related ADRs
