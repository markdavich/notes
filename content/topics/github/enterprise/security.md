# Foundations of GitHub Enterprise Security

**✨ Pluralsight Course**

## 🏵️ Identifying Security Risks in GitHub Repositories

Security in GitHub is about **protecting your work, your people, and your company**
from mistakes and misuse — whether accidental or intentional.

## Terms

### Artifact Poisoning  
When a bad actor secretly changes a shared software package so others download
something harmful instead of something helpful.  
**Think of it like:** Someone tampering with food in a shared fridge.

### IT Ops  
The team that keeps systems running safely and reliably.  
**Think of it like:** Building maintenance for technology.

### Shift Left  
Catching problems **earlier** instead of later.  
**Think of it like:** Fixing a leaky pipe while the wall is still open.

### Dependency Scanning  
Checking the tools you rely on for known problems.  
**Think of it like:** Inspecting parts before putting them in a machine.

### Secret Scanning  
Finding passwords, keys, or tokens in your code before bad actors do.  
**Think of it like:** A metal detector at airport security.

### Infrastructure as Code (IaC)  
Writing system setup instructions as files instead of clicking buttons.  
**Think of it like:** Blueprints instead of verbal instructions.

### EPSS  
A score that predicts how likely a vulnerability will be attacked.  
**Think of it like:** A weather forecast for cyber risk.

### AppSec  
Application Security — keeping software safe from misuse.  
**Think of it like:** Locks on your house doors.

### SAST  
Scanning code for security issues **before** it runs.  
**Think of it like:** Spellcheck, but for security mistakes.

### Flask API  
A small service that lets systems talk to each other.  
**Think of it like:** A receptionist passing messages between offices.

### Ops  
The people who keep everything working day to day.  
**Think of it like:** Operations staff in a factory.

### DevOps  
Developers and operations working together.  
**Think of it like:** Builders and maintenance working as one team.

### DevSecOps  
DevOps with security built in from the start.  
**Think of it like:** Designing a house with locks, not adding them later.

## Three Common GitHub Repository Threats

### Secrets in Code  
Passwords accidentally saved in files.

### Dependency Vulnerabilities  
Using tools that already have known weaknesses.

### Privilege Misconfiguration  
Giving people or systems **more access than they need**.

## `.github` Folder

A special folder that stores **rules, templates, and automation** for your repos.

**Think of it like:**  
The company policy binder that applies to everyone.

## Configure Dependabot  
Dependabot checks your dependencies and alerts you when something is unsafe.

**Key security settings**
- Enable security updates  
- Enable version updates  
- Turn on alerts  
- Auto-create fix pull requests  

**Think of it like:**  
A mechanic who checks your car regularly and fixes issues early.

## Why GitHub Security Matters for IT Ops Teams

IT Ops teams care about:
- System uptime  
- Company reputation  
- Cost control  
- Compliance  

Security failures turn into:
- Downtime  
- Emergency fixes  
- Financial loss  
- Legal trouble  

## How Vulnerabilities Happen

### Source Code Issues  
Mistakes in how software is written.

### Config Issues  
Systems set up in unsafe ways.

### Transitive Dependencies  
Problems hiding inside tools you didn’t directly choose.

**Think of it like:**  
Buying a safe product that contains a dangerous part inside.

## Bad Habits, Big Risks

### Insecure Coding Practices  
Skipping safety checks.

### Committing Before Scanning  
Saving problems permanently.

### Skipping Code Reviews  
No second set of eyes.

### Sharing Credentials  
Treating passwords like sticky notes.

## Stick to Patterns, Avoid Anti-Patterns

**Good patterns in GitHub**
- Use pull requests  
- Require reviews  
- Use automation  
- Limit permissions  
- Scan early and often  

**Avoid**
- Direct commits to main  
- Storing secrets in files  
- Manual-only security  

## Secure by Automation

### Pre-Commit Hooks  
Stop bad code before it’s saved.

### GHAS (Advanced Security)  
Scans code, secrets, and dependencies automatically.

### Status Checks Before Merges  
Blocks risky changes before they go live.

