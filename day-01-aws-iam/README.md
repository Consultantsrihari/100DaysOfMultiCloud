# Day 01 — AWS IAM (Identity and Access Management)

Welcome to Day 1 of the 100 Days of Multi-Cloud Challenge! 

This project demonstrates the fundamentals of AWS IAM (Identity and Access Management) with a hands-on tutorial. You will find a CloudFormation template and PowerShell scripts to create and remove IAM resources.

## What youll learn

- Create an IAM Group with a managed policy attached
- Create an IAM User and add it to the group
- Enforce MFA best practices (where applicable)
- Create an IAM Role for EC2 and attach managed policies
- Attach IAM Role to an EC2 Instance (manual console step or automation)

## Files in this folder

- `cloudformation/iam-setup.yml` - CloudFormation template that creates:
  - `Developers` group with `AmazonS3ReadOnlyAccess` attached
  - `john.developer` IAM user and optional login profile
  - `EC2S3ReadRole` IAM role for EC2 instances
  - Instance profile `EC2S3ReadRoleInstanceProfile`

- `scripts/create-iam.ps1` - PowerShell script using AWS CLI to create resources interactively
- `scripts/destroy-iam.ps1` - PowerShell script to clean up resources
 - `content/iam-overview.md` - GitHub-ready overview and step-by-step tutorial for Day 1

## Prerequisites

- Windows PowerShell (or PowerShell Core) with `aws` CLI v2 installed and configured
  - Configure AWS CLI: `aws configure` (provide credentials for a user with permissions to create IAM resources)
- Optional: AWS Console access to enable MFA, assign login profiles, and attach roles to EC2 instances

## Quickstart (CloudFormation)

1. In your terminal or in the AWS Console, run the following (change the stack name if needed):

```powershell
# Deploy CloudFormation stack
aws cloudformation deploy --stack-name day1-iam-setup --template-file ./cloudformation/iam-setup.yml --capabilities CAPABILITY_NAMED_IAM
```

2. Verify the stack outputs in the CloudFormation console or run:

```powershell
aws cloudformation describe-stacks --stack-name day1-iam-setup --query "Stacks[0].Outputs"
```

3. The CloudFormation template creates the user; to set a console password or require the user to create a console password, please use the AWS Console or set a login profile using the AWS CLI and a secure password.

## Quickstart (PowerShell + AWS CLI)

1. Review `scripts/create-iam.ps1` and run it from PowerShell. The script performs the steps interactively and includes helpful flags to enable or skip the login profile and MFA steps.

```powershell
# Run script to create resources
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
powershell -File ./scripts/create-iam.ps1
```

2. If you need to clean up everything created by the scripts, run:

```powershell
powershell -File ./scripts/destroy-iam.ps1
```

## Best Practices

- Use MFA for all interactive IAM users (console users) — set this up in the AWS Console under the user security credentials.
- Avoid root user usage for daily tasks
- Use roles for applications rather than long-term access keys
- Rotate keys and use short-lived tokens as much as possible
- Use IAM groups to manage permissions at scale

## Next Steps

- Attach the created role to an EC2 instance via the EC2 console or `aws ec2 associate-iam-instance-profile` command
- Explore cross-account access and role assumption
- Expand roles and policies with least privilege for your typical applications

---

If you want a video walkthrough, update the placeholder link in `video-links.md` and `README.md`.

Happy learning! 
