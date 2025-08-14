# ADR_0017: Scaffolding Service Core Runtime and Database Architecture

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

We will use Bun as JavaScript runtime and package manager with SQLite database using WAL mode for all file operations, package management, database persistence, job state tracking, user data storage, and analytics data collection.

## Context

The dApp composer system requires a high-performance foundation for file I/O intensive operations, integrated database support, and package management. The system must:

- Process templates quickly with intensive file I/O operations
- Provide built-in database support for job persistence and multi-user data management
- Handle package management for dependency resolution in generated projects
- Support 1000+ concurrent users with 10,000+ projects from the case requirements
- Maintain 99.5% uptime with <1% project generation failure rate
- Minimize external dependencies and configuration complexity
- Enable developers to create working dApps within target 30 minutes

Key requirements from case:
- Quick project creation for Web2/Web3 developers
- Project generation under 2 minutes
- Support for multiple concurrent project generations
- Reliable state persistence for wizard sessions and project data

Technical constraints:
- Single-instance deployment initially with horizontal scaling capability
- File I/O intensive template processing operations
- Need for zero-config database solution
- Preference for integrated tooling to reduce complexity

## Options

1. Bun runtime + SQLite database (SELECTED)
2. Node.js runtime + PostgreSQL database
3. Deno runtime + MongoDB database

## Consequences

### Option 1: Bun runtime + SQLite database (SELECTED)

**Selected because:**
3x faster than Node.js for file I/O operations critical for template processing, built-in SQLite support eliminates external database dependencies, excellent TypeScript integration without compilation overhead, single runtime handles package management and execution reducing configuration complexity, zero-config database perfect for single-instance deployment with scaling capability, WAL mode provides excellent concurrent read performance for multi-user scenarios

**Selected despite:**
Newer ecosystem with potentially fewer community resources compared to Node.js, some npm packages may have compatibility issues with Bun runtime, team learning curve for Bun-specific APIs and development patterns

**Risks and Mitigations:**
- **Package compatibility issues affecting template generation**
  - Mitigation: Comprehensive testing of all dependencies, maintain fallback compatibility list, regular ecosystem monitoring
- **Database corruption in high-concurrency scenarios**
  - Mitigation: WAL mode configuration, automated backup procedures, database integrity monitoring
- **Limited production debugging tools**
  - Mitigation: Comprehensive structured logging implementation, monitoring integration, error tracking systems

**Failure Recovery:**
Migration path to Node.js + PostgreSQL exists with database migration scripts and code compatibility layers

### Option 2: Node.js runtime + PostgreSQL database

**Rejected because:**
Significantly slower file I/O performance impacting template processing speed, PostgreSQL setup complexity conflicts with zero-config requirement, external database dependency increases operational overhead, compilation overhead for TypeScript reduces development efficiency

**Rejected despite:**
Mature ecosystem with extensive community support and battle-tested production deployments, team expertise with existing Node.js and PostgreSQL knowledge, extensive tooling for debugging monitoring and deployment, proven scalability for high-concurrency applications

### Option 3: Deno runtime + MongoDB database

**Rejected because:**
Limited npm ecosystem compatibility affecting template dependencies, MongoDB complexity overkill for structured job and user data, team unfamiliarity with Deno development patterns, additional NoSQL complexity for primarily structured data use cases

**Rejected despite:**
Security-first design with built-in permissions model, native TypeScript support without compilation steps, modern runtime with similar performance characteristics to Bun

## Implementation Notes

**Database Configuration:**
WAL mode enables concurrent read operations while maintaining ACID properties for job state persistence. Schema includes jobs table with comprehensive error tracking, user authentication data, project metadata storage, and analytics collection with proper indexing for performance under load.

**Runtime Optimization:**
Bun's built-in SQLite integration provides zero-copy operations for database access. File operations use Bun's optimized APIs for template processing and project generation. Package management integrated with runtime eliminates separate tool dependencies.

**Performance Characteristics:**
Target metrics include template processing 3x faster than Node.js baseline, database operations under 10ms for typical queries, concurrent support for 1000+ users, project generation completing under 2-minute requirement from case.

**Resource Management:**
Automatic cleanup procedures prevent disk space exhaustion from generated projects. Database maintenance includes periodic optimization, backup procedures, and integrity verification. Memory usage monitoring with garbage collection optimization.

*For detailed implementation code examples and configuration details, see Scaffolding Service Architecture*

## Confirmation

**Acceptance Criteria:**
Template processing demonstrates 3x performance improvement over Node.js baseline, database operations maintain sub-10ms response times under load, system supports 1000+ concurrent users without performance degradation, project generation consistently completes within 2-minute target from case requirements

**Testing Approach:**
Performance benchmarking against Node.js baseline with identical workloads, concurrent user load testing with realistic usage patterns, database stress testing with high-frequency read/write operations, file I/O performance testing with large template sets

## Advice

- Cleanup generation after for example 5 minutes (Andreea Eftene, 2025-08-06)
- What about retrying the scaffolder job? So suppose we have a failure. So user could manually resume. But should we also perform retry of failed job automatically? (Sviatoslav Alekseev, 2025-08-06)

## References

- [Bun Runtime Documentation and Performance Benchmarks](https://bun.sh/)
- [SQLite Documentation](https://sqlite.org/docs.html)
- [Node.js Documentation](https://nodejs.org/docs/latest/api/)
- [Deno Documentation](https://docs.deno.com/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MongoDB Documentation](https://www.mongodb.com/docs/)

## ADR Relationships

### Related ADRs

- ADR #0018: Scaffolding Service API Framework and Request Processing - Uses Bun runtime foundation
- ADR #0019: Scaffolding Service Template System and Development Tools - Leverages Bun file I/O performance  
- ADR #0022: Scaffolding Service Authentication and Multi-User Security - Uses SQLite for user data storage
