# 100 Days of Multi-Cloud Mastery (AWS + Azure + GCP)

Project-First Roadmap for the YouTube Series

Welcome to a practical, hands-on 100-day program designed to build job-ready multi-cloud skills across AWS, Azure and GCP. The goal of this series is simple: build, deploy, and operate the same real-world project across all three cloud providers.

---

## Quick Links

- YouTube: https://youtu.be/TVPwoVW4wys?si=JonG69C9250OUobg
- GitHub Repo (this project): https://github.com/Consultantsrihari/100DaysOfMultiCloud
- LinkedIn: https://www.linkedin.com/in/venkatasrihari/
- Telegram: https://t.me/+aUHeeIHnADJjZmE1

---

## How this series is structured

This is a project-first roadmap split into five phases. Each day delivers a small, focused task that builds into a larger multi-cloud blog app and set of automation scripts. Youll get code (CloudFormation/Terraform scripts, PowerShell/Bash), guides, and short videos.

---

## Phase 1 — Multi-Cloud Foundations (Day 1–20)
Goal: Build identical environments in all three clouds using core services.

### Week 1: Identity + Networking (Day 1–7)
Project Goal: Build secure identity + network foundations in each cloud.

Day | Project Task | Mini Theory
---|---|---
1 | Set up AWS IAM users, groups, roles | IAM, security best practices
2 | Set up Azure Entra ID + RBAC | RBAC vs IAM
3 | Set up GCP IAM + Service Accounts | Principles of least privilege
4 | Create AWS VPC with public/private subnets | Subnetting, routing
5 | Create Azure VNet with subnets | Peering, NSGs
6 | Create GCP VPC + firewall rules | Implicit networks, global VPC
7 | Compare 3 cloud networking models | Multi-cloud network architecture

### Week 2: Compute + Storage (Day 8–14)
Project Goal: Deploy the same static blog on EC2, Azure VM, GCE.

Day | Task | Theory
---|---|---
8 | Launch AWS EC2 & deploy sample app | EC2 instance lifecycle
9 | Launch Azure VM | VM scale sets
10 | Launch GCP Compute Engine | Instance templates
11 | Create S3 bucket + static hosting | Object storage concepts
12 | Create Azure Blob static site | Hot/cold tiers
13 | Create GCP Cloud Storage site | IAM vs ACL
14 | Compare all compute + storage services | Service mapping guide

### Week 3: Load Balancing + DNS (Day 15–20)
Main Task: Deploy load balancers in all clouds.

Day | Task | Theory
---|---|---
15 | AWS ALB setup | Layer 4 vs Layer 7
16 | Azure Application Gateway | WAF concepts
17 | GCP HTTP Load Balancer | Global vs regional
18 | Route53 basics | DNS routing
19 | Azure DNS / Cloud DNS | DNS zones
20 | Build multi-cloud failover DNS | Multi-cloud DR basics

---

## Phase 2 — Multi-Cloud DevOps (Day 21–45)
Main Project: CI/CD pipelines + containers + monitoring across clouds

### Week 4: Containers (Day 21–27)
Project Goal: Build + push Docker app to 3 cloud registries.

Day | Task | Theory
---|---|---
21 | Install Docker + create app | Containers vs VMs
22 | Push image to AWS ECR | Auth mechanisms
23 | Push image to Azure ACR | OCI registry concepts
24 | Push image to GCP Artifact Registry | Tagging best practices
25 | Deploy to AWS ECS | Tasks vs services
26 | Deploy to Azure Container Apps | Serverless containers
27 | Deploy to GCP Cloud Run | Auto-scaling

### Week 5: Kubernetes (Day 28–34)
Project Goal: Deploy app on EKS + AKS + GKE.

Day | Task | Theory
---|---|---
28 | K8s basics | Pods, deployments, services
29 | Create AWS EKS cluster | Node groups
30 | Create Azure AKS cluster | Managed identities
31 | Create GCP GKE cluster | Autopilot mode
32 | Deploy multi-cloud K8s app | YAML basics
33 | Ingress controllers | Nginx ingress
34 | Compare managed Kubernetes | Pricing + scaling

### Week 6: CI/CD (Day 35–45)
Project Goal: Build a fully automated multi-cloud CI/CD pipeline.

Day | Task | Theory
---|---|---
35 | GitHub Actions pipeline | Workflows
36 | Deploy to AWS ECS automatically | CI/CD
37 | Deploy to Azure Container Apps | Secrets
38 | Deploy to GCP Cloud Run | Environment configs
39 | AWS CodePipeline | Multi-stage pipelines
40 | Azure DevOps pipeline | Release management
41 | GCP Cloud Build | Docker build triggers
42–45 | Create unified pipeline  deploy to all 3 clouds | GitOps

---

## Phase 3 — Multi-Cloud Data (Day 46–70)
Project: Data Pipeline across AWS + Azure + GCP

Day | Project Task
---|---
46 | ETL basics + choose dataset
47 | Store raw data in S3, Blob, Cloud Storage
48 | AWS Glue ETL job
49 | Azure Data Factory pipeline
50 | GCP Dataflow pipeline
51 | Build multi-cloud data lake architecture
52 | Athena + Synapse + BigQuery query comparisons
53 | Build dashboards in QuickSight
54 | Build dashboards in PowerBI
55 | Build dashboards in Looker Studio
56–60 | Final unified data pipeline + reporting project

---

## Phase 4 — Multi-Cloud Automation + IaC (Day 71–85)
Project: Deploy a full 3-cloud architecture using IaC

Day | Project Task | Theory
---|---|---
71 | Terraform basics | Providers
72 | Build VPC (AWS) | IaC patterns
73 | Build VNet (Azure) | Modules
74 | Build VPC (GCP) | State mgmt
75 | Deploy compute in all 3 clouds | Variables
76 | Deploy load balancers | Outputs
77 | Deploy Kubernetes clusters | Provisioners
78 | Multi-cloud DNS automation | Multi-env patterns
79–85 | Full Terraform project  All 3 clouds automated | 

---

## Phase 5 — Multi-Cloud Capstone (Day 86–100)
Final Project: Multi-Cloud SaaS Application with Global Failover

Day | Task
---|---
86 | Design architecture
87 | Set up multi-cloud global DNS failover
88 | Backend in AWS
89 | Backend in Azure
90 | Backend in GCP
91 | Database replication/backup strategy
92 | Storage replication patterns
93 | Multi-cloud API Gateway design
94 | Build service mesh (Istio optional)
95 | Logging + monitoring stack
96 | Disaster recovery runbook
97 | Cost optimization
98 | Security benchmark comparison
99 | Final testing
100 | Publish full project + GitHub repo

---

## How to use this repo
- `day-01-aws-iam` contains the Day 1 tutorial for IAM in AWS (CloudFormation, scripts, article)
- Each day will have a corresponding folder that contains code, scripts, and a short article or video link\n- day-02-azure-rbac contains the Day 2 tutorial for Azure Entra ID and RBAC (scripts, article, resources, and video link)

---

If you'd like I can convert this roadmap into a structured checklist, auto-generate a folder skeleton for all 100 days (with templates), or add an SVG timeline.