**Think of it like:**  
Airport security before boarding the plane.

## Dependabot Alerts

### Pull Requests  
Dependabot can automatically open PRs that fix security issues.

**Think of it like:**  
A repair ticket that fixes itself.

## Summary (Module 1)

Security risks mostly come from:
- Human mistakes  
- Lack of visibility  
- Delayed action  

GitHub helps by:
- Detecting early  
- Automating protection  
- Making safe behavior easier than unsafe behavior  
------------------------------------------------------------------------

## 🏵️ Securing Repositories with Built-In GitHub Protections

Security features exist because **people are busy** and mistakes happen.
Automation protects when attention slips.

## Why They Matter

Because:
- You cannot rely on memory  
- You cannot rely on perfect behavior  
- You can rely on automation  

## Force Push  
Overwrites history — useful in rare cases, dangerous in most.

**Think of it like:**  
Rewriting meeting notes after people already acted on them.

## Code is Infrastructure  
Your code controls systems.  
If code is unsafe, systems are unsafe.

## Security Starts at Commit  
The moment code is saved is the **earliest and best time** to stop problems.

## Supply Chain Security  
Protecting everything you depend on — including tools written by others.

## Three Pillars of Secure Repositories

1. Branch Protection Rules  
2. Dependency Awareness  
3. Secret & Code Scanning  

## Repository Hardening

### Branch Protection  
Prevents risky changes.

### Disable Force Push  
Protects history.

### Add `SECURITY.md`  
Creates a security contact point.

### Enable Dependabot  
### Enable Code Scanning  
### Enable Secret Scanning  

These are the **Big 3**.

## Code Security vs Secret Protection

- **Code Security:** protects *how things work*  
- **Secret Protection:** protects *who can access them*  

Both are equally critical.

## Strategy

### Enterprise-Wide Policies  
Set rules once, apply everywhere.

### CodeQL  
Automated code review.

### Roll Out Push Protections  
Block secrets before they land.

### Standardize Workflows  
Use Actions templates.

### Monitor Security Overviews  
Check weekly.

## GitHub API `.yml`

Automation files that control security behavior.

**Think of it like:**  
Programmable rules instead of manual enforcement.

## Pre-Enabled CodeQL

### Shift Left with CodeQL  
Catch issues before release.

### Customize CodeQL Workflows  
Tailor scans to your risks.

## Branch Protection

### Rulesets  
### Targeting  
### Branch Rules  

**Think of it like:**  
Different locks for different doors.

## VS Code Extensions (Official)

Bring security checks into daily work.

## Code Scanning (GHAS)

Finds unsafe patterns in code.

## Secret Scanning (GHAS)

Finds leaked credentials.

## Summary (Module 2)

Secure repos are:
- Automated  
- Standardized  
- Monitored  

## 🏵️ Understanding and Using GitHub Advanced Security

## Compare to Third-Party Tools

GHAS works **with**:
- SonarQube  
- Snyk  
- Checkmarx  

But its power is that it’s **built into GitHub**.

## Strategic Delta: Baked into GitHub

Security isn’t bolted on — it’s part of the workflow.

## CodeQL

CodeQL treats code like data you can **query**.

**Think of it like:**  
Searching your codebase the way you search a database.

### Combined with SAST Tools  
Layered defense.

### Treat Code as a Relational Database  
Find patterns at scale.

### Query with CodeQL Language  
Ask smart security questions.

### GitHub-Based CI/CD Pipelines  
Scan automatically.

### Folder Structure  
Keeps rules organized.

### `codeql-config.yml`  
Controls how scanning behaves.

## Preparing Repositories for CodeQL

- Enable workflows  
- Choose languages  
- Set schedules  
- Review alerts  

## Secret Protection & Push Protections

### Committing Code with Secrets  
Blocked immediately and user is notified.

**Think of it like:**  
Trying to leave the building with sensitive files — alarms go off.

## Marketplace & Repository Security

### `SECURITY.md`  
Tells people how to report issues safely.

## Summary (Module 3)

GHAS turns security into:
- A daily habit  
- A shared responsibility  
- An automated safety net  
------------------------------------------------------------------------

