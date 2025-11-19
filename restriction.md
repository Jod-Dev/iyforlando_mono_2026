# Web Project Restrictions Checklist

This document defines the rules that MUST be followed when writing or reviewing code in this project, with highest priority on SECURITY and PRIVACY.

**Project**: IYF Orlando Platform 2026  
**Stack**: Angular 19, Supabase, Cloudflare Pages

---

## 0. Before starting the project

- [ ] Define the main goal of the project (what problem it solves).
- [ ] Define what personal data (if any) will be processed.
- [ ] Define the tech stack (framework, TS/JS, key libraries).
- [ ] Set up version control (Git) from the beginning.
- [ ] Create an initial README with:
  - [ ] Short project description.
  - [ ] How to install and run.
  - [ ] Requirements (Node, etc.).

---

## 1. Security and Privacy (TOP PRIORITY)

### 1.1. General principles

- [ ] Privacy by design:
  - [ ] Design the system minimizing privacy risks from the start.
  - [ ] Do not add features that harm privacy without a clear, documented reason.

- [ ] Data minimization:
  - [ ] Collect only the data that is strictly necessary.
  - [ ] Avoid requesting sensitive data unless absolutely required.
  - [ ] Do not use personal data for purposes other than the ones stated.

- [ ] Least privilege:
  - [ ] Users can only do what they are actually allowed to do.
  - [ ] Services and components only have access to what they strictly need.

### 1.2. Handling personal data

- [ ] Identify what is considered personal data (emails, names, IP, identifiers, etc.).
- [ ] Define retention times:
  - [ ] Do not store data forever without a reason.
  - [ ] Establish deletion/anonimization policies.
- [ ] Provide mechanisms to:
  - [ ] Update user data (when relevant).
  - [ ] Delete user data (when relevant).

#### 1.2.1. Data Retention and Deletion Policies

- [ ] Define retention periods:
  - [ ] How long to keep active user data.
  - [ ] How long to keep inactive user data.
  - [ ] How long to keep deleted user data (soft delete period).
  - [ ] How long to keep audit logs.

- [ ] Implement data deletion:
  - [ ] Hard delete after retention period expires.
  - [ ] Anonymize data when deletion is not possible.
  - [ ] Cascade deletion (delete related records).
  - [ ] Document what happens to related data.

- [ ] User data export (GDPR compliance):
  - [ ] Allow users to export their data.
  - [ ] Provide data in machine-readable format (JSON, CSV).
  - [ ] Include all user-related data in export.

- [ ] Right to be forgotten (GDPR compliance):
  - [ ] Allow users to request account deletion.
  - [ ] Delete all user data within reasonable time (30 days).
  - [ ] Confirm deletion to user.
  - [ ] Log deletion for audit purposes (without personal data).

### 1.3. Storage and transmission

- [ ] In transit:
  - [ ] Always use HTTPS in production.
  - [ ] Avoid sending sensitive data in URLs (query params).

- [ ] At rest:
  - [ ] Encrypt sensitive data in the database where appropriate.
  - [ ] Never store passwords in plain text (always use secure hashes).

- [ ] Cookies and storage:
  - [ ] Do not store sensitive data in `localStorage` or `sessionStorage`.
  - [ ] Use secure cookies (`Secure`, `HttpOnly`, `SameSite`) for tokens when appropriate.
  - [ ] Do not expose session tokens to frontend JS unless strictly necessary.

### 1.4. Authentication and authorization

- [ ] Authentication:
  - [ ] Implement a robust auth mechanism (JWT, sessions, OAuth2, etc.) depending on the case.
  - [ ] Handle session/token expiration.
  - [ ] Mitigate brute-force attacks (rate limiting, captchas if needed).

- [ ] Authorization:
  - [ ] Check permissions on the backend for each sensitive action.
  - [ ] Never rely only on frontend checks to protect resources.
  - [ ] Implement clear roles/permissions.

#### 1.4.1. Rate Limiting and DDoS Protection

- [ ] Implement rate limiting:
  - [ ] Rate limit authentication endpoints (login, signup, password reset).
  - [ ] Rate limit API endpoints to prevent abuse.
  - [ ] Configure different limits for different user roles.
  - [ ] Use exponential backoff for retries.

