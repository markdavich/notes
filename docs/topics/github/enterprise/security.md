# Foundations of GitHub Enterprise Security

**✨ Pluralsight Course**
> Well, hello there and welcome to Pluralsight. Welcome to this course, Foundations  
> of GitHub Security, and this module entitled Identifying Security Risks in GitHub  
> Repositories. My name's Tim Warner. I am so happy to be your instructor today. In  
> this lesson, we'll start by recognizing the most common and persistent threats in  
> GitHub repositories regardless of their visibility. We'll trace how vulnerabilities  
> enter code. We'll examine behavioral pitfalls that introduce risk in the first place.  
> And lastly, we'll use GitHub native and paid tools to automate enforcement for  
> scalable security. Let's get right to it. Here at Pluralsight, we often use case  
> studies to help transmit knowledge. Globomantics is our fictional company. And one  
> of their software engineers we work with told us very candidly that a dev recently  
> committed an .env file that had some AWS credentials embedded in it. Bad. Now the  
> good news is that their team was already using GitHub Advanced Security, and it  
> flagged it, but the issue there is that nobody was checking alerts. So when billing  
> blew up, it caused some problems, hence the need for Globomantics to tighten up the  
> repos. What is a vulnerability? It's a flaw or weakness that can be exploited, and  
> we're talking software or hardware, exploited by a malicious actor to compromise  
> the security or stability of a system or application, hardware, firmware, software.

**🏵️ Module 1**

## Terms
### IT Ops
### Shift Left
### Dependency Scanning
### Secret Scanning
### Infrastructure as Code (IaC)
### EPSS
### AppSec

## Three Common GitHub Repository Threats
### Secrets in Code
### Dependency Vulnerabilities
### Privilege Misconfiguration

## `.github` Folder

## Configure Dependabot
What are the settings to configure Dependabot for security concerns?

## Why GitHub Security Matters for IT Ops Teams
## How Vulnerabilities Happen
### Source Code Issues
### Config Issues
### Transitive Dependencies

## Bad Habits, Big Risks
### Insecure Coding Practices
### Committing Before Scanning
### Skipping Code Reviews or Pull Requests
### Sharing Credentials

## Stick to Patterns, Avoid Anti-Patterns
What can we do in Github to avoid bad habits and risks?

## Secure by Automation
### Pre-Commit Hooks
### GHAS for code/secrets/dependency scanning
### Status Checks Before Merges

## Dependabot Alerts
### Pull Requests

## Summary

**Module 2**
## 🏵️ Securing Repositories with Built-In GitHub Protections
Why they matter?

### Force Push
### Code is Infrastructure
### Security Starts at Commit
### Supply Chain Security 

### Three Pillars of Secure Repositories
#### Branch Protection Rules
#### Dependency Awareness
#### Secret and Code Scanning

### Repository Hardening
#### Branch Protection
#### Disable Force Push
#### Add `SECURITY.md` to Trigger Security Overview
#### Enable Dependabot (Big 3)
#### Enable Code Scanning (Big 3)
#### Enable Secret Scanning (Big 3)

### Code Security vs Secret Protection
What are these and why do they matter?

### Strategy
#### Enterprise-Wide Policies
#### CodeQL
#### Roll Out Push Protections
#### Standardize Workflows via Actions Templates
#### Monitor Security Overviews at Weekly Intervals

### GitHub API `.yaml`
What are these and why do they matter?

### Pre-Enabled CodeQL (Repo Template)
#### Shift Left with CodeQL
#### Customize CodeQL Workflows
and more...

### Branch Protection (Big 3)
#### Rulesets
#### Targeting
#### Branch Rules

### VS Code Extensions (Official)

### Code Scanning in GitHub Advanced Security

### Secret Scanning in GitHub Advanced Security

**Module 3**
## 🏵️ Understanding and Using GitHub Advanced Security



**Module 4**
## 🏵️ Preparing and Hardening Repositories Using GitHub Advanced Security

---
💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠
---

## ✨ Recognize the Risks of Leaked Secrets

---
💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠💠
---

## ✨ Recognize the Risks of Software Supply Chain Attacks