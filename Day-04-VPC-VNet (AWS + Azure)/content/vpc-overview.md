# VPC / VNet Overview — Day 4

This article explains VPC and VNet fundamentals, how CIDR and subnets work, routing, NAT, and security constructs for both AWS and Azure.

## What is a VPC / VNet?
A VPC (Virtual Private Cloud) in AWS and a VNet (Virtual Network) in Azure is a virtual data center — the top-level virtual networking object that contains subnets, route tables, gateways, and security controls.

## Core Networking Concepts
- **IPv4 & CIDR notation** — e.g. `10.0.0.0/16` defines a block of addresses. The `/16` defines the prefix (mask) length.
- **Subnets** — divide a VPC/VNet into smaller address ranges in one or more availability zones.
- **Public vs Private** — Public subnets attach a public IP & route to Internet Gateway (AWS) / Internet-facing resource; private subnets do not have direct public IPs and use NAT for egress.
- **Route Tables** — define how traffic flows between subnets, the internet, and other networks.
- **NAT** — translates private addresses to public address for outbound connections while preserving inbound isolation.
- **Security Groups / NSGs / NACLs** — security groups (AWS) are stateful filters attached to interfaces, NSGs (Azure) and NACLs (AWS) can be stateless and operate at subnet/VM boundaries.

## Architecture Patterns
- 3-tier architecture (web, app, database) with public front-end and private database and app tiers
- Hub-and-spoke (hub VPC/VNet shared services + spoke VPCs/VNets with peering or Transit Gateway/Virtual WAN)
- Multi-account / subscription design using transit gateway or hub VNet for centralized egress and shared services

## Hands-on Steps Summary (AWS)
1. Create a VPC 10.0.0.0/16
2. Create 3 subnets: public (10.0.1.0/24), application (10.0.2.0/24), database (10.0.3.0/24)
3. Create and attach an Internet Gateway; add route to public subnet's route table
4. Launch a NAT Gateway in the public subnet; add route for private subnets to use NAT
5. Create security groups: web-sg (allow HTTP/SSH from source), app-sg (allow HTTP from web-sg), db-sg (allow MySQL from app-sg)

## Hands-on Steps Summary (Azure)
1. Create Resource Group (e.g., `day4-rg`)
2. Create a VNet `day4-vnet` with address prefix 10.1.0.0/16 and the same logical subnets
3. Create NAT Gateway and public IP; associate the NAT Gateway with the private subnet
4. Create NSGs with similar inbound/outbound rules
5. Create VNet Peering for a second VNet and add routes if required

## Test your setup
- Launch an instance in the public subnet and SSH into it (public IP)
- SSH from public to the private instance via bastion or SSM (AWS system manager) and verify web access to the internet from private instance
- Use curl to reach the public web server from a laptop or browser

## Diagrams
Refer to the `images/` folder and `diagrams.md` for SVG diagrams you can use in video slides, blog posts and thumbnails.

Examples (files):
- `images/day4-vpc-vnet-architecture.svg` — architecture diagram for the VPC/VNet
- `images/day4-hub-spoke.svg` — hub & spoke architecture
- `images/day4-nat-flow.svg` — NAT flow diagram
- `images/day4-sg-nsg-diff.svg` — security groups vs NSGs vs NACLs

---

For the full commands and detailed steps, check the scripts and CloudFormation examples in this folder; they can be run as demo code or adapted to Terraform/Bicep. Use the `images` folder for polished diagrams; `diagrams.md` includes ASCII fallbacks useful for quick text-based slides and videos.

``