- [ ] DDoS protection:
  - [ ] Use Cloudflare DDoS protection (already configured).
  - [ ] Monitor for unusual traffic patterns.
  - [ ] Have a plan to respond to attacks.

- [ ] IP-based restrictions (if needed):
  - [ ] Whitelist/blacklist IPs if necessary.
  - [ ] Implement CAPTCHA for suspicious activity.

### 1.5. Protection against common vulnerabilities

- [ ] XSS (Cross-Site Scripting):
  - [ ] Do not inject HTML without sanitization.
  - [ ] Escape user-provided data when rendered, where needed.
  - [ ] Be careful with `innerHTML` and any API that injects raw HTML.

- [ ] CSRF (Cross-Site Request Forgery):
  - [ ] Use CSRF tokens where applicable.
  - [ ] Configure cookies (`SameSite`) and headers correctly.

- [ ] Injection (SQL/NoSQL/LDAP/etc.):
  - [ ] Use prepared statements or safe ORM methods.
  - [ ] Never build queries by string concatenation with user input.

- [ ] Open redirects:
  - [ ] Validate redirect URLs.
  - [ ] Do not redirect to arbitrary domains without checks.

- [ ] Content Security Policy (CSP):
  - [ ] Configure CSP headers in production.
  - [ ] Restrict sources for scripts, styles, images, fonts.
  - [ ] Use nonce or hash for inline scripts if necessary.
  - [ ] Test CSP doesn't break legitimate functionality.
  - [ ] Monitor CSP violations in production.

### 1.6. Logging, monitoring, and traceability

- [ ] Do NOT log:
  - [ ] Passwords.
  - [ ] Session or access tokens.
  - [ ] Highly sensitive personal data.

- [ ] Log responsibly:
  - [ ] System errors.
  - [ ] Security-relevant events (failed logins, suspicious behavior).
  - [ ] Without violating user privacy.

- [ ] Logging levels:
  - [ ] Use appropriate log levels (debug, info, warn, error).
  - [ ] Don't log at debug level in production.
  - [ ] Log errors with sufficient context (without sensitive data).

- [ ] Log aggregation:
  - [ ] Use a log aggregation service (Sentry, LogRocket, etc.).
  - [ ] Set up alerts for critical errors.
  - [ ] Retain logs for appropriate period (compliance requirements).

- [ ] Structured logging:
  - [ ] Use structured logs (JSON format).
  - [ ] Include request IDs for tracing.
  - [ ] Include user IDs (not personal data) for correlation.

### 1.7. Secret management

- [ ] NEVER commit keys, tokens, passwords, or secrets to the repo.
- [ ] Use environment variables (`.env`) or secret managers.
- [ ] Rotate secrets regularly (or whenever a leak is suspected).

#### 1.7.1. Backup and Disaster Recovery

- [ ] Backup strategy:
  - [ ] Configure automatic backups (Supabase provides this).
  - [ ] Test backup restoration regularly.
  - [ ] Keep backups in separate location.
  - [ ] Document backup and restore procedures.

- [ ] Disaster recovery plan:
  - [ ] Define Recovery Time Objective (RTO).
  - [ ] Define Recovery Point Objective (RPO).
  - [ ] Document disaster recovery procedures.
  - [ ] Test disaster recovery plan periodically.

- [ ] Data loss prevention:
  - [ ] Implement soft deletes for important data.
  - [ ] Keep audit logs of data changes.
  - [ ] Have rollback procedures for deployments.

### 1.8. Row Level Security (RLS) - Supabase Specific

- [ ] Enable RLS on ALL tables:
  - [ ] Every table must have RLS enabled.
  - [ ] No table should be accessible without proper policies.

- [ ] Create comprehensive policies:
  - [ ] Policies for SELECT (read access).
  - [ ] Policies for INSERT (create access).
  - [ ] Policies for UPDATE (modify access).
  - [ ] Policies for DELETE (remove access).

