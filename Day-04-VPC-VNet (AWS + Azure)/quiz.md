# Day 4 — Quiz

Short Quiz: (answers below)

1. True/False: You must assign a public IP to instances in a private subnet to let them reach the internet. 
2. What service provides centralized connecting hub for many VPCs in AWS? (a) VPC Peering (b) Transit Gateway (c) Internet Gateway
3. Which Azure service lets private resources access Azure Storage without public egress? (a) NAT Gateway (b) Private Link/Service Endpoint (c) Azure Firewall
4. Which route destination sends traffic to the internet (0.0.0.0/0) — Where do you route it in AWS? 
5. Why use a NAT Gateway in a private subnet? 

---

Answers:
1. False — private instances do not have public IPs; they use NAT to egress
2. (b) Transit Gateway
3. (b) Private Link / Service Endpoint
4. 0.0.0.0/0 -> Internet Gateway in a public subnet route table; private subnets route 0.0.0.0/0 via NAT
5. NAT ensures private instances can initiate outbound traffic while keeping their private IPs hidden and not having public inbound access.