# Retry Queue Communication Integration

## Purpose

This document defines how Apex/system processes should hand communication updates to the retry queue implementation.

The previous Screen Flow address update path is no longer required. The queue now supports outbound communication updates tied to a case and/or study, with source communications coming from Mogli and Aircall.

Related documents:

- [Retry Queue PRD](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-prd.md)
- [Retry Queue Context](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-context.md)

## Integration Pattern

The source process should identify a communication that needs to be sent outbound, build a `PendingPortalRequestService.CommunicationUpdateRequest`, and call `PendingPortalRequestService.enqueueCommunicationUpdate` or `PendingPortalRequestService.enqueueCommunicationUpdates`.

The service owns the queue payload, endpoint, default retry count, and idempotency key so callers do not need to duplicate that logic.

## Required Inputs

A communication update request must include:

- `sourceSystem`: expected source such as `Mogli` or `Aircall`
- `sourceCommunicationId`: stable ID from the source system
- `communicationType`: expected type such as `Text` or `AISummary`
- `communicationBody`: text body or AI summary content
- `caseId` and/or `studyId`

Optional inputs:

- `maxRetries`
- `nextAttemptAt`

## Queue Record Outcome

When the service creates a queue record, it sets:

- `Status__c = Pending`
- `Payload__c` to a generated communication update JSON payload
- `Endpoint__c = callout:Portal_NC/incoming`
- `Retry_Count__c = 0`
- `Max_Retries__c = 5` unless overridden
- `Next_Attempt__c = now` unless overridden
- `Idempotency_Key__c` to a generated key based on operation, source, communication ID, type, and related records

The outbound call itself is handled later by the scheduler and queueable processor.

## Payload Shape

The service currently generates a payload shaped like:

```json
{
  "operation": "CommunicationUpdate",
  "sourceSystem": "Mogli",
  "sourceCommunicationId": "MOGLI-100",
  "communicationType": "Text",
  "communicationBody": "Participant confirmed the visit window.",
  "relatedRecords": {
    "caseId": "500000000000001",
    "studyId": "a00000000000001"
  }
}
```

## Open Integration Questions

- whether the `PATCH callout:Portal_NC/incoming` payload contract is final
- whether additional communication metadata should be included for Mogli or Aircall records
- whether `studyId` maps directly to a Salesforce record ID or to another study identifier
