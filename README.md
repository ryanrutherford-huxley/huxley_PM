# huxley-salesforce

This repository is used to build and track Salesforce code changes. It provides a shared place for implementation work, supporting documentation, and Jira-linked development context.

## Workflow

For every change we make in this repository, we should follow these standards:

1. Reference the Jira ticket tied to the work.
2. Add concise, useful comments in code where the logic is not obvious.
3. Keep repository documentation current when we add or change important implementation guidance.
4. Keep comments focused on business logic, design decisions, and Salesforce-specific constraints.
5. Avoid line-by-line comments for obvious code.

## Commenting Standard

Comments should explain:

- why a block of logic exists
- any non-obvious Salesforce behavior, limitation, or assumption
- where a Jira ticket is relevant to the implementation

Comments should not explain:

- obvious variable assignments
- simple control flow
- standard syntax that is already clear from the code itself

## Jira Traceability

Each code change should reference the Jira ticket it belongs to. When appropriate, include the Jira ticket in:

- class-level or file-level comments
- method comments for ticket-specific logic
- supporting design or implementation documents in this repository
- commit messages

Example Jira reference format:

`Jira: ABC-123`
