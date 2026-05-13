# Callout Setup

## Purpose

This document captures the SF-15 callout setup needed by the retry queue processor.

The Apex processor sends communication updates with `PATCH` through this endpoint pattern:

```apex
callout:Portal_NC/incoming
```

## Metadata

The repository now includes:

- [Portal_NC.namedCredential-meta.xml](/Users/ryan.rutherford/huxley-salesforce/force-app/main/default/namedCredentials/Portal_NC.namedCredential-meta.xml)

The current metadata is a no-authentication bootstrap so the callout reference exists in source and can be deployed with the Apex classes.

The Named Credential endpoint is environment-driven through `sfdx-project.json` string replacement. Set `PORTAL_BASE_URL` before deployment.

Mock/Postman environment example:

```text
export PORTAL_BASE_URL=https://320b1099-394a-4c1a-8c3c-b4e307d7e936.mock.pstmn.io
```

With that value, the runtime URL resolves to:

```text
PATCH https://320b1099-394a-4c1a-8c3c-b4e307d7e936.mock.pstmn.io/incoming
```

## Runtime URL

The service stores this queue endpoint on each record:

```text
callout:Portal_NC/incoming
```

Salesforce resolves `Portal_NC` to the Named Credential base URL, then appends `/incoming`.

## Open Setup Questions

- whether the portal requires authentication
- if authentication is required, whether SF-15 should migrate this bootstrap to the preferred Named Credential plus External Credential setup
