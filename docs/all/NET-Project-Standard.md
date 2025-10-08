---
Author(s): "[Greg Creager], [Tsun Mok], [Mark Davich]"
---
<!-- Use email links for author names (the square braces are required) -->

<!-- ⬇️  REUSABLE ELEMENTS  ⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️ 
╭───────────────────────────────────────────────────────────────────────────────╮
│ ⚡💡🔝 — ▢ ● ⏺ ⏹ ✅ ✔️ ➖ 🔹🔷 ◇ ◆ ✳ ✱ ✳️ *️⃣ ✽ ❉ ⚹ ❌ 🦖 🔖 ⚠️ 🚫│
│ ⁰¹²³⁴⁵⁶⁷⁸⁹ⁱⁿ⁽⁾₀₁₂₃₄₅₆₇₈₉₍₎                                                    │
╰───────────────────────────────────────────────────────────────────────────────╯
◆ Quote Author
> <span style="float: right;">— [Author]</span><br /> 

◆ Indented Section (2, 4, 6, 8 em nesting)
<div style="margin-left: 2em">

</div>

◆ Collapsible Section
<details><summary><code>description</code></summary>

</details>

◆ Warning
> ⚠️ **Warning**  
> 

<!---80-Character-Ruler-------------------------------------------------------->

<!-- ⬆️  REUSABLE ELEMENTS  ⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️ -->

# .NET Project Standard

