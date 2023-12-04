# AzureDevops for Swift

Swift SDK for the Microsoft Azure Devops REST API

[Reference](https://learn.microsoft.com/en-us/rest/api/azure/devops)

## What's Included?

- Structured route hierarchy
- Endpoint request and response models
- Fixtures in Swift and JSON

## Structure

The Azure DevOps API is fairly large. As the reference documentation is broken into sub-domains, this package will follow a similar pattern.

## Source Stability

This package is still very immature and will likely change a great deal. Until reaching a stable `1.0`, patch versions will not introduce breaking changes while minor versions may.

## API Versions

This package was started when `7.0` was the latest non-preview version of the API. So, that is the targeted version for now.

It's not clear how multiple API versions will be handled in the future. If they are handled concurrently at all.

## Progress

Below is a table showing progress on each module.

- `--` is no progress
- `PARTIAL` is started but incomplete
- `FULL` is complete for the targeted API version

**Status**  | **Module**
:----------:|:----------------------------
--          | Accounts
--          | Approvals and Checks
--          | Artifacts
--          | Artifacts Package Types
--          | Audit
--          | Build
PARTIAL     | Core
--          | Dashboard
--          | Distributed Task
--          | Environments
--          | Extension Management
--          | Favorite
--          | Git
--          | Graph
--          | Identities
--          | Member Entitlement Management
--          | Notification
--          | Operations
--          | Permissions Report
PARTIAL     | Pipelines
PARTIAL     | Policy
--          | Profile
--          | Release
--          | Search
--          | Security
--          | Security Roles
--          | Service Endpoint
--          | Service Hooks
--          | Status
--          | Symbol
--          | Test
--          | Test Plan
--          | Test Results
--          | Tfvc
--          | Token Admin
--          | Tokens
--          | Wiki
--          | Work
--          | Work Item Tracking
--          | Work Item Tracking Process