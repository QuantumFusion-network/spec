# ADR_0019: Scaffolding Service Template System and Development Tools

## Date

Decision date: 2025-07-28
Last status update: 2025-08-14

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

We will use Eta template engine with convention-based discovery, Git repository initialization, development tools management (Chopsticks, Zombienet, binary downloads), and automated resource cleanup for all code generation, project scaffolding, and development environment setup.

## Context

The dApp composer must generate complex, customized projects from modular templates while integrating development tools for blockchain development. The system requires:

- Fast template processing to meet project generation under 2 minutes from case requirements
- Support for templates covering token launch, smart contracts, and DAO use cases from case scope
- Standardized, opinionated templates that follow best practices as specified in case value proposition
- Template-based approach only with no custom scaffolding per case constraints
- Integration with Polkadot development tools (PAPI, Zombienet, Chopsticks) from case interfaces
- Git repository initialization for GitHub integration per case scope
- Automated resource cleanup to prevent disk space exhaustion

Case requirements driving decisions:
- Developers need working dApp templates for quick project creation
- Generated projects must build successfully without additional configuration
- Web2 developers require educational scaffolding during setup process
- QF Ecosystem Team needs automated template updates and maintenance
- Platform must reduce Web3 dApp development setup time from weeks to minutes

Technical considerations:
- Modular feature composition for DAO, token, and smart contract use cases
- Chain-specific configurations for multiple Polkadot ecosystem networks
- Development environment setup with blockchain-specific tools
- Template inheritance and code merging capabilities
- Dependency management for generated project requirements

## Options

1. Eta + Convention Discovery + Git Service + Dev Tools + Cleanup (SELECTED)
2. Handlebars + Config Files + Manual Git + Separate Tools + Manual Cleanup
3. Custom Template Engine + Plugin System + External Git + Tool APIs + External Cleanup

## Consequences

### Option 1: Eta + Convention Discovery + Git Service + Dev Tools + Cleanup (SELECTED)

**Selected because:**
2x faster than Handlebars enabling project generation under 2-minute case requirement, async support handles complex template processing workflows, convention-based discovery eliminates manual template registration reducing maintenance overhead for QF Ecosystem Team, structured directory organization supports modular composition of token launch smart contracts and DAO use cases, merge point system enables clean feature integration into base templates, automatic dependency inference reduces configuration complexity, Git service provides proper repository initialization for GitHub integration, development tools management includes Chopsticks Zombienet and binary downloads for complete Polkadot development environment, automated cleanup prevents resource exhaustion during continuous operation

**Selected despite:**
Convention enforcement requires developers to learn specific directory and naming patterns potentially increasing initial learning curve, template discovery happens automatically which can seem magical and less explicit than configuration-driven approaches, merge point conflicts possible between features requiring careful design and testing

**Risks and Mitigations:**
- **Template maintenance overhead as ecosystem grows**
  - Mitigation: Automated testing for templates, community contribution model from case risk assessment, prioritized template roadmap, comprehensive documentation
- **Development tools version compatibility issues**
  - Mitigation: Version pinning strategies, fallback mechanisms, regular compatibility testing, clear upgrade procedures
- **Resource cleanup failures causing disk space exhaustion**
  - Mitigation: Multiple cleanup strategies, monitoring and alerting, manual intervention procedures, disk usage limits

**Failure Recovery:**
Fallback to explicit dependency files when automatic inference fails, manual template registration capability for non-standard structures, development tools can operate independently if integration fails

### Option 2: Handlebars + Config Files + Manual Git + Separate Tools + Manual Cleanup

**Rejected because:**
Significantly slower template processing cannot meet 2-minute project generation requirement from case, lacks async support for complex template workflows, manual configuration overhead conflicts with automated maintenance goals for QF Ecosystem Team, separate tool management increases complexity preventing integrated development experience, manual cleanup procedures create operational overhead and failure points

**Rejected despite:**
Mature template engine with extensive community support and proven production usage, explicit configuration provides clear control over template behavior, manual processes allow fine-tuned control over each operation, separate tools offer maximum flexibility for different use cases

### Option 3: Custom Template Engine + Plugin System + External Git + Tool APIs + External Cleanup

