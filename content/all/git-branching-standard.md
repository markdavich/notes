- [Policy](#policy)
- [Standard](#standard)
  - [Overview](#overview)
  - [Application Environments](#application-environments)
    - [Production](#production)
    - [Staging (UAT)](#staging-(uat))
    - [Development](#development)
  - [Permanent Branches](#permanent-branches)
    - [`stage`](#%60stage%60)
    - [`main`](#%60main%60)
  - [Working Branches](#working-branches)
    - [feature](#feature)
    - [hotfix](#hotfix)
- [Exceptions](#exceptions)

# Policy

ITS will properly manage all application code.

# Standard

A standardized process is used by all developers to maintain work in source control  
that integrates into CI/CD.

## Overview
Azure DevOps (ADO) is the source of truth for all code. Developers work primarily  
within a `feature` branch on their computer. Each `feature` branch (i.e. a Story  
or a Feature) starts from the branch you will be targeting for a merge (i.e `stage`  
for regular work, `main` for hotfixes). Developers frequently push their work back  
to ADO, and create a pull request (PR) to review changes and deploy to environments.  
This process has many benefits:

- Regularly tests new code against the CI pipeline.
- Reduces the complexity of merge conflicts.
- Allows all developers access to the new code.
- Saves work in case of hard drive failure.
- Peer reviews help all developers learn and improve.

## Application Environments
### Production
Deployments are ONLY available through the CI pipeline and are triggered by  
successful builds in the `main` branch. To accommodate deploying during a specified  
change window, an approval from one (or more) sources is required. For example,  
you can include a required approval from a stakeholder in the days leading up to  
the change window, and the second approval by the developer during the change window. 

### Staging (UAT)
Deployments are ONLY available through the CI pipeline and are triggered by  
successful builds in the `stage` branch.  

### Development

Deployments are done directly from your `feature` branch, allowing you  
to deploy and verify your changes in the Development Environment. This creates a  
disposable environment, where deployments are frequently replaced by updates from  
other developers.


<div style="margin-left: 2em; color: teal; padding: 0.75em; border: solid teal 2px;">

**Current Deployment Methods to the Development Environment**

We are testing different solutions during our pilot for the Development branch  
process. We have several options to test, and this section is subject to change.

The following options are the potential ways to deploy your `feature` branch to the  
Development Environment. Exercise good communication to ensure other developers  
are not actively using the Development Environment. For solutions using pipelines,  
you can easily redeploy your `feature` build if someone overwrites the environment.
    
1. Manual pipeline  
    a. Manual pipeline build with an automated deployment to the Development Environment  
    b. Manual pipeline build with a manual deployment to the Development Environment  

2. PR pipeline, triggered by the creation of a PR to the `stage` branch  
    a. Automated PR pipeline with manual release  
    b. Automated PR pipeline with an automated release  

3. Manual deployment from the developer's local computer using script, Visual Studio,  
   or FTP.
</div>

## Permanent Branches

|    Name |  Environment   | Pull Requests From | Default |
| ------: | :------------: | :----------------- | :-----: |
|  `main` | **Production** | `stage`, `hotfix`  |    ❌    |
| `stage` |  **Staging**   | `feature`, `main`  |    ✅    |

Two permanent branches exist for every repository: `main` and `stage`. The branches  
for `main` and `stage` are each set up with automated CI pipelines to build, test,  
and deploy to their respective environments on every branch commit. 

Changes are only permitted to these branches using the PR process. PRs require a  
work item to be linked, the PR CI to pass, and approval from a reviewer. 

### `stage`
This branch contains pre-release code that is going through User Acceptance Testing  
(UAT) in the Staging Environment and is only merged with tested code from the  
developer's working branch (individual `feature` branch or shared `feature` branch).

Once the code from your working branch is ready for UAT, create a PR to the `stage`  
branch from your working branch and add reviewers. The PR pipeline creates a build  
artifact and runs automated tests before the PR is allowed to merge into the branch. 
> Note: If the branch does not build or tests do not pass, you cannot merge.

Immediately after your working branch is successfully merged into the `stage` branch,  
the CI pipeline executes. If all checks pass, your code is deployed to the Staging  
Environment and is tagged with the build number for reference.

### `main`
This branch contains the latest production code at all times and is only merged  
with code that has undergone user acceptance in the Staging Environment (i.e. `stage`  
OR `hotfix`). The deployment process is triggered automatically, but has a manual  
approval to accommodate deploying during a specified change window.

Once a stakeholder has tested and accepted the changes in the Staging Environment,  
create a PR to the `main` branch from your `stage` or `hotfix` branch. The PR  
pipeline creates a build artifact and runs automated tests before the PR is allowed  
to merge into the branch.

When your code is deployed to the Production Environment, it is tagged with the  
build number for reference.

## Working Branches
|      Name | Branches From | May Merge Into | Naming Convention           |
| --------: | :-----------: | :------------: | :-------------------------- |
| `feature` |    `stage`    |    `stage`     | `feature-[feature_purpose]` |
|  `hotfix` |    `main`     |     `main`     | `hotfix-[bug_description]`  |


To get started, determine if you are working on a feature or a hotfix. For a  
`feature`, branch from `stage`. For a `hotfix`, branch from `main`.

### feature
This branch includes work targeted for a future release. Frequently save your work  
to ADO by performing a `git push`.

<div style="margin-left: 2em; color: teal; padding: 0.75em; border: solid teal 2px;">

**Shared feature branches**

Sometimes multiple developers are involved in implementing a large Feature that is  
dependent on another developer's changes. In these rare cases, create a shared  
`feature` branch, and each developer branches from and merges into that shared  
branch. When the feature is ready for UAT, create a PR from the shared `feature`  
branch to the `stage` branch.

</div>

### hotfix
In order to maintain our policy that the `stage` branch should contain all changes  
published to the `main` branch, hotfixes will need two (2) PRs: one to the `main`  
branch to publish the change to the Production Environment and one to the `stage`  
branch to resync the changes in the Staging Environment.

1. When a bug in the Production Environment must be fixed and cannot wait for the  
   next release cycle, create a `hotfix` branch from the `main` branch. Fix the  
   bug in this `hotfix` branch, and then deploy the `hotfix` branch to the Staging  
   Environment for UAT. Upon approval, merge the `hotfix` branch into the `main`  
   branch which deploys the fix to the Production Environment.
2. Create a second PR from the `main` branch to the `stage` branch, and then merge  
   the changes to ensure that the Staging Environment contains ALL changes that  
   are available in the Production Environment.

# Exceptions

With proper management approval and under very specific circumstances, exceptions  
to this standard may be permitted.