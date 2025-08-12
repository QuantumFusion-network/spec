# ADR_0018: API Framework and Request Processing

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

We will implement Hono web framework with Zod validation, structured error handling, IP-based rate limiting, and comprehensive logging for all API endpoint management, request validation, error categorization, and abuse prevention.

## Context

The dApp composer requires robust API layer to handle web-based wizard interactions, project generation requests, and user management. The system must:

- Handle complex wizard configurations with validation
- Provide reliable API endpoints for dashboard load times under 3 seconds from case requirements
- Prevent service abuse while maintaining accessibility for developers
- Support tiered rate limiting for different operation costs
- Deliver structured error responses for better developer experience
- Enable comprehensive monitoring and debugging capabilities

Case requirements driving decisions:
- Web2/Web3 developers need intuitive wizard interface
- QF Ecosystem Team requires analytics dashboard and monitoring
- System must support 1000+ concurrent users
- Error messages must provide specific actionable guidance
- Platform serves as primary entry point for QF ecosystem

Technical considerations:
- Integration with Bun runtime for optimal performance
- Public API without authentication requirements initially
- Various network configurations including proxies and CDNs
- Need for different rate limits based on resource intensity

## Options

1. Hono + Zod + Structured Error Handling + IP Rate Limiting (SELECTED)
2. Express + Joi + Custom Error Middleware + Token-based Rate Limiting
3. Fastify + AJV + Third-party Error Service + Infrastructure Rate Limiting

## Consequences

### Option 1: Hono + Zod + Structured Error Handling + IP Rate Limiting (SELECTED)

**Selected because:**
10x faster than Express providing performance needed for 1000+ concurrent users from case requirements, edge-native design optimizes for web-based wizard interactions, built-in middleware includes rate limiting with configurable thresholds, Zod validation provides type-safe request handling for complex wizard configurations, structured error handling delivers actionable guidance as required by case acceptance criteria, comprehensive IP detection works across proxy and CDN configurations

**Selected despite:**
Newer framework with smaller community compared to Express ecosystem, limited third-party middleware options may require custom implementations, team learning curve for Hono-specific patterns and middleware architecture
**Risks and Mitigations:**
- **Rate limiting false positives from shared corporate IPs**
  - Mitigation: Generous limits for lightweight operations, monitoring for legitimate user impact, escalation procedures
- **Validation schema maintenance overhead as wizard complexity grows**
  - Mitigation: Automated schema testing, modular validation design, comprehensive documentation
- **Error handling consistency across multiple developers**
  - Mitigation: Centralized error handling middleware, standardized error response formats, code review processes

**Failure Recovery:**
Migration path to Express exists with middleware compatibility layer, error handling patterns remain consistent across frameworks

### Option 2: Express + Joi + Custom Error Middleware + Token-based Rate Limiting

**Rejected because:**
Significantly slower performance cannot meet 1000+ concurrent user requirements from case, token-based authentication conflicts with public API accessibility goal, custom error middleware increases development complexity and maintenance overhead, Joi validation lacks TypeScript integration for complex wizard schemas

**Rejected despite:**
Mature ecosystem with extensive middleware options and community support, team familiarity with Express development patterns and debugging tools, proven scalability patterns and deployment strategies, extensive documentation and learning resources available

### Option 3: Fastify + AJV + Third-party Error Service + Infrastructure Rate Limiting

**Rejected because:**
AJV schema complexity makes wizard validation maintenance difficult, third-party error services add external dependencies conflicting with simplicity goals, infrastructure-only rate limiting lacks application-level granularity for different endpoint costs, integration complexity with Bun runtime ecosystem

**Rejected despite:**
High performance characteristics suitable for concurrent user requirements, mature validation system with extensive schema support, external error services provide advanced monitoring and alerting capabilities

## Implementation Notes

**Request Processing Pipeline:**
Middleware stack includes CORS handling for web-based interactions, structured logging for comprehensive monitoring, request validation using Zod schemas for wizard configurations, error categorization providing user-friendly messages, rate limiting with multiple IP detection strategies for various network configurations.

**Rate Limiting Strategy:**
Tiered approach matches resource intensity with generation endpoints limited to 10 requests per hour, download endpoints allowing 50 requests per hour, status checking supporting 1000 requests per hour, health monitoring remaining unlimited. IP detection handles multiple proxy headers for accurate identification.

**Error Response Structure:**
Standardized JSON format includes error categorization, user-friendly messages, retry timing information, contextual details for debugging, consistent status codes across all endpoints. Categories cover disk space, network issues, template errors, validation failures, and system errors.

**Validation Architecture:**
Zod schemas define wizard configuration structure, project generation parameters, user input validation, API request formats. Type inference provides compile-time safety for request handling while runtime validation ensures data integrity.

*For detailed implementation code examples and configuration details, see Scaffolding Service Architecture*

## Confirmation

**Acceptance Criteria:**
API framework handles 1000+ concurrent users without performance degradation, wizard validation catches invalid configurations before scaffolding attempts as required by case, error messages provide specific actionable guidance meeting case acceptance criteria, rate limiting prevents abuse while allowing legitimate developer usage patterns

**Testing Approach:**
Load testing with 1000+ concurrent wizard interactions, validation testing with complex and edge-case configurations, error handling testing across all categorized failure types, rate limiting testing with various IP scenarios and proxy configurations

## References

- [Hono Framework Documentation and Performance Benchmarks](https://hono.dev/)
- [Zod Schema Validation Library](https://zod.dev/)
- [Bots Rate Limiting](https://www.cloudflare.com/en-gb/learning/bots/what-is-rate-limiting/), Rate limiting with [Cloudflare WAF](https://developers.cloudflare.com/waf/rate-limiting-rules/best-practices/)
- [Fastify Documentation](https://fastify.dev/docs/latest/)
- [Ajv JSON schema validator](https://ajv.js.org/)
- [Express web framework for Node.js](https://expressjs.com/)
- [Joi schema description language and data validator](https://joi.dev/)

## ADR Relationships

### Related ADRs