# What Is AWS IAM?

IAM stands for Identity and Access Management. Its a global service that helps you manage access to your AWS resources securely. IAM lets you define who (identity) can do what (permissions) in your AWS account.

IAM provides four core identity types:

1 IAM Users

These represent real people — such as you, your teammates, or other administrators.
Use-cases:

- Logging into the AWS Management Console
- Using the AWS CLI or SDKs with access keys

2 IAM Groups

A collection of users who share the same permissions.
Use-cases:

- Developers group
- Admins group
- Auditors group

Groups help you assign permissions collectively, instead of individually.

3 IAM Roles

Temporary credentials that are assumed by AWS services, external users, or even other AWS accounts.
Use-cases:

- EC2 instances accessing S3 buckets
- Lambda functions writing to DynamoDB
- GitHub Actions deploying code to AWS
- Cross-account access in multi-account setups

4 IAM Policies

JSON-based documents that define what actions are allowed or denied.
Example:

- Allow S3 Read
- Allow EC2 Start/Stop
- Deny Delete actions

Policies can be attached to users, groups, or roles, controlling their access level precisely.

---

 AWS IAM Best Practices

These are real-world security principles followed by professional cloud engineers:

 Use groups to manage permissions collectively.
 Enable Multi-Factor Authentication (MFA) for all users.
 Never use the root user for daily tasks.
 Always follow the principle of least privilege.
 Rotate access keys regularly.
 Use IAM Roles for applications and AWS services.
 Apply policy boundaries to restrict administrative access.

Following these ensures your AWS environment remains both functional and secure.

---

 Visualizing IAM (Diagram Concept)

Heres how IAM components connect logically:

```
            +---------------+
            |   IAM User    |
            +-------+-------+
                    |
                    v
            +---------------+
            |    Group      |   Dev / Admin / Audit
            +-------+-------+
                    |
                    v
            +---------------+
            |   Policies    |
            +---------------+

            +---------------+
            |    Role       |
            +-------+-------+
                ^       ^
      EC2 ------+       +------ Lambda
```

---

 Hands-On Project: AWS IAM Setup

Lets go step-by-step and actually build it.

STEP 1 — Create a Group

Open AWS Console  IAM

Navigate to User groups  Create group

Name it: Developers

Attach the policy: AmazonS3ReadOnlyAccess

Click Create group

 Explanation:
All users in the Developers group can now read S3 buckets — nothing more.

STEP 2 — Create a User

Go to IAM  Users  Create user

Enter username: john.developer

Select:  Console access

Set a password

Add the user to the Developers group

Click Create user

 Explanation:
The user automatically inherits all group permissions (S3 ReadOnly).

STEP 3 — Enable MFA (Recommended)

Go to the created user  Security credentials

Assign MFA  Virtual MFA device

Use the Google Authenticator App

 Explanation:
MFA improves security by 99% against unauthorized logins.

STEP 4 — Create IAM Role (For EC2)

IAM  Roles  Create role

Select AWS Service  EC2

Attach policy: AmazonS3ReadOnlyAccess

Name it: EC2-S3ReadRole

Click Create role

 Explanation:
This role lets EC2 instances access S3 without storing access keys — much safer.

STEP 5 — Attach Role to EC2 Instance

Go to EC2  Instances

Select your instance  Actions  Security  Modify IAM role

Choose: EC2-S3ReadRole

 Explanation:
Now your EC2 instance has temporary, secure AWS credentials to access S3.

 Day 1 Project Completed!

Youve successfully learned and implemented:

 IAM User Creation
 Group & Policy Permissions
 MFA Configuration
 Role Creation
 EC2 Role Assignment

This is exactly how a Cloud Engineer manages access in a real AWS environment.