## 🏵️ Preparing and Hardening Repositories Using GHAS

## Overview

Security is not a one-time setup — it’s a **continuous process**.

## Monitoring & Continuous Improvement

### Secret Scanning — What it Does  
Finds exposed secrets.

### Leaked Secrets — How GitHub Helps  
- Alerts  
- Blocks pushes  
- Guides remediation  

## Checklist for Staying Ahead

- [ ] Check Security Tab Weekly  
- [ ] Subscribe to Dependabot Alerts  
- [ ] Enable Branch Protection  
- [ ] Use CODEOWNERS  
- [ ] Review Audit Logs  

## Monitoring  
Watch trends, not just incidents.

## Continuous Improvement  
Fix systems, not just symptoms.

## Campaigns  
Roll out improvements across orgs.

## GitHub CLI for IT Ops

A command-line way to manage GitHub at scale.

**Think of it like:**  
Remote control for your organization.

## Secret Scanning vs Repository Secrets

- **Secret Scanning:** finds leaks  
- **Repository Secrets:** stores credentials safely  

## Applying Organizational Security Policies

### The `.github` Repository  
Central place for rules.

## Centralizing Security with Reusable Workflows

### AutoFix  
Automated fixes for common issues.

## Analyze the Organizational Audit Log

Track:
- Who changed what  
- When  
- Why  

## Summary (Module 4)

Strong GitHub security comes from:
- Visibility  
- Automation  
- Consistency  
- Continuous improvement  

**Security is not fear-based — it’s confidence-based.**



---
💠💠💠💠💠💠💠💠💠💠💠💠💠💠
---

## ✨ Recognize the Risks of Leaked Secrets

Leaked secrets are one of the **fastest ways** for attackers to gain access to systems.
They’re not theoretical — they’re one of the most common real-world security incidents.

## Common Secrets that End Up in Code Repositories

- **API Keys** – passwords that let software talk to other software  
- **OAuth Tokens** – digital passes that grant access on a user’s behalf  
- **SSH Keys** – special keys for logging into servers  
- **Cloud Service Credentials** – access to AWS, Azure, GCP, etc.  
- **Database Connection Strings** – keys to your data vault  
- **JWTs (JSON Web Tokens)** – proof of identity between systems  

**Think of secrets like:**  
Master keys. If someone gets one, they don’t need to break in — they just walk in.

## How Do Secrets End Up in Code Repositories?

Most leaks happen because of **normal human behavior**, not bad intent.

Common causes:
- Copy/paste from setup guides  
- Testing something “just for now”  
- Forgetting to remove credentials before saving  
- Rushing a fix  
- Not knowing safer options exist  

**In simple terms:**  
People don’t mean to leak secrets — they just don’t realize the risk until it’s too late.

## Anti-Pattern: Removing Secrets After Commit

### What happens

1. A developer accidentally commits a secret.  
2. Later, they realize the mistake.  
3. They remove it in a new commit.  

The problem?  
**The secret still exists in history.**

It’s like:
> Shredding a document after you already made copies.

## Now They Need to Fix It Everywhere  
### How do they do it?

Fixing a leaked secret means **more than deleting a line of code**.

You must:
1. **Rotate the secret** – create a new one immediately  
2. **Revoke the old one** – make the leaked one useless  
3. **Remove it from history** – rewrite Git history if needed  
4. **Check logs** – see if it was used by attackers  
5. **Update every system** that depended on it  

**Think of it like:**  
Changing your locks, not just hiding the spare key.

## How Attackers Exploit Leaked Secrets

Attackers don’t usually “hack” — they **scan**.

They use automated tools to:
- Search public and private repos  
- Look for patterns that match keys  
- Test them immediately  
- Exploit them in minutes  

What they do next:
- Run up cloud bills  
- Steal data  
- Deploy malware  
- Use your systems to attack others  

**Time matters:**  
Some leaked secrets are abused **within minutes** of exposure.

## Best Practices to Prevent Secret Leaks

### 1. Never store secrets in code  
Use secure storage instead.

### 2. Use GitHub Secret Scanning  
Detects secrets before attackers do.