- [ ] Test RLS policies:
  - [ ] Verify users can only access their own data.
  - [ ] Verify admins can access all data.
  - [ ] Verify unauthenticated users have appropriate restrictions.
  - [ ] Test edge cases (deleted users, inactive accounts, etc.).

- [ ] Document RLS policies:
  - [ ] Document what each policy allows/denies.
  - [ ] Document which roles can perform which actions.
  - [ ] Keep policies simple and understandable.

- [ ] Never bypass RLS:
  - [ ] Never use Service Role Key in frontend code.
  - [ ] Never disable RLS "temporarily" without proper justification.
  - [ ] Always use Anon Key in frontend, let RLS handle security.

### 1.9. Supabase-Specific Security

- [ ] Key management:
  - [ ] NEVER commit Supabase keys to repository.
  - [ ] Use environment variables for all keys.
  - [ ] Anon Key: Safe to expose in frontend (RLS protects data).
  - [ ] Service Role Key: NEVER expose in frontend, only in Edge Functions.
  - [ ] Rotate keys if compromised.

- [ ] Database security:
  - [ ] Enable RLS on all tables (see section 1.8).
  - [ ] Use connection pooling appropriately.
  - [ ] Monitor database usage and performance.
  - [ ] Set up database backups (automatic in Supabase).

- [ ] Edge Functions security:
  - [ ] Validate all inputs in Edge Functions.
  - [ ] Use Service Role Key only in Edge Functions.
  - [ ] Implement proper error handling.
  - [ ] Log security-relevant events.

- [ ] Storage security:
  - [ ] Set up storage buckets with proper policies.
  - [ ] Restrict public access to sensitive files.
  - [ ] Validate file types and sizes.
  - [ ] Scan uploaded files for malware (if handling user uploads).

### 1.10. Compliance and Legal

- [ ] Privacy policy:
  - [ ] Have a clear, accessible privacy policy.
  - [ ] Explain what data is collected and why.
  - [ ] Explain how data is used and shared.
  - [ ] Update privacy policy when practices change.

- [ ] Terms of service:
  - [ ] Have clear terms of service.
  - [ ] Explain user rights and responsibilities.
  - [ ] Update terms when necessary.

- [ ] GDPR compliance (if applicable):
  - [ ] Right to access: Users can view their data.
  - [ ] Right to rectification: Users can update their data.
  - [ ] Right to erasure: Users can delete their data.
  - [ ] Right to data portability: Users can export their data.
  - [ ] Right to object: Users can object to data processing.

- [ ] COPPA compliance (if handling minors):
  - [ ] Obtain parental consent for users under 13.
  - [ ] Implement additional protections for minors.
  - [ ] Don't collect unnecessary data from minors.

- [ ] Data processing agreements:
  - [ ] Have agreements with third-party services (Supabase, etc.).
  - [ ] Ensure third parties comply with privacy requirements.

---

## 2. General design principles

