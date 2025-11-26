# Day 1 — AWS IAM (Identity and Access Management) — Tutorial Article

Welcome to Day 1 of the 100 Days of Multi-Cloud Challenge!

IAM is the backbone of a secure AWS setup — it controls who can do what. This article walks through the basics, patterns and a step-by-step hands-on project.

## What Is AWS IAM?

IAM stands for Identity and Access Management. Its a service for managing user, group, role, and policies across the account.

### Core concepts
- Users — People or identity credentials
- Groups — Collections of users with shared permissions
- Roles — Temporary credentials assumed by services or users
- Policies — JSON documents that define allowed or denied actions

## Best Practices
- Use groups to manage permissions collectively
- Enable MFA for console users
- Never use root for day-to-day tasks
- Apply principle of least privilege

## Hands-On Steps (Manual UI & AWS CLI)

1. Create a group `Developers` and attach `AmazonS3ReadOnlyAccess`.
2. Create an IAM user `john.developer` and add it to `Developers`.
3. Enable MFA for `john.developer` via the Console.
4. Create a role `EC2-S3ReadRole` with `AmazonS3ReadOnlyAccess` and an instance profile.
5. Attach the instance profile to an EC2 instance.
