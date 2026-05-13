# Retry Queue Deployment

## Purpose

This document captures the minimum steps needed to validate and deploy the retry queue Apex scaffold once Salesforce CLI access is available.

Related documents:

- [Retry Queue PRD](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-prd.md)
- [Retry Queue Context](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-context.md)
- [Retry Queue Communication Integration](/Users/ryan.rutherford/huxley-salesforce/docs/retry-queue-communication-integration.md)
- [Callout Setup](/Users/ryan.rutherford/huxley-salesforce/docs/callout-setup.md)

## Current Limitation

This repository currently contains Apex source, but the local environment used for development does not have `sf` or `sfdx` installed. Because of that, org validation and deployment could not be run from this session.

## Metadata Included

The current manifest is:

- [manifest/package.xml](/Users/ryan.rutherford/huxley-salesforce/manifest/package.xml)

The current Apex classes are:

- `PendingPortalRequestService`
- `PendingPortalRequestScheduler`
- `PendingPortalRequestProcessor`
- corresponding test classes

The current callout metadata is:

- `Portal_NC` Named Credential

## Org Prerequisites

Before deployment, confirm that the org already contains:

- custom object `Pending_Portal_Requests__c`
- field `Status__c`
- field `Payload__c`
- field `Endpoint__c`
- field `Retry_Count__c`
- field `Max_Retries__c`
- field `Next_Attempt__c`
- field `Last_Error__c`
- field `Last_Status_Code__c`
- field `Idempotency_Key__c`

Also confirm that:

- valid picklist values exist for `Pending`, `Retrying`, `Completed`, and `Dead`
- `PORTAL_BASE_URL` is set before deployment so `Portal_NC` resolves to the target environment URL

## Validation Commands

If `sf` is installed:

```bash
sf org login web --alias <your-org-alias>
sf project deploy validate --manifest manifest/package.xml --target-org <your-org-alias> --test-level RunLocalTests
```

If `sfdx` is installed instead:

```bash
sfdx force:auth:web:login -a <your-org-alias>
sfdx force:source:deploy -x manifest/package.xml -u <your-org-alias> -l RunLocalTests -c
```

## Deployment Commands

If `sf` is installed:

```bash
sf project deploy start --manifest manifest/package.xml --target-org <your-org-alias> --test-level RunLocalTests
```

If `sfdx` is installed instead:

```bash
sfdx force:source:deploy -x manifest/package.xml -u <your-org-alias> -l RunLocalTests
```

## Post-Deployment Checks

After deployment, confirm:

1. the Apex classes compile in the org
2. all tests pass
3. Apex callers can create communication update queue records
4. a `Pending_Portal_Requests__c` record is created with expected communication payload defaults
5. the scheduler can process eligible records
6. a successful callout marks records as `Completed`
7. retryable failures move records to `Retrying`
8. terminal failures move records to `Dead`

## Scheduling Example

Once deployed, the scheduler can be registered in Apex with a cron expression.

Example:

```apex
System.schedule(
    'Pending Portal Request Scheduler - Every 5 Minutes',
    '0 0/5 * * * ?',
    new PendingPortalRequestScheduler()
);
```

## Open Validation Questions

- whether the org field API names exactly match the current Apex references
- whether `PATCH callout:Portal_NC/incoming` is the final endpoint contract
- whether `Portal_NC` should remain no-authentication or move to an authenticated External Credential setup
- whether the queue record creation will start from triggers, batch jobs, or another Apex caller
- what Jira ticket should replace the current `TBD` references in code comments
