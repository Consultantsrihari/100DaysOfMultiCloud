# 🌐 Day 2 — Azure Entra ID + RBAC (Role-Based Access Control)

Welcome to **Day 2** of the **100 Days of Multi-Cloud Challenge**!  
After mastering AWS IAM, today we explore **Azure Entra ID (formerly Azure Active Directory)** and **Role-Based Access Control (RBAC)** — the foundation of identity and access management in Microsoft Azure.

---

## 🎯 Objectives

By the end of this project, you will:
- Create users and security groups in Azure Entra ID
- Understand RBAC (Role-Based Access Control)
- Assign RBAC roles to users/groups
- Work with scopes like Subscription, Resource Group, and Resource
- Implement best practices for least privilege and security

---

## 🧠 Theory — What Is Azure Entra ID?

Azure Entra ID is Microsoft’s **cloud identity platform**, previously known as Azure Active Directory.  
It manages users, groups, and apps across all Microsoft cloud services.

### Identity Types:
1️⃣ **Users** — Real people logging in to Azure  
2️⃣ **Groups** — Collections of users for shared permissions  
3️⃣ **Apps / Service Principals** — Used for automation or app access  

### RBAC (Role-Based Access Control)
RBAC determines *who* can perform *what actions* at *what scope* (subscription, resource group, resource).  
It’s how Azure enforces permissions across cloud resources.

---

## 🔍 AWS IAM vs Azure RBAC

| Feature | AWS IAM | Azure RBAC |
|----------|----------|-------------|
| Scope | Account level | Subscription / Resource Group / Resource |
| Permissions | JSON policies | Predefined role templates |
| Identity Store | IAM | Entra ID |
| Access Control | IAM roles | Managed Identities |
| Policy Style | Allow/Deny | Mostly Allow |

---

## 🛡️ RBAC Scopes (Hierarchy)

Azure permissions can be assigned at:
- **Management Group** (Top-level)
- **Subscription**
- **Resource Group**
- **Resource (VM, Storage, SQL, etc.)**

Lower scopes override higher scopes — giving you precise access control.

---

## 🧰 Best Practices

✔ Use **groups** instead of assigning roles directly to users  
✔ Follow **least privilege** principles  
✔ Enable **MFA** for all accounts  
✔ Use **Conditional Access** policies  
✔ Use **Managed Identities** for applications  
✔ Follow **Zero Trust** model  

---

## 🖼️ Architecture Diagram



---<img width="1174" height="790" alt="Screenshot 2025-11-27 200636" src="https://github.com/user-attachments/assets/94ea618d-1d5c-437d-b44a-e21f05d35be9" />


## 🛠️ Hands-On Project Steps

### Step 1 — Create a User
- Go to **Azure Portal → Microsoft Entra ID → Users → New user**
- Username: `john.developer@yourdomain.onmicrosoft.com`
- Name: `John Developer`
- Auto-generate password → Create user

💬 *This is a standard identity in Azure.*

---

### Step 2 — Create a Security Group
- Go to **Entra ID → Groups → New Group**
- Type: **Security**
- Name: `Developers`
- Add member: John Developer  
- Create group  

💬 *Assign permissions to groups, not users.*

---

### Step 3 — Create a Resource Group
- Azure Portal → **Resource groups → Create**
- Name: `dev-project`
- Region: any  
- Review + Create  

---

### Step 4 — Assign RBAC Role to Group
- Go to **Resource Group → Access Control (IAM) → Add Role Assignment**
- Role: **Contributor**
- Assign to: **Developers group**
- Save  

💬 *Developers can manage resources inside the dev-project RG.*

---

### Step 5 — Test Login
- Open incognito browser  
- Login with John’s credentials  
- Navigate to `dev-project`  
- Create VM → ✅ Works  
- Try subscription-level resources → ❌ Fails  

💬 *RBAC scoping verified successfully.*

---

## 🎉 Day 2 Project Completed!

✔ User creation  
✔ Security group setup  
✔ RBAC role assignment  
✔ Scoped permissions at RG level  
✔ Access verified  

This is exactly what real Azure engineers do daily. 🚀

---

## 🌟 Real-World Example

| Role | Scope | Access Level |
|------|--------|--------------|
| Developers | Resource Group | Contributor |
| Managers | Subscription | Reader |
| DevOps | Resource Group | Owner |
| Auditors | Tenant | Reader |

---


## 💡 Homework
Try creating your own **Managed Identity** and test assigning it to a VM.

---

## 📺 Watch the Tutorial
▶️ [YouTube Video — Day 2: Azure Entra ID + RBAC](YOUR_YOUTUBE_LINK)

---

## 📂 Resources
- 🔗  GitHub Repo (this project): https://github.com/Consultantsrihari/100DaysOfMultiCloud
- 🌐 LinkedIn: https://www.linkedin.com/in/venkatasrihari/
- 💬Telegram: https://t.me/+aUHeeIHnADJjZmE1
