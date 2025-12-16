# ADR_0016: Scaffolding Service System Architecture

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

We will build the complete scaffolding service using Bun runtime, Hono web framework, SQLite database, Server-Sent Events, Eta templating, convention-based template discovery, asynchronous job processing, IP-based rate limiting, automatic cleanup, error categorization, and structured project generation to support a web-based dApp composer platform.

## Context

Need to build complete scaffolding service with all components and features integrated together for generating Polkadot dApp projects.

## Options

1. (SELECTED) **Complete integrated system as described** 
2. **Alternative microservices architecture with external queue**

## Consequences

### Option 1: Complete integrated system (SELECTED)

**Selected because:**
- Bun is 3x faster than Node.js, built-in SQLite, TypeScript support, excellent file I/O performance
- Hono is edge-native, 10x faster than Express, built-in middleware, excellent TypeScript support, minimal footprint
- SQLite is zero-config, perfect for single-instance services, built into Bun runtime
- Server-Sent Events simpler than WebSockets, automatic reconnection, works through proxies, perfect for one-way status updates
- Eta has modern syntax, 2x faster than Handlebars, async support, excellent TypeScript integration
- Convention-based template discovery with automatic discovery, structured directories, merge points, dependency inference
- Asynchronous processing with immediate responses, persistent state, background jobs, progress tracking
- Rate limiting prevents abuse with 10 requests per hour per IP for generation, 50 for downloads, 1000 for status
- Comprehensive error handling with categorization and user-friendly messages
- Automatic resource cleanup prevents disk space leaks
- Supports guided wizard interface for Web2 developer onboarding
- Integrates with GitHub API for repository management
- Provides dashboard for project management
- Reduces dApp development setup time from weeks to minutes

**Selected despite:**
- Multiple complex integrations required
- Many different technologies to learn and maintain
- Complex template system with merge points and conventions
- Rate limiting may affect legitimate users
- Single-instance limitations for scaling

### Option 2: Alternative microservices architecture with external queue

**Rejected because:**
- Multiple services require orchestration, monitoring, and inter-service communication
- Container management, service discovery, and load balancing complexity
- Team must build and maintain multiple codebases simultaneously
- Inter-service calls add processing delays for job coordination
- Multiple failure points, logging aggregation, and debugging complexity

**Rejected despite:**
- Individual services can scale independently based on load
- Each service can use optimal technology stack for its function
- Service failures don't cascade to entire system
- Different teams can own different services independently

## Implementation Notes

**Tech Stack Components:**
- Bun - Runtime & Package Manager
- Hono - Web Framework  
- Zod - Type validation
- SQLite - Job Persistence
- Eta - Template Engine
- Server-Sent Events - Real-time Updates
- PAPI - Polkadot Integration

**Frontend Technologies:**
- TypeScript
- React
- Vite
- Tailwind
- shadcn/ui
- TanStack Query
- Dexie

**Key Modules:**
- JobService - Job lifecycle management, SSE subscriptions, persistence, cleanup, process job queue
- TemplateService - Eta template processing
- TemplateDiscovery - Automatic template discovery from folder
- GeneratorService - Code generation workflow
- DevToolsService - Dev tools management
- GitService - Git operations
- Database Schema - Data persistence structure
- Rate Limiter - API protection
- Cleanup Service - Resource management  
- Error Handler - Error management

**API Endpoints:**
Job Management:
- POST /api/generate - Creates new code generation job, rate limited 10 requests per hour per IP
- GET /api/jobs/:id/stream - Server-Sent Events stream for real-time job updates
- GET /api/jobs/:id/status - Get current job status fallback for SSE issues

File Operations:
- GET /api/jobs/:id/download - Download generated project as ZIP file

Integration Endpoints:
- POST /api/jobs/:id/publish - Publish generated project to GitHub

System Endpoints:
- GET /api/health - Service health check endpoint
- GET /api/metrics - Service metrics for monitoring

**Key Features Summary:**
Async Processing
- Background job processing with real-time updates
- Non-blocking API responses with immediate job creation
- Progress tracking with detailed step information

Error Handling
- Comprehensive error categorization and user-friendly messages
- Structured logging for debugging and monitoring
- Graceful error recovery and cleanup

Rate Limiting
- IP-based rate limiting (10 jobs/hour per IP)
- Configurable thresholds and bypass mechanisms
- Rate limit monitoring and alerting

Resource Management
- Automatic file cleanup with configurable retention
- Shared binary cache with version management
- Memory usage optimization and garbage collection

Real-time Updates
- Server-Sent Events for real-time job progress
- Automatic reconnection and connection management
- Fallback polling endpoints for reliability

Template System
- Pre-existing base template on filesystem
- Modular feature generators with template inheritance
- Conditional template rendering based on configuration

Idempotent requests

Retryable tasks

Templates versioning

## Confirmation

Service must handle all operations correctly including:
- Wizard-based dApp configuration and educational scaffolding for Web2 developers
- GitHub repository creation and management
- Project dashboard with management capabilities
- Template discovery, job processing, real-time updates, rate limiting, error handling, file cleanup, and project generation with all integrated components working together
- Analytics and monitoring for QF ecosystem team insights
- Integration with cloud hosting platforms for deployment

Success Metrics:
- Time to first working dApp under 30 minutes
- Developer retention in ecosystem  
- Support ticket reduction
- Platform adoption growth
- Developer satisfaction scores

## References

- [Bun - Runtime & Package Manager](https://bun.sh/)
- [Hono - Web Framework](https://hono.dev/)
- [Hono - Type validation](https://hono.dev/docs/guides/validation#with-zod)
- [Zod](https://zod.dev/)
- [SQLite](https://www.sqlite.org/)
- [Eta - Template Engine](https://eta.js.org/)
- [Server-Sent Events - Real-time Updates](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
- [PAPI - Polkadot Integration](https://papi.how/getting-started/)
- [GitHub API Documentation](https://docs.github.com/en/rest)
- [Web Authentication API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Authentication_API)
- [Polkadot Documentation](https://papermoonio.github.io/polkadot-mkdocs/)
- [TypeScript](https://www.typescriptlang.org)
- [React](https://react.dev)
- [Vite](https://vitejs.dev)
- [Tailwind](https://tailwindcss.com)
- [shadcn/ui](https://ui.shadcn.com)
- [TanStack Query](https://tanstack.com/query)
- [Dexie](https://dexie.org/)

## ADR Relationships

[Fill in the section if applicable or leave blank for further filling.]

### Supersedes
- ADR #[X]: [Brief description of superseded decision]

### Superseded By
- ADR #[X]: [Brief description of superseding decision]

### Related ADRs
- ADR #[X]: [Brief description of relationship]