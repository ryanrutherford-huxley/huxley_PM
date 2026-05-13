# Retry Queue Context

## Purpose

This document captures working context that may be useful across sessions. It is intended to preserve current understanding, assumptions, and project direction so work can resume quickly if conversation history is no longer available.

Related PRD:

- [Retry Queue PRD](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-prd.md)
- [Retry Queue Communication Integration](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-communication-integration.md)
- [Retry Queue Deployment](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-deployment.md)
- [Callout Setup](/Users/ryan.rutherford/huxley-salesforce/docs/callout-setup.md)

## Current Project Focus

The current focus of this repository is Salesforce development related to a retry queue pattern for portal-facing communication updates.

At this stage:

- repository standards have been defined
- a retry queue PRD has been created
- the object and fields for the queue are described as almost complete
- an initial Apex implementation scaffold now exists in this repository

## Expected Workflow

The currently expected system workflow is:

1. A Mogli or Aircall communication is identified for outbound sync.
2. Apex builds a communication update request tied to a case and/or study.
3. `PendingPortalRequestService` creates `Pending_Portal_Requests__c`.
4. Queueable Apex sends the communication payload to the portal endpoint.
5. The retry queue updates the queue record to `Completed`, `Retrying`, or `Dead`.

## Working Standards

The current working standards for this repository are:

- code should include concise, useful comments where logic is not obvious
- code should not use line-by-line comments for obvious behavior
- changes should reference the related Jira ticket
- repository documentation should stay current when important implementation guidance changes

Related repository guide:

- [README](/Users/ryan.rutherford/huxley-salesforce/README.md)

## Current Design Direction

The retry queue is currently expected to include:

- a queue object for pending outbound work
- a creation path for queue records
- asynchronous callout processing
- retry tracking and terminal failure handling
- idempotency support

The current implementation scaffold includes:

- `PendingPortalRequestService` for creating queue records
- `PendingPortalRequestScheduler` for selecting due work
- `PendingPortalRequestProcessor` for outbound callouts and retry handling
- `Portal_NC` Named Credential metadata for the outbound callout base URL
- Apex tests covering queue creation, processing outcomes, and scheduler selection
- a communication integration guide for Apex callers
- a deployment guide and manifest for future org validation

The current working object name referenced in the workflow is:

- `Pending_Portal_Requests__c`

## Notes For Future Sessions

- if conversation history is unavailable, use this document first for project context
- use the PRD for implementation scope and expected system behavior
- keep the `README.md` focused on repository standards rather than solution details
- add new design documents under `docs/` when a topic should live outside the `README.md`

## Open Context Questions

- what is the Jira ticket for the initial retry queue implementation
- whether the final queue object name is confirmed
- whether the first implementation will include scheduler-based retries immediately or start with direct queueable processing
- whether the final communications endpoint, authentication model, and payload contract are confirmed
