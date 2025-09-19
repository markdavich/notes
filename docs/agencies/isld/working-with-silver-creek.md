<table><tr><td style="vertical-align: top;">




</td><td>
<!-- ======================================================================= -->
<!-- Content                                                                 -->
<!--🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟🠟-->




# Moving Forward  
![alt text](sc-its-hand-shake.png)
> This document defines a framework for communicating requirements between **Silver  
> Creek** (SC) and **Office of the Governor Information Technology Services** (ITS).  
> 
> The framework will facilitate the modernization of applications maintained by  
> SC and ITS, while defining the boundaries of interaction between SC, ITS, and  
> **Idaho State Liquor Division** (ISLD).  


- [Moving Forward](#moving-forward)
  - [Defining the Scope](#defining-the-scope)
  - [The Framework](#the-framework)
    - [Parts](#parts)
    - [Overview](#overview)
  - [Data Contracts](#data-contracts)
    - [What Are They?](#what-are-they%3F)
    - [Identifying a Data Contract](#identifying-a-data-contract)
    - [Defining a Data Contract](#defining-a-data-contract)
  - [Responsibilities](#responsibilities)
    - [Provider](#provider)
    - [Recipient](#recipient)
    - [Shared](#shared)
  - [Fulfillment Mechanism](#fulfillment-mechanism)
  - [Commitment](#commitment)
  - [Glossary](#glossary)
    - [Artifacts of Proof](#artifacts-of-proof)
    - [Asynchronous](#asynchronous)
    - [Developer](#developer)
    - [Schema](#schema)
    - [Proof of Receipt](#proof-of-receipt)
    - [Proof of Transmission](#proof-of-transmission)
    - [Provider](#provider-1)
    - [Recipient](#recipient-1)
    - [SLA (Service Level Agreement)](#sla-(service-level-agreement))
    - [Synchronous](#synchronous)

<div style="page-break-after: always;"></div>

## Defining the Scope
<div style="margin-left: 2em;">

The principals discussed in this document relate to the relationship between
- **Silver Creek** Development Team
- **ITS** Development Team
</div>

## The Framework
<div style="margin-left: 2em;">

### Parts
- Developers
- Data Contract
- Responsibilities
- Commitment

### Overview

- Developers
  - Identify Data Contract
    - Identify Responsibilities
      - Commit to Data Contract Maintenance

</div>

## Data Contracts
<div style="margin-left: 2em;">

### What Are They?
<div style="margin-left: 2em;">

> An *expectation*, that a specific data structure will be available for processing.  

- The data structure is created by a [Provider]
- The data structure processed by a [Recipient]  
- A contract can be fulfilled either a [Synchronous] or [Asynchronous] operation
- A contract may require an [Artifact of Proof]
</div>

### Identifying a Data Contract
<div style="margin-left: 2em;">

**Developers** will find places in code where they either
- Provide data
- Receive data

If the data *provided* by one team is *received* by a different team then the  
the data is a contract.

If the data is provided and received by the same team, it will *not* be included  
in this framework as a contract.
</div>

### Defining a Data Contract
<div style="margin-left: 2em;">

A **Data Contract** is defined when the following criteria is met
- The data structure has a named [Schema]
- The [Provider] is identified
- The [Recipient] is identified
- [Responsibilities] are identified
- The lifecycle is identified as being [Synchronous] or [Asynchronous]
- [Artifacts of Proof] are identified
- [Fulfillment Mechanism] is defined
- [Commitments] are established
</div></div>

<div style="page-break-after: always;"></div>

## Responsibilities
<div style="margin-left: 2em;">

### Provider
<div style="margin-left: 2em;">

- **Define and Version the Schema** – Own the outbound data structure and publish  
  versioned schemas. Minor versions must remain backward‑compatible; breaking  
  changes require major version increments and a defined deprecation window.  

- **Maintain Data Integrity** – Guarantee that all published data conforms to the  
  agreed schema, including validation before transmission.  

- **Operate Outbound Mechanism**
  - In a Push model, deliver data to the Recipient endpoint
  - In a Pull model, make data available for retrieval at agreed intervals.

- **Generate Proof of Transmission** – Provide artifacts
  - batch id
  - record counts
  - checksums
  - timestamps  

  for each transfer and retain them for the defined audit window.

- **Publish Schema Artifacts and Notices** – Deliver schema files
  - JSON schema
  - OpenAPI
  - Avro
  - Proto  
  
  and issue notices of change well before rollout.

- **Monitor Transmission Health**
  - Log send failures
  - Implement retries
  - Alert when delivery cannot be completed
</div>

<div style="page-break-after: always;"></div>

### Recipient
<div style="margin-left: 2em;">

- **Operate Receiving Endpoint**
  - In a Push model, maintain the inbound API or queue
  - In a Pull model, implement retrieval jobs.

- **Validate and Acknowledge**
  - Verify payloads against schema, send structured acknowledgments (proof of receipt)  
    with counts, checksums, and timestamps.

- **Handle Errors**
  - Retry or quarantine bad batches
  - Alert stakeholders
  - Escalate persistent failures

- **Participate in Schema Changes**
  - Review proposed updates
  - Co‑approve changes
  - Update consuming systems before deprecation windows close

- **Reconcile and Report**
  - Compare received vs. processed records
  - Issue reconciliation reports
  - Flag discrepancies to the Provider.

- **Monitor Intake Health**
  - Track validation failures, processing lag, and provide visibility to both teams.
</div>

### Shared
<div style="margin-left: 2em">

- **Collaborative Contract Design** – Jointly define data contracts, including
  - Schema
  - Lifecycle
  - Fulfillment mechanism
  - Proofs  
  
- **Governance and change management** – Follow established SC/ITS/ISLD processes  
  for approving changes, documenting updates, and escalating disputes.  

- **Observability** – Share dashboards and metrics (success rates, latency, error   
  counts) for end‑to‑end transparency.

- **Security and compliance** – Ensure data exchange complies with applicable  
  policies, encryption standards, and retention rules.

- **Periodic review** – Meet regularly to evaluate performance, upcoming changes,  
  and governance adherence.
</div></div>

## Fulfillment Mechanism
- Do **Providers** send data to **Recipient** API (Push)
- Do **Recipient** get data from **Providers** from an API (Pull)

<div style="page-break-after: always;"></div>

## Commitment
<div style="margin-left: 2em;">

- **Contract maintenance** – Both sides treat the data contract as a living document.   
  Proposed changes are submitted in writing and approved by both parties.

- **SLAs** – Providers deliver data within agreed timeframes (e.g., within one  
  minute of event creation). Recipients acknowledge within defined windows (e.g.,  
  five minutes). Uptime and throughput targets are published and monitored.

- **Versioning rules** – Minor versions must be backward‑compatible. Major changes  
  require dual‑support during a defined deprecation window (e.g., 60 days).

- **Data quality and proofs** – Both parties validate, reconcile, and maintain proof  
  artifacts for the agreed retention period (e.g., 12 months).

- **Review cadence** – Teams conduct monthly or quarterly contract reviews, producing  
  documented outcomes for leadership visibility.

- **Escalation** – Unresolved issues escalate to the agreed governing body (e.g.,  
  ISLD Data Governance Board) for resolution.

- **Continuous improvement** – Both parties commit to adopting tooling and practices  
  that improve reliability, security, and developer efficiency over time.
</div>

<div style="page-break-after: always;"></div>

## Glossary

### Artifacts of Proof
Evidence documents or data that demonstrate a contract action occurred. Examples  
include manifests, checksums, record counts, and timestamps.

### Asynchronous
A lifecycle where data transfer does not require both systems to be available at  
the same time. Data is queued or stored until the Recipient processes it.

### Developer
A member of the SC or ITS teams responsible for identifying, implementing, and  
maintaining data contracts within their applications.

### Schema
The structured definition of data exchanged in a contract. It specifies field names,  
types, constraints, and expected formats.

### Proof of Receipt
Confirmation generated by the Recipient that data was received and validated. It  
includes metadata such as batch identifiers, timestamps, counts, and checksums.

### Proof of Transmission
Confirmation generated by the Provider that data was sent. It includes metadata  
such as batch identifiers, timestamps, counts, and checksums.

### Provider
The party responsible for producing and transmitting contract data to another party.

### Recipient
The party responsible for receiving and processing contract data produced by the  
Provider.

### SLA (Service Level Agreement)
A formalized set of performance and reliability targets, such as delivery timeframes,  
acknowledgement windows, uptime, and throughput commitments.

### Synchronous
A lifecycle where data transfer requires both systems to be available at the same  
time. The Provider sends data and immediately receives confirmation from the  
Recipient.

<!--🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝🠝-->
<!-- Content                                                                 -->
<!-- ======================================================================= -->
</td></tr></table>

[Artifact of Proof]: #artifacts-of-proof
[Artifacts of Proof]: #artifacts-of-proof
[Asynchronous]: #asynchronous
[Developer]: #developer
[Proof of Receipt]: #proof-of-receipt
[Proof of Transmission]: #proof-of-transmission
[Provider]: #provider
[Recipient]: #recipient
[Schema]: #schema
[Synchronous]: #synchronous

[Fulfillment Mechanism]: #fulfillment-mechanism
[Commitments]: #commitment
[Responsibilities]: #responsibilities