- [.NET Project Standard](#.net-project-standard)
  - [Definitions](#definitions)
  - [Naming Conventions](#naming-conventions)
  - [Project Structure](#project-structure)
  - [Unit Test Framework](#unit-test-framework)
  - [DevOps Pipeline Standard](#devops-pipeline-standard)

## Definitions
|        Element | Definition                                    |
| -------------: | :-------------------------------------------- |
|    **Project** | A .NET project defined by a `.csproj` file    |
| **Repository** | Git source control repository                 |
|   **Solution** | A .NET Solution as defined by the `.sln` file |

[🔝]

## Naming Conventions
|                 Element | Template                      |
| ----------------------: | :---------------------------- |
|      **MSTest Project** | `[Repository Name]Tests`      |
|    **Pipelines folder** | `pipelines`                   |
| **Project Test Folder** | `[Repository]Tests.[Project]` |
| **Project Domain Test** | `[Domain]Tests.cs`            |

[🔝]

## Project Structure

   ```
   📁 ABC.Repository
   │
   ├──📁 ABC.ProjectOne
   │  ├──#️⃣ ABC.ProjectOne.csproj
   │  ├──#️⃣ DomainA.cs
   │  ├──#️⃣ DomainB.cs
   │  ╰──📄 README.md
   │
   ├──📁 ABC.ProjectTwo
   │  ├──#️⃣ ABC.ProjectOne.csproj
   │  ├──#️⃣ DomainC.cs
   │  ├──#️⃣ DomainD.cs
   │  ╰──📄 README.md
   │
   ├──📁 ABC.RepositoryTests
   │  ├──#️⃣ ABC.RepositoryTests.csproj
   │  ├──⚙️ MSTestSettings.cs
   │  ├──📄 README.md
   │  │  
   │  ├──📁 ABC.RepositoryTests.ProjectOne
   │  │  ├──#️⃣ DomainATests.cs
   │  │  ╰──#️⃣ DomainBTests.cs
   │  │
   │  ╰──📁 ABC.RepositoryTests.ProjectTwo
   │     ├──#️⃣ DomainCTests.cs
   │     ╰──#️⃣ DomainDTests.cs
   │
   ├──📁 pipelines
   ├──📁 .git
   ├──📜 .gitignore
   ├──📄 README.md
   ╰──📦 ABC.Repository.sln
   ```

1. The **solution** file will be located at the root of the repository
2. The **repository** will have a dedicated `README.md` with the following
   - Overview
   - Project list
   - Project diagram
3. Every **project** will have a dedicated folder at the root of the **repository**  
   - The folder will be named the same as the project file
4. Every **repository** will have ***one*** (1) `MSTest` project, located at the  
   root of the repository . The `MSTest` project will named according to the  
   [Naming Convention] defined for **MSTest Project**  
   - Within the `MSTest` project root, there will be a dedicated folder for each  
     project in the repository, this folder will be named according to the    
     [Naming Convention] defined for **Project Test Folder**.  
     - Each project test folder will have one `[TestClass] class` per domain in  
       the project. The `[TestClass] class` will be named according to the   
       [Naming Convention] defined for **Project Domain Test**.
5. Every **project** will have a dedicated `README.md` with the following
   - Overview of behavior
   - Prerequisites
     - Installation notes (if necessary)
   - Architecture diagram
   - Dependent projects
   - Third party libraries
     - Source location
     - Version
     - Documentation location
     - Installation notes (if necessary)
   - How to publish
   - Environments
     - Server (Name, Alias, IP Address, Url, Website Url, Swagger/OpenApi Url)
     - Credential locations
6. Every **repository** will have a `pipelines` folder, this is created by the ***DevOps***  
   team and ***is* tracked** by git


[🔝]

## Unit Test Framework
All test projects will be written in the **MSTest** framework [🔝]

## DevOps Pipeline Standard
The following commands will successfully run at the root of each **project**
```sh
dotnet restore
dotnet build
dotnet test
```
The following commands will successfully run at the root of each **repository**
```sh
dotnet publish
```
[🔝]

<!------------------------------------------------------------------------------
🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗
🔗 Links 🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗
🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗
------------------------------------------------------------------------------->

<!------------------------------------------------------------------------------
📄 Same Page Links 📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄📄
------------------------------------------------------------------------------->
[🔝]: #.net-project-standard
[Naming Convention]: #naming-conventions

<!------------------------------------------------------------------------------
🧱 AppDev Wiki Links 🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱🧱
------------------------------------------------------------------------------->

<!------------------------------------------------------------------------------
🌎 External Links 🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎
------------------------------------------------------------------------------->
[Author]: www.google.com

<!------------------------------------------------------------------------------
📖 Glossary Links 📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖📖
------------------------------------------------------------------------------->

<!------------------------------------------------------------------------------
📬 Email Links 📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬📬
------------------------------------------------------------------------------->
[Alex Harris]: mailto:Alex.Harris@its.idaho.gov
[Bob Cooper]: mailto:Bob.Cooper@its.idaho.gov
[Brigette Teets]: mailto:Brigette.Teets@its.idaho.gov
[Casey Kawamura]: mailto:Casey.Kawamura@its.idaho.gov
[Deepa Iyer]: mailto:deepa.iyer@its.idaho.gov
[Earl Rayne]: mailto:earl.rayne@its.idaho.gov
[Emily Said]: mailto:Emily.Said@its.idaho.gov
[Eric Neely]: mailto:eric.neely@ITS.idaho.gov
[Greg Creager]: mailto:Greg.Creager@its.idaho.gov
[Jacob Hussey]: mailto:Jacob.Hussey@its.idaho.gov
[Jason Masner]: mailto:jason.masner@its.idaho.gov
[Jordan Williford]: mailto:jordan.williford@its.idaho.gov
[Koni Waldron]: mailto:koni.waldron@its.idaho.gov
[Mark Davich]: mailto:Mark.Davich@its.idaho.gov
[Mike Coe]: mailto:Michael.Coe@its.idaho.gov
[Nick Hamilton]: mailto:nick.hamilton@its.idaho.gov
[Robert Butler]: mailto:Robert.Butler@its.idaho.gov
[Ryan Dejean]: mailto:Ryan.Dejean@its.idaho.gov
[Sean Johnson]: mailto:Sean.Johnson@its.idaho.gov
[Swetha Vuyyuru]: mailto:swetha.vuyyuru@its.idaho.gov
[Tom Brown]: mailto:Tom.Brown@its.idaho.gov
[Tsun Mok]: mailto:Tsun.Mok@its.idaho.gov
[Zach Rosenberger]: mailto:Zach.Rosenberger@its.idaho.gov