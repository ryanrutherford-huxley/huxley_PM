# Retry Queue PRD

## Document Purpose

This document defines the minimum viable retry queue needed to support outbound retry processing in Salesforce. It is intended to capture the implementation scope, core components, and expected behavior in a single place before or alongside development.

Related context:

- [Retry Queue Context](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-context.md)

## Problem Statement

Salesforce needs a reliable way to retry outbound requests when an external call fails temporarily. Without a retry queue, failed requests can be lost, repeatedly duplicated, or require manual intervention to recover.

## Goal

Provide a simple and reliable retry mechanism that:

- stores failed or pending outbound work
- retries eligible records automatically
- avoids duplicate processing where possible
- stops retrying records that should no longer be attempted

## In Scope

- a custom object that stores retry queue records
- a mechanism to create queue records
- scheduled processing to find eligible work
- asynchronous callout execution
- retry and terminal failure handling
- HTTP callout configuration required for outbound processing

## Out of Scope

- advanced monitoring dashboards
- middleware orchestration
- platform events
- a separate dead-letter object
- advanced locking or lease management

## Minimum Viable Components

### 1. Queue Object

The system requires a custom object to store pending outbound work.

Example object:

`Pending_Request__c`

Required fields:

- `Status__c` (Picklist)
- `Payload__c` (Long Text Area)
- `Endpoint__c` (Text)
- `Retry_Count__c` (Number, default `0`)
- `Max_Retries__c` (Number, default `5`)
- `Next_Attempt__c` (DateTime)
- `Last_Error__c` (Long Text Area)
- `Last_Status_Code__c` (Number)
- `Idempotency_Key__c` (Text)

Initial status values:

- `Pending`
- `Retrying`
- `Completed`
- `Dead`

### 2. Queue Record Creation

The system requires a way to insert queue records when outbound work should be processed.

Possible creation paths:

- Apex trigger
- API

Minimum required values on insert:

- `Status__c = Pending`
- `Retry_Count__c = 0`
- `Next_Attempt__c = NOW()`
- `Idempotency_Key__c = ExternalId + Operation`

### 3. Scheduled Processing

The system requires scheduled Apex to act as the queue engine.

Recommended behavior:

- run every 5 minutes
- query records where `Status__c` is `Pending` or `Retrying`
- process only records where `Next_Attempt__c <= NOW()`

### 4. Queueable Callout Processor

The system requires Queueable Apex to execute outbound HTTP callouts asynchronously.

Recommended flow:

- scheduler finds eligible records
- scheduler enqueues Queueable Apex
- queueable performs the callout
- queueable updates the queue record based on the response

### 5. Retry Logic

The system requires clear retry behavior for success, retryable failure, and terminal failure states.

Expected behavior:

- success:
  `Status__c = Completed`
- retryable failure such as timeout or HTTP `5xx`:
  increment `Retry_Count__c`, set `Status__c = Retrying`, and set a future `Next_Attempt__c`
- permanent failure or max retries reached:
  `Status__c = Dead`

### 6. HTTP Callout Configuration

The system requires outbound callout configuration in Salesforce.

Recommended setup:

- Named Credential

Alternative if needed:

- Remote Site Setting

## Minimal End-to-End Flow

1. A user action or system event creates a queue record.
2. The queue record is saved with a pending status and initial attempt time.
3. Scheduled Apex runs on a fixed interval.
4. The scheduler finds records eligible for processing.
5. Queueable Apex performs the HTTP callout.
6. The queue record is updated to `Completed`, `Retrying`, or `Dead`.

## Expected Workflow

This is the expected business workflow for a communication update:

1. A Mogli or Aircall communication is identified for outbound sync.
2. Apex builds a communication update request tied to a case and/or study.
3. `PendingPortalRequestService` creates a `Pending_Portal_Requests__c` record.
4. Queueable Apex sends the communication payload to the portal endpoint.
5. The retry queue updates the queue record to `Completed`, `Retrying`, or `Dead`.

## Practical Defaults

- scheduler frequency: every 5 minutes
- retry delay: 5 to 15 minutes
- max retries: `5`

## Key Risks

- no retry delay can cause repeated rapid callouts
- no idempotency key can lead to duplicate external processing
- retrying all failures can create infinite retry loops
- missing `Next_Attempt__c` updates can leave records stuck

## Open Questions

- what specific event or process creates queue records first
- which failures should be considered retryable versus terminal
- whether the communications payload contract is final
- whether endpoint values should be stored per record or derived from configuration
