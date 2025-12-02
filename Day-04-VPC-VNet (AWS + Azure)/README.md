# Day 04 — VPC (AWS) & VNet (Azure)

Welcome to Day 4 of the 100 Days of Multi-Cloud Challenge! 🎯

Today we’ll cover top-level network concepts in the cloud: VPC (AWS) and VNet (Azure). This folder includes theory, a hands-on project for both AWS and Azure, diagrams, scripts, IaC (CloudFormation) and quiz/homework to help you practice.

---

## What you'll learn
- VPC / VNet fundamentals (CIDR, subnets, route tables) 
- Public vs Private subnets and NAT behaviors
- Security groups, NACLs, and NSG fundamentals
- VPC/VNet Peering (and when to use Transit Gateway/Virtual WAN)
- Hands-on: Create a VPC/VNet with public and private subnets, NAT configuration, and a simple peering

---

## Structure of this folder
- `README.md` — this file
- `content/vpc-overview.md` — article-style overview and step-by-step tutorial
- `cloudformation/vpc-setup.yml` — a sample CloudFormation template to spin up VPC, subnets, IGW, NAT gateway, routes (AWS)
- `scripts/aws-create-vpc.ps1` — PowerShell script using AWS CLI to create VPC resources
- `scripts/aws-destroy-vpc.ps1` — Cleanup script for AWS resources
- `scripts/azure-create-vnet.ps1` — PowerShell script using `az` CLI to create VNet, subnets and NAT
- `scripts/azure-destroy-vnet.ps1` — Cleanup script for Azure resources
- `RESOURCES.md` — links to official docs and references
- `video-links.md` — placeholder for YouTube video and tutorial content (update when ready)

---

## Prerequisites
- AWS CLI v2 installed and configured (with credentials able to create networking resources)
- Azure CLI (`az`) installed and logged in to a subscription with required permissions
- PowerShell or PowerShell Core for running scripts (or adapt the CLI snippets to Linux/Mac shell)
- Free tier or sandbox accounts recommended for hands-on (terminate resources after)

---

## Quickstarts
### AWS Quickstart (CloudFormation)
Deploy the sample CloudFormation stack (change region and stack name as required):

```powershell
# Deploy the VPC CloudFormation stack
aws cloudformation deploy --stack-name day4-vpc-setup --template-file ./cloudformation/vpc-setup.yml --capabilities CAPABILITY_NAMED_IAM
``` 

After deployment, verify the resources in the Console or with the `aws` CLI.

### Azure Quickstart (CLI)
Create a resource group and VNet with subnets using `az` CLI:

```powershell
# Create resource group
az group create --name day4-rg --location "eastus"

# Create VNet with a public and private subnet
az network vnet create --resource-group day4-rg --name day4-vnet --address-prefix 10.1.0.0/16 --subnet-name public-subnet --subnet-prefix 10.1.1.0/24
az network vnet subnet create --resource-group day4-rg --vnet-name day4-vnet --name private-subnet --address-prefix 10.1.2.0/24
```

---

## Cleanup & Cost saving tips
- Terminate instances and resources as soon as you're done (bastion hosts, NAT gateways are charged)
- For quick tests, use provider's free tier images
- For AWS: remove the CloudFormation stack to delete related resources

---

## Next steps
- Read `content/vpc-overview.md` for detailed learning objectives and hands-on commands
- Use `scripts/` to create resources quickly or adapt them into Terraform/Bicep for IaC
- Use `images/` assets to enrich slides, README and video thumbnails. Replace placeholder SVG files with polished diagrams (Figma/diagrams.net) where needed. See `images/README.md` for guidance.

---

Happy building! 🚀

---

## Homework & Quiz
- See `quiz.md` for a short quiz about networks, CIDR, NAT and security groups
- Homework:
	1. Deploy the CloudFormation stack or run the Azure CLI script and create public and private subnets
	2. Launch a public instance and a private instance; demonstrate that the private instance can reach the internet via NAT but cannot be accessed from internet
	3. Create VPC/VNet peering for a second VPC/VNet and show ping / app access between two private instances

Share screenshots and CloudFormation/CLI outputs in the community or Telegram group.

``