**Rejected because:**
Custom engine development timeline conflicts with MVP timeline constraints from case, plugin architecture complexity exceeds template-based approach constraint, external service dependencies conflict with integrated developer experience goals, API integration complexity increases maintenance burden for development tools management

**Rejected despite:**
Maximum flexibility for template processing and feature customization, plugin system enables community contributions and extensibility, external services provide specialized capabilities and support, API integrations offer best-in-class functionality for each component

## Implementation Notes

**Template Architecture:**
Base template provides React TypeScript Vite foundation with navigation and layout components. Feature templates organized under templates/features/ directory supporting DAO token and smart contract use cases. Chain templates under templates/chains/ provide Polkadot Kusama and Asset Hub configurations. Merge point markers enable feature integration into base application structure.

**Convention-Based Discovery:**
Automatic scanning of templates/features/ and templates/chains/ directories eliminates manual registration. File naming conventions use .eta extensions with output path inference. Merge templates in __merges__ subdirectories specify integration points. Dependency inference parses import statements to detect required npm packages.

**Development Tools Integration:**
Binary service manages Chopsticks, Zombienet and blockchain node downloads with caching and version management. Configuration generation creates network-specific development environments. Script generation provides start/stop commands for local blockchain development. Tool integration supports educational scaffolding for Web2 developers entering Polkadot ecosystem.

**Git Repository Management:**
Automatic git initialization with appropriate .gitignore for blockchain projects. Initial commit creation with proper project structure. Configuration supports GitHub integration requirements from case interfaces. Repository setup prepares projects for GitHub App integration and deployment workflows.

**Resource Cleanup Strategies:**
Automatic cleanup of temporary files during generation process. Configurable retention periods for completed projects. ZIP file cleanup after download operations. Failed generation artifact removal. Disk usage monitoring and alerting to prevent space exhaustion.

*For detailed implementation code examples and configuration details, see Scaffolding Service Architecture*

## Confirmation

**Acceptance Criteria:**
Template processing enables project generation under 2-minute case requirement, generated projects build successfully without additional configuration meeting case acceptance criteria, convention discovery automatically finds templates without manual registration, development tools integration provides complete Polkadot development environment, resource cleanup prevents disk space issues during continuous operation

**Testing Approach:**
Template processing performance testing with complex project configurations, generated project compilation and execution testing, template discovery testing with various directory structures, development tools integration testing across different environments, resource cleanup testing under extended operation scenarios

## Advice

- I thought that there is some general approach which will work with all expected templates. We have separated apps here then when they merge their router definition right but for other pages how will it look like will we merge source codes of them or are they just near by each other in different directories? (Alisher Khassanov, 2025-08-06)
- How to deal with a code duplication? I mean suppose if we have three features: two of them use this this hook but third is not using the hook. Should we extract that to the base template? (Sviatoslav Alekseev, 2025-08-06)
- What steps if we need as a developer to add a new template in the future? We need to perform some changes in wizard to include new template? (Sviatoslav Alekseev, 2025-08-06)
- Is there some single source source of truth for the templates to understand what templates are enabled? (Sviatoslav Alekseev, 2025-08-06)
- Architecture in modular. If there is a new use case we input a new template. That also means that we will need to add a new interface or maybe entire page into wizard and there won't be a single way of doing that. And need to add new test and documentation (Denis Pisarev, 2025-08-06)

## References

- [Eta Template Engine Documentation and Performance](https://eta.js.org/)
- [Polkadot Development Tools Documentation](https://docs.polkadot.com/develop/toolkit/)
- [Git Repository Management Documentation](https://git-scm.com/docs)
- [Zombienet Guide to Spawn a Basic Network](https://papermoonio.github.io/polkadot-ecosystem-docs-draft/dev-tools/zombienet/tutorials/spawn-a-basic-network/)
- [Chopsticks Documentation](https://papermoonio.github.io/polkadot-ecosystem-docs-draft/dev-tools/chopsticks/overview/)
- [Handlebars Template Engine](https://handlebarsjs.com/)

## ADR Relationships

### Related ADRs

- ADR #0017: Scaffolding Service Core Runtime and Database Architecture - Leverages Bun file I/O performance for template processing
- ADR #0018: Scaffolding Service API Framework and Request Processing - Integrates with job processing endpoints
- ADR #0023: Scaffolding Service Blockchain Integration and Network Management - Uses generated chain configurations
