# Day 4 — VPC / VNet (AWS & Azure) — Tutorial Article

Welcome to Day 4 of the 100 Days of Multi-Cloud Challenge!

This article summarizes the theory (CIDR, subnets, NAT, routing), offers practical steps for building demo networks in both AWS and Azure, and includes analogies and tests to ensure learning.

## VPC vs VNet — Short summary
- Conceptually similar: both are container resources for subnets, routing, and security
- AWS uses VPCs and subnets, AWS-specific services like IGW and NAT Gateway
- Azure uses VNets, subnets, and Azure-specific components like NAT Gateway, NSG, and Private Endpoints

## What Is CIDR and Why it matters?
CIDR (`10.0.0.0/16`) defines the IP range for the VPC/VNet and affects how many subnets and hosts you can place in the network.

## Hands-on checkpoints
- Create and verify a VPC/VNet with a public and a private subnet
- Configure NAT for private subnets and test outbound connectivity
- Create security rules and isolate DBs in private subnets
- Peer another VPC/VNet and show connectivity across private networks

## Real-world analogue
- VPC = a campus
- Subnets = building wings
- Security groups / NSG = locks on doors
- Peering = corridor between two buildings

## Homework
Follow `README.md` and use either `scripts/` or the cloudformation template to deploy the demo. Share the outputs and screenshots in the community channel.

---

For more details, step-by-step CLI commands and helpful scripts, see the rest of this folder.