- [ ] Apply DRY (Don't Repeat Yourself):
  - [ ] Do not copy-paste code unnecessarily.
  - [ ] Extract reusable functions when patterns repeat.
  - [ ] Use constants for repeated values.

- [ ] Apply KISS (Keep It Simple, Stupid):
  - [ ] Avoid overcomplicated solutions.
  - [ ] Prefer simple structures over heavy abstractions.

- [ ] Respect SOLID (when applicable):
  - [ ] Single Responsibility: each function/module does one clear thing.
  - [ ] Open/Closed: new code should extend, not break existing behavior.
  - [ ] Liskov Substitution: substitutions must not break expectations.
  - [ ] Interface Segregation: do not force dependencies on things not used.
  - [ ] Dependency Inversion: depend on abstractions, not implementations.

- [ ] Apply YAGNI (You Aren't Gonna Need It):
  - [ ] Do not implement things "just in case".
  - [ ] Do not add options/config that nobody needs yet.

- [ ] Follow Clean Code:
  - [ ] Use descriptive names for variables, functions, and files.
  - [ ] Keep functions small and focused.
  - [ ] Use comments to explain intent or decisions, not obvious code.
  - [ ] Keep the code as self-explanatory as possible.

- [ ] Respect Separation of Concerns:
  - [ ] Do not mix business logic with presentation logic.
  - [ ] Do not mix data with UI concerns.
  - [ ] Keep styles separate from structure (no CSS in HTML when avoidable).

- [ ] Favor immutability and pure functions when it makes sense:
  - [ ] Avoid mutating shared objects/arrays without control.
  - [ ] Minimize side effects in functions.

---

## 3. Quality, testing, and error handling

- [ ] Implement unit tests for important logic.
- [ ] Implement integration or E2E tests depending on project criticality.
- [ ] Handle errors explicitly:
  - [ ] Do not leave `catch` blocks empty.
  - [ ] Show clear error messages to the user where appropriate.
  - [ ] Handle loading and error states in the UI.
- [ ] Add logging in critical paths (backend or complex logic).

#### 3.1. Testing Best Practices

- [ ] Test coverage:
  - [ ] Aim for minimum 80% code coverage.
  - [ ] Focus on critical business logic.
  - [ ] Test edge cases and error scenarios.

- [ ] Test types:
  - [ ] Unit tests: Test individual functions/components in isolation.
  - [ ] Integration tests: Test interactions between components/services.
  - [ ] E2E tests: Test complete user flows.
  - [ ] Security tests: Test authentication, authorization, RLS policies.

- [ ] Test data:
  - [ ] Use test fixtures, not production data.
  - [ ] Clean up test data after tests.
  - [ ] Don't commit test data with sensitive information.

- [ ] Test automation:
  - [ ] Run tests in CI/CD pipeline.
  - [ ] Fail builds if tests fail.
  - [ ] Run tests before deployment.

#### 3.2. Error Handling and User Experience

- [ ] User-friendly error messages:
  - [ ] Don't expose technical errors to users.
  - [ ] Provide actionable error messages.
  - [ ] Use consistent error message format.
  - [ ] Provide help/support links when appropriate.

- [ ] Error states in UI:
  - [ ] Show loading states during async operations.
  - [ ] Show error states when operations fail.
  - [ ] Show empty states when no data is available.
  - [ ] Provide retry mechanisms for failed operations.

- [ ] Error logging:
  - [ ] Log errors with sufficient context.
  - [ ] Include user actions that led to error.
  - [ ] Don't log sensitive data in error messages.
  - [ ] Set up alerts for critical errors.

- [ ] Graceful degradation:
  - [ ] Handle network failures gracefully.
  - [ ] Provide offline functionality when possible.
  - [ ] Degrade features, don't break entire app.

---

## 4. JavaScript / TypeScript (ES6+)

- [ ] Use `const` by default, `let` when reassignment is needed, never `var`.
- [ ] Use arrow functions when appropriate.
- [ ] Use template literals instead of string concatenation with `+`.
- [ ] Use destructuring for objects/arrays when it improves readability.
- [ ] Use spread/rest (`...`) to combine or clone structures.
- [ ] Use async/await for async code:
  - [ ] Avoid deeply nested `.then().catch()` chains.
  - [ ] Handle async errors with `try/catch`.

- [ ] Structure code in modules:
  - [ ] Use `import` / `export` clearly and consistently.
  - [ ] Avoid huge modules; split by responsibility.

- [ ] When possible, use TypeScript:
  - [ ] Define types/interfaces for important data structures.
  - [ ] Avoid `any` except in well-justified cases.

---

## 5. HTML (semantic HTML5 and accessibility)

- [ ] Use semantic tags:
  - [ ] `<main>`, `<header>`, `<footer>`, `<section>`, `<article>`, `<nav>`, etc.
- [ ] Keep a clear heading hierarchy (`<h1>` to `<h6>`).
- [ ] Do not use inline styles (`style="..."`), except in rare, justified cases.
- [ ] Basic accessibility:
  - [ ] All meaningful images have `alt` text.
  - [ ] Inputs have associated `<label>` elements.
  - [ ] Keyboard navigation works (focus management).
  - [ ] Use `aria-*` attributes only when needed and correctly.

#### 5.1. Advanced Accessibility (WCAG Compliance)

- [ ] WCAG compliance:
  - [ ] Aim for WCAG 2.1 Level AA minimum.
  - [ ] Test with screen readers (NVDA, JAWS, VoiceOver).
  - [ ] Test keyboard navigation (Tab, Enter, Escape, Arrow keys).
  - [ ] Test with browser zoom (up to 200%).

- [ ] Color contrast:
  - [ ] Ensure sufficient contrast ratios (4.5:1 for text, 3:1 for UI).
  - [ ] Don't rely solely on color to convey information.
  - [ ] Test in different color modes (light/dark).

- [ ] Forms accessibility:
  - [ ] All inputs have associated labels.
  - [ ] Error messages are clearly associated with inputs.
  - [ ] Required fields are clearly marked.
  - [ ] Form validation is accessible.

- [ ] Dynamic content:
  - [ ] Announce dynamic content changes to screen readers.
  - [ ] Use ARIA live regions appropriately.
  - [ ] Manage focus for modals and dynamic content.

---

## 6. Modern CSS

- [ ] Use CSS Variables (Custom Properties):
  - [ ] For colors, sizes, spacing, and other repeated values.
  - [ ] Group them in a central place (e.g., `:root`).

- [ ] Layout using Flexbox and Grid:
  - [ ] Use Flexbox for alignment and linear layouts.
  - [ ] Use Grid for more complex layouts.

- [ ] Design mobile-first:
  - [ ] Base styles for small screens first.
  - [ ] Add media queries for larger screens.

- [ ] Use a naming methodology, e.g., BEM:
  - [ ] `block__element--modifier`
  - [ ] Avoid generic class names like `.red`, `.box1`, etc.

- [ ] Avoid "magic values":
  - [ ] Do not use random numeric values with no context (`margin: 37px;` without reason).
  - [ ] Use variables or comments if a weird value is really needed.

- [ ] Consider theming:
  - [ ] Prepare CSS to support dark/light mode using variables.

#### 6.1. Performance and Optimization

- [ ] Frontend performance:
  - [ ] Implement lazy loading for routes and modules.
  - [ ] Optimize images (compression, WebP format, lazy loading).
  - [ ] Minimize bundle size (tree shaking, code splitting).
  - [ ] Use OnPush change detection strategy in Angular when possible.
  - [ ] Implement virtual scrolling for long lists.

- [ ] API performance:
  - [ ] Implement pagination for large datasets.
  - [ ] Use caching where appropriate (HTTP cache, service cache).
  - [ ] Minimize data transferred (select only needed columns).
  - [ ] Use database indexes for frequently queried columns.

- [ ] Monitoring:
  - [ ] Monitor Core Web Vitals (LCP, FID, CLS).
  - [ ] Monitor API response times.
  - [ ] Set up alerts for performance degradation.
  - [ ] Regularly review and optimize slow queries.

---

## 7. Frontend architecture

- [ ] Split components into:
  - [ ] Presentational components (UI only, no business logic).
  - [ ] Container components (state, API calls, orchestration).

- [ ] State management:
  - [ ] Use local state for component-specific behavior.
  - [ ] Use global state or state libraries only when truly necessary.
  - [ ] Handle states like `loading`, `success`, `error`, `empty`.

- [ ] API calls:
  - [ ] Centralize communication logic (services, hooks, etc.).
  - [ ] Handle errors and retries where appropriate.
  - [ ] Do not scatter raw API calls across many components without structure.

#### 7.1. Angular-Specific Best Practices

- [ ] Component architecture:
  - [ ] Use OnPush change detection when possible.
  - [ ] Unsubscribe from observables to prevent memory leaks.
  - [ ] Use async pipe instead of manual subscription when possible.
  - [ ] Keep components small and focused (single responsibility).

- [ ] Services:
  - [ ] Use providedIn: 'root' for singleton services.
  - [ ] Keep services stateless when possible.
  - [ ] Use RxJS operators appropriately (map, filter, switchMap, etc.).
  - [ ] Handle errors in observables (catchError).

- [ ] Forms:
  - [ ] Use reactive forms for complex forms.
  - [ ] Implement proper form validation.
  - [ ] Show validation errors clearly.
  - [ ] Disable submit button while form is invalid.

- [ ] Routing:
  - [ ] Use route guards for authentication/authorization.
  - [ ] Implement lazy loading for feature modules.
  - [ ] Use route resolvers for data loading when appropriate.
  - [ ] Handle route errors (404, 500, etc.).

- [ ] Dependency Injection:
  - [ ] Use constructor injection.
  - [ ] Avoid circular dependencies.
  - [ ] Use interfaces for dependencies when possible.

---

## 8. Backend / APIs (if applicable)

- [ ] Design endpoints following REST:
  - [ ] Correct HTTP verbs (GET, POST, PUT, PATCH, DELETE).
  - [ ] Coherent HTTP status codes (200, 201, 400, 401, 404, 500, etc.).
- [ ] Always validate input:
  - [ ] Never trust client input.
  - [ ] Sanitize data to avoid injections.
- [ ] Do not expose secrets:
  - [ ] Use environment variables (`.env`).
  - [ ] Never commit keys or tokens.

#### 8.1. Supabase API Best Practices

- [ ] Supabase API usage:
  - [ ] Use Supabase client methods, not raw HTTP calls.
  - [ ] Handle Supabase errors appropriately.
  - [ ] Use RPC functions for complex queries.
  - [ ] Implement pagination for large datasets.
  - [ ] Use select() to limit returned columns.

- [ ] Query optimization:
  - [ ] Use indexes for frequently queried columns.
  - [ ] Avoid N+1 queries (use joins or batch queries).
  - [ ] Monitor slow queries in Supabase dashboard.
  - [ ] Use database functions for complex operations.

- [ ] Input validation:
  - [ ] Validate inputs in Edge Functions if needed.
  - [ ] Use database constraints (NOT NULL, CHECK, etc.).
  - [ ] Validate data types and formats.
  - [ ] Sanitize user inputs before storing.

---

## 9. Workflow (Git, CI/CD, review)

- [ ] Use Git properly:
  - [ ] Small commits with clear messages.
  - [ ] One branch per feature or fix.

- [ ] Perform code reviews:
  - [ ] Check readability, consistency, security, and privacy.
  - [ ] Explicitly check that this checklist is respected.

- [ ] Set up CI/CD where possible:
  - [ ] Run linters (ESLint) on each push/PR.
  - [ ] Run tests automatically.
  - [ ] Automate deploys to environments (dev, staging, prod).

#### 9.1. Documentation Standards

- [ ] Code documentation:
  - [ ] Document complex functions and algorithms.
  - [ ] Use JSDoc/TSDoc for public APIs.
  - [ ] Keep comments up-to-date with code changes.
  - [ ] Explain "why", not "what" (code should be self-explanatory).

- [ ] API documentation:
  - [ ] Document all API endpoints (Supabase auto-generates this).
  - [ ] Document request/response formats.
  - [ ] Document error codes and meanings.
  - [ ] Provide examples when helpful.

- [ ] Project documentation:
  - [ ] Keep README up-to-date.
  - [ ] Document architecture decisions (ADRs).
  - [ ] Document deployment procedures.
  - [ ] Document environment setup.

- [ ] User documentation:
  - [ ] Provide user guides for complex features.
  - [ ] Document known issues and workarounds.
  - [ ] Keep documentation accessible to users.

---

## 10. Before merge / deploy

- [ ] Code complies with all Security and Privacy rules in section 1.
- [ ] Code complies with the design and quality principles in this document.
- [ ] No important warnings in the console (browser or server).
- [ ] Main routes and screens work as expected.
- [ ] Loading and error states are handled.
- [ ] UI looks acceptable on mobile and desktop.
- [ ] Relevant tests pass.
- [ ] RLS policies tested and verified.
- [ ] Performance impact assessed (if applicable).
- [ ] Accessibility verified (keyboard navigation, screen reader, etc.).

---

> This document must be reviewed periodically and updated if standards, stack, or legal/security/privacy requirements change.

**Last updated**: 2026  
**Project**: IYF Orlando Platform 2026
