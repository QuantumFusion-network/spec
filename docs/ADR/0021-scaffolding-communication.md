# ADR_0021: Real-time Communication Strategy

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

We will implement Server-Sent Events (SSE) with polling fallback endpoints and automatic reconnection handling for all real-time progress updates, job status communication, and live dashboard updates.

## Context

The dApp composer requires real-time communication to provide immediate feedback during project generation and maintain responsive user interfaces. The system must deliver progress updates while projects are being generated to meet user experience expectations.

Key requirements from case:
- Real-time progress updates during project generation under 2 minutes
- Dashboard providing real-time developer journey insights for QF Ecosystem Team
- Live feedback ensuring developers can track project creation progress
- Support for 1000+ concurrent users requiring scalable real-time communication
- Web-based interface constraint requiring browser-compatible communication protocols
- Wizard state preservation and real-time validation feedback

Technical requirements from scaffolding architecture:
- Job processing takes 30-90 seconds requiring sustained real-time updates
- Unidirectional communication from server to client for progress information
- Automatic reconnection handling for network interruptions
- Fallback mechanisms when real-time connections fail
- Integration with job processing system for status updates
- Resource efficiency for handling multiple concurrent connections

User experience considerations:
- Web2 developers expect immediate feedback during long-running operations
- QF Ecosystem Team needs real-time analytics and monitoring dashboards
- Error notifications must appear immediately when generation fails
- Progress visibility reduces user anxiety during wait periods
- Connection reliability across corporate networks and mobile connections

## Options

1. Server-Sent Events + Polling Fallback (SELECTED)
2. WebSockets + Connection Management
3. Pure Polling + Optimistic Updates

## Consequences

### Option 1: Server-Sent Events + Polling Fallback (SELECTED)

**Selected because:**
Simpler than WebSockets with no complex connection state management reducing development overhead, automatic reconnection built into browser EventSource API handles network interruptions gracefully, works through proxies and corporate firewalls better than WebSocket protocols, perfect match for unidirectional server-to-client progress updates eliminating unnecessary bidirectional complexity, polling fallback endpoints provide reliable degradation when SSE connections fail, minimal client complexity using standard EventSource API without custom protocols, resource efficient with lower overhead than maintaining WebSocket connections for 1000+ concurrent users

**Selected despite:**
Browser compatibility edge cases in older browsers may require polyfills, connection limits where browsers restrict concurrent SSE connections per domain, no bidirectional communication capability limiting future interactive features

**Risks and Mitigations:**
- **SSE connection failures in restrictive corporate networks**
  - Mitigation: Polling fallback endpoint with status checking, connection retry logic, user communication about connectivity issues
- **Memory leaks from unclosed connections during high user load**
  - Mitigation: Automatic cleanup when jobs complete, connection monitoring and forced cleanup, resource usage alerting
- **Proxy buffering preventing real-time updates**
  - Mitigation: Chunked transfer encoding, proxy configuration guidance, fallback polling with shorter intervals

**Failure Recovery:**
Automatic fallback to polling endpoints when SSE fails, connection retry mechanisms with exponential backoff, graceful degradation maintaining user experience

### Option 2: WebSockets + Connection Management

**Rejected because:**
Unnecessary complexity for unidirectional progress updates adding development and maintenance overhead, bidirectional communication capability not needed for job status reporting, connection state management requires complex heartbeat and reconnection logic, proxy compatibility issues particularly in corporate environments where many developers work, higher resource overhead for connection management affecting 1000+ concurrent user scalability

**Rejected despite:**
Full bidirectional communication enabling future interactive features, lower latency for message delivery improving responsiveness, more flexible protocol supporting structured commands and responses, industry standard for real-time web applications with extensive tooling support

### Option 3: Pure Polling + Optimistic Updates

**Rejected because:**
Higher latency with updates delayed by polling intervals reducing real-time user experience, increased server load from constant requests even when no updates available, poor user experience with visible delays in progress updates, resource inefficiency with unnecessary network traffic and processing overhead

**Rejected despite:**
Universal compatibility working in all network environments including restrictive firewalls, simpler server implementation without connection state management complexity, easier debugging with standard HTTP requests providing clear audit trails, no connection management overhead or resource holding

## Implementation Notes

**SSE Implementation Architecture:**
Event stream endpoint provides continuous job status updates with structured JSON data format. Event types include job-update progress-update error-notification and completion-status. Connection management includes automatic cleanup on job completion or client disconnect. Stream closure logic handles both successful completion and error scenarios.

**Polling Fallback Strategy:**
Status endpoint mirrors SSE data format for consistent client integration. Polling intervals adaptive based on job stage with more frequent updates during active processing. Rate limiting configured generously for status endpoints supporting fallback usage patterns. Client-side polling logic activates automatically when SSE connections fail.

**Connection Management Patterns:**
Subscriber pattern enables multiple client connections for same job status. Automatic unsubscription when jobs complete preventing resource leaks. Connection cleanup on client disconnect with proper resource disposal. Connection monitoring and forced cleanup for orphaned connections.

**Real-time Update Integration:**
Job processing system publishes updates through subscriber notification system. Progress tracking includes detailed step information and completion percentages. Error propagation provides immediate notification of generation failures. Completion events trigger automatic stream closure and cleanup.

**Client-side Implementation Support:**
EventSource API integration with error handling and reconnection logic. Fallback activation when SSE connections fail or timeout. State synchronization between real-time updates and polling data. Connection status indication for user awareness of update reliability.

*For detailed implementation code examples and configuration details, see Scaffolding Service Architecture*

## Confirmation

**Acceptance Criteria:**
SSE connections maintain stability for full project generation duration up to 2 minutes, automatic reconnection works correctly after network interruptions, polling fallback activates seamlessly when SSE connections fail, real-time updates support 1000+ concurrent users without performance degradation, progress updates appear within 1 second of server-side job status changes

**Testing Approach:**
Connection stability testing under various network conditions including corporate proxies, load testing with 1000+ concurrent SSE connections simulating peak usage, network interruption and reconnection testing with simulated failures, polling fallback testing when SSE unavailable, memory usage monitoring during extended connection periods

## References

- [Server-Sent Events - Real-time Updates](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
- [EventSource API Browser Support](https://caniuse.com/eventsource)
- [Real-time Web Communication Patterns](https://web.dev/eventsource-basics/)
- [WebSockets_API](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)

## ADR Relationships

### Related ADRs
