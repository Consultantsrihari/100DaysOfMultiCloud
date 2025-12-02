# 🔐 Day 3 — MFA + Security Basics (AWS vs Azure Conditional Access)

- 🔗  GitHub Repo (this project): https://github.com/Consultantsrihari/100DaysOfMultiCloud
- Youtube Video: https://youtu.be/lujj_E4Cz0E
- 🌐 LinkedIn: https://www.linkedin.com/in/venkatasrihari/
- 💬Telegram: https://t.me/+aUHeeIHnADJjZmE1
- Complete Blog: https://techcareerhubs.com/mfa-security-basics-aws-vs-azure-conditional-access/

---

## 📘 Overview

Welcome to **Day 3** of the **100 Days of Multi-Cloud Series**!  
In this project, we’ll explore **MFA (Multi-Factor Authentication)** in **AWS** and **Conditional Access** in **Azure** — two of the most critical layers in cloud identity and access security.

By the end of this session, you’ll:
- Understand **what MFA is** and **why it’s essential**
- Configure **MFA in AWS IAM**
- Set up **Conditional Access policies in Azure Entra ID**
- Compare how both platforms protect cloud identities

---

## 🧠 Theory — MFA & Conditional Access Explained

### ⭐ What is MFA (Multi-Factor Authentication)?
**MFA** adds a second verification layer during login, ensuring that even if your password is stolen, attackers can’t access your account.

**Example:**
1️⃣ Enter password  
2️⃣ Confirm login using your phone or Authenticator app  

💡 MFA reduces identity-based attacks by **over 99%**.

---

### 🔐 Types of MFA
- **OTP (One-Time Password)**  
- **Authenticator App** (Google / Microsoft Authenticator)  
- **SMS Code**  
- **Hardware Key (YubiKey)**  
- **Biometric (Fingerprint / Face ID)**

---

### 🧩 Why MFA Matters
- Protects against **phishing**  
- Prevents **credential stuffing**  
- Reduces **social engineering risk**  
- Secures **remote logins**  

---

## ☁️ Azure Conditional Access (Smart MFA)

**Conditional Access** = “MFA + intelligent rules.”

It lets organizations apply **conditional logic** for authentication — determining who can access, from where, on which device, and under what conditions.

**Azure checks conditions such as:**
- User or group
- Location (geo/IP)
- Device compliance
- Risk level
- Application type

**Then applies actions:**
- Allow  
- Block  
- Require MFA  
- Require compliant device  

💬 Azure’s Conditional Access = Smart, dynamic MFA for enterprises.

---

## 🖼️ Architecture Diagram

<img width="2816" height="1536" alt="Gemini_Generated_Image_j8c53vj8c53vj8c5" src="https://github.com/user-attachments/assets/4f042025-9b2d-4458-b81d-4c869d0af61d" />


🧩 *This applies to both AWS (MFA) and Azure (Conditional Access).*

---

## 🛠️ Hands-On Project (Step-by-Step)

### 🌩️ AWS — Enable MFA for IAM User

1️⃣ **Login** → AWS Console → IAM  
2️⃣ Go to **Users → Select your user**  
3️⃣ Open **Security Credentials** tab  
4️⃣ Under *MFA Device*, click **Assign MFA**  
5️⃣ Choose **Authenticator App**  
6️⃣ Scan QR Code using **Google Authenticator**  
7️⃣ Enter two consecutive verification codes  
8️⃣ Click **Activate MFA**

✅ Your IAM user is now MFA protected.  

---

### 🧩 Enforce MFA for All Users (Password Policy)

1️⃣ Go to **IAM → Account Settings**  
2️⃣ Enable:
   - Require MFA  
   - Strong passwords  
   - Minimum 8 characters  
   - Rotate passwords every 90 days  
3️⃣ Save the policy  

💬 *This ensures every IAM user follows your organization’s security standards.*

---

### ☁️ Azure — Setup Conditional Access Policy

1️⃣ Open **Azure Portal → Microsoft Entra ID**  
2️⃣ Navigate to **Security → Conditional Access**  
3️⃣ Click **New Policy → Create new**  
4️⃣ Name the policy: `Require MFA for all users`  
5️⃣ Conditions:
   - Users: All users  
   - Cloud apps: All apps  
   - Locations: Exclude trusted IPs  
6️⃣ Grant controls: **Require MFA**  
7️⃣ Enable → **ON**

✅ *This policy forces MFA whenever anyone logs into Azure.*

---

## ⚖️ AWS vs Azure — MFA Comparison

| Feature | AWS MFA | Azure Conditional Access |
|----------|----------|--------------------------|
| Basic MFA | ✔ Yes | ✔ Yes |
| Conditional Access | ❌ | ✔ |
| Risk-based Login | ❌ | ✔ |
| Device Compliance | ❌ | ✔ |
| Location-based Access | Partial | ✔ |
| Security Strength | Strong | Smarter |

💬 *AWS = Strong MFA | Azure = Smart, Context-Aware MFA*

---

## 🧠 Real-World Examples

| Scenario | AWS | Azure |
|-----------|-----|-------|
| Login from new country | MFA challenge | MFA required by policy |
| Non-compliant device | MFA only | Blocked by Conditional Access |
| Guest login | MFA optional | Limited access with conditions |
| Root user | Always MFA | Global admin + Conditional rules |

---

## 🧩 Best Practices

✔ Enable MFA for *every* root and IAM user  
✔ Use **Authenticator apps**, not SMS  
✔ Review sign-in logs regularly  
✔ Combine MFA with **Conditional Access**  
✔ Educate users on phishing & MFA fatigue  

---

## 📝 Quiz (Test Yourself)

1️⃣ What is MFA and why is it critical in cloud environments?  
2️⃣ How is Azure Conditional Access more advanced than AWS MFA?  
3️⃣ Should the root user in AWS have MFA enabled?  
4️⃣ Why is SMS-based MFA less secure?  

---

## 💡 Homework

✅ Enable MFA for all AWS IAM users  
✅ Create a Conditional Access policy in Azure  
✅ Test login from multiple devices or locations  
✅ Share your screenshot & comment **#Day3Done**  

---

## 📺 Watch the Full Tutorial
▶️ [YouTube Video — Day 3: MFA + Security Basics (AWS vs Azure Conditional Access)](https://youtu.be/lujj_E4Cz0E)

---

## 📂 Resources
- 💻 [GitHub Repository (100 Days of Multi-Cloud)](https://github.com/Consultantsrihari/100DaysOfMultiCloud)  
- 💬 [Join Telegram Community](https://t.me/+aUHeeIHnADJjZmE1)  
- 🌐 [LinkedIn Post](https://www.linkedin.com/in/venkatasrihari/)  

---

## 🧭 Navigation
🔙 [Previous: Day 2 — Azure Entra ID + RBAC](https://github.com/Consultantsrihari/100DaysOfMultiCloud/blob/main/Day-02-Azure-EntraID-RBAC/README.md)  
🔜 [Next: Day 4 — VPC (AWS) & VNet (Azure)](../Day-04-VPC-VNet (AWS + Azure)/README.md)

---

> 🧠 *Part of the 100 Days of Multi-Cloud Series — Learn AWS, Azure with real-world, hands-on projects and practical cloud engineering scenarios.*