### 3. Enable Push Protection  
Blocks secrets from being committed at all.

### 4. Use environment variables  
Keeps secrets outside your files.

### 5. Rotate secrets regularly  
Old keys should expire.

### 6. Train teams  
Awareness is prevention.

**Think of prevention like:**  
Seatbelts — you hope you never need them, but you always wear them.

## Distinguish Between Secret Detection Tools and Secret Managers

### Secret Detection Tools  
**What they do:**  
Find secrets that are already exposed.

Examples:
- GitHub Secret Scanning  
- TruffleHog  
- Gitleaks  

**Think of them like:**  
Security cameras that alert you when something goes wrong.

### Secret Managers  
**What they do:**  
Store secrets safely so they never need to go in code.

Examples:
- GitHub Secrets  
- Azure Key Vault  
- AWS Secrets Manager  
- HashiCorp Vault  

**Think of them like:**  
A locked safe — not a security camera.

## Final Thought

Secret scanning helps you **recover** from mistakes.  
Secret management helps you **avoid** them in the first place.

The strongest security strategy uses **both**:
- Detect leaks fast  
- Prevent leaks entirely  

**In simple terms:**  
Don’t just clean up spills — stop carrying open cups.

---
💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠
---

## ✨ Recognize the Risks of Software Supply Chain Attacks

Software today is rarely built from scratch. It’s assembled from **many outside
pieces** — libraries, tools, and services written by other people.

That means your software is only as safe as the **weakest piece** you depend on.

This lesson helps you:
- Understand what software supply chains are  
- Recognize how attacks happen  
- See real-world examples  
- Learn how GitHub Advanced Security helps protect you  

## Foundational Definitions

### Supply Chain  
**What it means:**  
Everything that goes into making your software — including tools written by others.

**Think of it like:**  
A restaurant meal. You may cook it, but you didn’t grow every ingredient.

### Dependency  
**What it means:**  
A tool or library your project uses.

**Think of it like:**  
Buying parts instead of building everything yourself.

### Transitive Dependency  
**What it means:**  
A dependency of your dependency.

**Think of it like:**  
Your contractor hires a subcontractor you never met — but you still depend on them.

### Dependency Review  
**What it means:**  
Checking new dependencies before allowing them in.

**Think of it like:**  
Inspecting packages before bringing them into your house.

### Supply Chain Attack  
**What it means:**  
When attackers compromise software **before it reaches you**.

**Think of it like:**  
Poisoning food at the factory instead of breaking into the kitchen.

## Real-World Attack Patterns

These attacks didn’t target companies directly — they targeted **what companies trust**.

### SolarWinds (2020)  
Attackers slipped malicious code into a trusted update.  
Thousands of organizations installed it automatically.

**Lesson:**  
Trust can be weaponized.

### Log4j (2021)  
A tiny piece of logging software used everywhere had a massive flaw.  
Millions of systems were exposed overnight.

**Lesson:**  
Small tools can create huge risks.

### event-stream (2018)  
A popular JavaScript library was taken over and turned into malware.

**Lesson:**  
Open-source doesn’t mean automatically safe.

### 8–12 Weeks to Detect  
On average, supply chain attacks go unnoticed for **months**.

**Lesson:**  
Detection speed matters more than perfection.

## SBOM Fundamentals

**SBOM = Software Bill of Materials**

It’s a list of:
- What your software contains  
- Where each piece came from  
- Which version you’re using  

**Think of it like:**  
An ingredient label on packaged food.

Why it matters:
- Faster incident response  
- Better compliance  
- Easier audits  
- Stronger trust  

## Use `npm` CLI to Show Vulnerabilities

Even simple tools can help reveal risk.

Example:
```bash
npm audit


<!-- Links -->
[Tim Warner]: https://app.pluralsight.com/profile/author/tim-warner

- [ ] Confirm you can access the **ITS-AppDev-Training** org.
- [ ] Create a **practice repo** in that org.
- [ ] Set your **notification preferences** so you see review requests and @mentions.
- [ ] Optional: install/update the **GitHub CLI** if you use it.