# ADR_0020: Scaffolding Service Frontend Application Architecture

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

We will build the frontend using React with TypeScript, Vite build system, TanStack Query for API state management, Tailwind CSS with shadcn/ui components, and Dexie for client-side persistence for all user interface, wizard flows, project dashboard, and local state management.

## Context

The dApp composer requires a sophisticated frontend to deliver guided wizard experiences and project management capabilities. The system must serve as the primary entry point for developers wanting to build dApps on QF, providing intuitive interfaces for both Web2 and Web3 developers.

Key requirements from case:
- Web-based dashboard for project management with load times under 3 seconds
- Interactive wizard for dApp configuration supporting guided learning experience
- Intuitive interface for Web2 developers with educational scaffolding
- Projects dashboard enabling developers to manage multiple projects
- Wizard completion under 5 minutes per case quality attributes
- Mobile-responsive design for accessibility across devices
- State persistence allowing resuming incomplete wizard sessions per case acceptance criteria

User experience requirements:
- Web2/Web3 developers need quick project creation and guided learning experience
- QF Ecosystem Team requires analytics dashboard and platform administration tools
- Wizard completion rate >85% for first-time users per case acceptance criteria
- Template comparison showing feature differences clearly
- Educational content delivery during setup process for Web2 developers

Technical considerations:
- Browser-based interface only per case constraints
- Integration with GitHub authentication and repository management
- Real-time progress updates during project generation
- Complex wizard state management with validation
- API state management for job processing and user data
- Client-side persistence for offline capabilities and session recovery

## Options

1. React + Vite + TanStack Query + Tailwind + shadcn/ui + Dexie (SELECTED)
2. Vue + Vite + Pinia + Vuetify + LocalStorage
3. Next.js + SWR + Styled Components + Custom UI + IndexedDB

## Consequences

### Option 1: React + Vite + TanStack Query + Tailwind + shadcn/ui + Dexie (SELECTED)

**Selected because:**
React ecosystem maturity supports complex wizard flows and dashboard interfaces required by case, TypeScript integration provides type safety for API interactions and wizard state management, Vite build system delivers fast development experience and optimized production builds meeting 3-second dashboard load requirement, TanStack Query provides sophisticated API state management for real-time job progress updates and project data synchronization, Tailwind CSS enables rapid UI development with consistent design system, shadcn/ui components provide accessible pre-built components reducing development time for educational interfaces, Dexie offers robust IndexedDB wrapper for client-side persistence supporting wizard session recovery and offline capabilities

**Selected despite:**
React complexity may require learning curve for team members unfamiliar with modern React patterns, bundle size considerations for mobile-responsive design requirements, TanStack Query learning curve for team members used to simpler state management approaches

**Risks and Mitigations:**
- **Performance degradation with complex wizard state affecting mobile users**
  - Mitigation: Code splitting strategies, state optimization patterns, performance monitoring and testing
- **API state management complexity as dashboard features grow**
  - Mitigation: Structured query design patterns, caching strategies, comprehensive documentation
- **Accessibility compliance for educational components**
  - Mitigation: shadcn/ui accessibility features, automated testing, user testing with diverse developers

**Failure Recovery:**
Migration path to simpler state management exists with React Context, fallback to localStorage for client persistence, component library replacement possible with maintained design consistency

### Option 2: Vue + Vite + Pinia + Vuetify + LocalStorage

**Rejected because:**
Smaller ecosystem for complex wizard component libraries compared to React, Vuetify design system may not provide sufficient customization for educational scaffolding requirements, localStorage limitations cannot support complex wizard session recovery needs, team unfamiliarity with Vue ecosystem increases development timeline

**Rejected despite:**
Simpler learning curve for developers new to modern frontend frameworks, excellent TypeScript integration and development experience, Pinia provides clean state management patterns, Vuetify offers comprehensive component library with material design principles

### Option 3: Next.js + SWR + Styled Components + Custom UI + IndexedDB

**Rejected because:**
Next.js server-side rendering complexity unnecessary for browser-based interface constraint, SWR lacks sophisticated caching and synchronization features needed for real-time job updates, styled-components approach increases development time compared to utility-first CSS, custom UI development timeline conflicts with MVP timeline constraints, direct IndexedDB usage increases complexity compared to abstraction libraries

**Rejected despite:**
Next.js provides excellent developer experience and optimization features, SWR offers simple data fetching patterns, styled-components enable flexible styling approaches, custom UI components provide maximum design control, direct IndexedDB access offers maximum performance and control

## Implementation Notes

**Component Architecture:**
Wizard components structured as multi-step flows with validation and progress tracking. Dashboard components provide project listing management and analytics visualization. Layout components support responsive design across mobile tablet and desktop. Educational components deliver contextual help and learning content for Web2 developers.

**State Management Strategy:**
TanStack Query handles API state for job processing project data and user authentication. Local component state manages wizard form data and UI interactions. Dexie provides client-side persistence for wizard sessions project drafts and offline capabilities. Global state minimal with focus on server state synchronization.

**API Integration Patterns:**
Query patterns for job status polling and real-time updates. Mutation patterns for project generation and repository creation. Optimistic updates for improved user experience. Error handling and retry logic for network resilience. Cache invalidation strategies for data consistency.

**Responsive Design Implementation:**
Tailwind responsive utilities ensure mobile-first design approach. shadcn/ui components provide consistent behavior across screen sizes. Layout patterns adapt wizard flows for mobile interaction. Performance optimization for mobile network conditions.

**Accessibility and Educational Features:**
shadcn/ui accessibility features support diverse developer needs. Educational tooltips and contextual help for Web2 developers. Keyboard navigation support throughout wizard flows. Screen reader compatibility for inclusive developer experience.

*For detailed implementation code examples and configuration details, see Scaffolding Service Architecture*

## Confirmation

**Acceptance Criteria:**
Dashboard loads all user projects within 3-second case requirement, wizard completion rate exceeds 85% for first-time users per case acceptance criteria, wizard state persists across browser sessions enabling resumption of incomplete sessions, mobile-responsive design functions correctly across device types, educational features effectively support Web2 developer onboarding per case requirements

**Testing Approach:**
Performance testing with dashboard load times and wizard interaction responsiveness, usability testing with Web2 developers for educational effectiveness, accessibility testing across assistive technologies and diverse user needs, mobile testing across device types and network conditions, state persistence testing with session recovery scenarios

## Advice

- Download immediately, upload to your own github OR you need to start again (Alisher Khassanov, 2025-08-06)
- Track user activity on the client side. Then we may offer better default option for that (Alisher Khassanov, 2025-08-06)

## References

- [React Documentation and TypeScript Integration](https://react.dev/)
- [Vite Build Tool Performance](https://vitejs.dev/)
- [TanStack Query Documentation](https://tanstack.com/query)
- [Tailwind CSS Framework](https://tailwindcss.com)
- [shadcn/ui Component Library](https://ui.shadcn.com)
- [Dexie IndexedDB Wrapper](https://dexie.org/)
- [TypeScript](https://www.typescriptlang.org)
- [Vue JavaScript Framework](https://vuejs.org/)
- [PiniaThe store for Vue](https://pinia.vuejs.org/)
- [Vuetify Vue Component Framework](https://vuetifyjs.com/en/)
- [Next.js React Web Framework](https://nextjs.org/)
- [SWR Hooks for Data Fetching](https://swr.vercel.app/)
- [IndexedDB API Documentation](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API)

## ADR Relationships

### Related ADRs

- ADR #0018: Scaffolding Service API Framework and Request Processing - Consumes API endpoints for wizard and dashboard functionality
- ADR #0021: Scaffolding Service Real-time Communication Strategy - Integrates SSE for job progress updates
- ADR #0022: Scaffolding Service Authentication and Multi-User Security - Implements GitHub OAuth authentication flows
