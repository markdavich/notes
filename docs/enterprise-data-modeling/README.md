# Enterprise Data Modeling
[Pluralsight Course] by Joe Cline

## Overview
- [Enterprise Data Modeling](#enterprise-data-modeling)
  - [Overview](#overview)
  - [Understanding Data Modeling Concepts](#understanding-data-modeling-concepts)
    - [Introduction](#introduction)
    - [Terminology](#terminology)
      - [Model](#model)
      - [Diagram](#diagram)
      - [Model vs Diagram (Not the same thing)](#model-vs-diagram-not-the-same-thing)
      - [Domain](#domain)
        - [Example - The Domain of **One**](#example---the-domain-of-one)
      - [Subject Matter Data Domain](#subject-matter-data-domain)
      - [Transactional Data Type](#transactional-data-type)
      - [Look-Up Data Type](#look-up-data-type)
      - [Master Data Type](#master-data-type)
      - [Metadata](#metadata)
      - [Logical vs Physical](#logical-vs-physical)
      - [Logical Data Type](#logical-data-type)
      - [Physical Data](#physical-data)
      - [Centricity](#centricity)
      - [Cardinality](#cardinality)
      - [Data Model Types](#data-model-types)
  - [Beginning Relational Data Modeling](#beginning-relational-data-modeling)
    - [Introduction](#introduction-1)
    - [The Relational Model Basics](#the-relational-model-basics)
    - [Normal Form Notation](#normal-form-notation)
    - [Why Normalize](#why-normalize)
      - [Unnormalized Form (UNF)](#unnormalized-form-unf)
      - [Normal Forms](#normal-forms)
        - [1NF (First Normal Form)](#1nf-first-normal-form)
      - [2NF (Second Normal Form)](#2nf-second-normal-form)
      - [3NF (Third Normal Form)](#3nf-third-normal-form)
    - [Example](#example)
      - [Data Governance](#data-governance)
      - [Compliance](#compliance)
      - [Data Domains](#data-domains)
    - [Example Modeling to the 1NF, 2NF, and 3NF](#example-modeling-to-the-1nf-2nf-and-3nf)
    - [Summary](#summary)
  - [Beginning NoSQL Modeling](#beginning-nosql-modeling)
    - [Introduction](#introduction-2)
    - [The JSON Document](#the-json-document)
    - [Example](#example-1)
    - [Summary](#summary-1)
  - [Beginning Dimensional Modeling](#beginning-dimensional-modeling)
    - [Introduction](#introduction-3)
    - [OLAP vs OLTP](#olap-vs-oltp)
      - [DSS](#dss)
    - [Dimensional Terms and Concepts](#dimensional-terms-and-concepts)
    - [Key Performance Indicators](#key-performance-indicators)
    - [Example](#example-2)
    - [Summary](#summary-2)
  - [Building a Database from DDL](#building-a-database-from-ddl)
    - [Introduction](#introduction-4)
    - [Example](#example-3)
      - [The Physical Model](#the-physical-model)
      - [DDL](#ddl)
      - [Deploying to a Database Server](#deploying-to-a-database-server)
    - [Summary](#summary-3)
- [Summary](#summary-4)

> This is a beginners course on **Enterprise Data Management**

## Understanding Data Modeling Concepts
### Introduction
[🔝]

### Terminology
#### Model
A way of describing a complex thing, it is a representation of a system

#### Diagram
A two-dimensional visual representation that is often abstracted or symbolic.  

#### Model vs Diagram (Not the same thing)
**Apple** Physical object to be described  
**Apple Model** Might be a list of chemical compounds   
**Apple Diagram** A chart listing a the chemicals in the *model*   

#### Domain
A physical space, an area of expertise, or in **Data Modeling**, a _Domain_ Describes  
the area and boundaries of a data element.

##### Example - The [Domain] of **One**

| Description             | Value      |
| :---------------------- | :--------- |
| Spelled out as a string | `"one"`    |
| Number as a character   | `"1"`      |
| Leading zero as string  | `"01"`     |
| Integer                 | `1`        |
| Decimal                 | `1.00`     |
| Binary of character "1" | `00110001` |

These are all representations of "One". A **Domain** can also be a known, limited  
set of values. For example the _Domain_ of a byte can be express as having values  
ranging from `0` to `255`. When a _Domain_ represents a known set of values, it is  
referred to as a [Reference Domain], i.e., "Lookup Table", "Reference Table"

#### Subject Matter Data Domain
A _Domain_ which defines the boundary of multiple ***related*** domains

#### Transactional Data Type
Or **Business** process is the interaction between two [Master Data Type](#master-data-type)s

#### Look-Up Data Type
Codes, Foreign Key relationships... **Look-Up** data usually has a "Description" field

#### Master Data Type
A source of truth, un-changing, static

#### Metadata
Information about the data, `Data Type`, `Usage`, etc...

#### Logical vs Physical
| Logical                  | Physical                   |
| :----------------------- | :------------------------- |
| Entity                   | Table                      |
| Attribute/Field/Property | Table Column               |
| Entity Relationship      | [Foreign Key] Relationship |
| Row (entity)             | Table Row                  |
| Model                    | Schema, Database           |

We don't model a _Table_, we model an entity

#### Logical Data Type
The description of **Data**, not a container

#### Physical Data
Has measurable/quantifiable properties and exists in reality

#### Centricity
> From the center of a perspective, often added to the end of a noun.  

Modeling happens from a *point of view* or *perspective*, it is very important to  
understand the relativity of the model. **Entity-*Centric***

#### Cardinality
**Data Model Cardinality**, how the uniqueness of an entity defines its relationship  
to the other entities bases on data centricity, e.g., one-to-many, one-to-one, many-to-many.  

**N-to-N** is _cardinality_

#### Data Model Types
- Hierarchial
- Network
- Relations
- Object-Oriented
- Object-Relational
- Document
- Entity-Attribute-Value
- Dimensional
- NoSQL
- Data Warehouse (Dimensional)

[🔝]

## Beginning Relational Data Modeling
### Introduction

[🔝]

### The Relational Model Basics
1970 - E.F. Codd described relational model  

[🔝]

### Normal Form Notation
Data that is separated into atomic entities and relationships
[🔝]

### Why Normalize
Eliminate redundancies, anomalies, minimize storage.  
This makes database engine enforcement possible, like cascading.

#### Unnormalized Form (UNF)
A generic record that can represent different entities based on values or the  
lack thereof. For example each record in a table should represent a single type of  
data, meaning, when you get the record, you know the type. The antithesis of this,  
would be:  
> Having to determine what the record *is* based on an analysis of each column
[🔝]

#### Normal Forms
##### 1NF (First Normal Form)
- Data is organized into rows
- Column values must be the same type, meaning, a column type can't be a `string` in one row and `int` in another.
- Each row has a **Primary Key**
- No repeating groups, an attribute may not contain lists, arrays, delimited data...

#### 2NF (Second Normal Form)
> When I create a model, all the non-key attributes will solely depend on:  
> The key, whole key, and nothing but the key, so help me **Codd**  
> -- Unknown
- Data meets *1NF*
- Every attribute depends on the primary key, essentially, if the primary key is  
  removed, every row in the table will be unique.

#### 3NF (Third Normal Form)
- Data meets *2NF*
- Has **no** *transitive* dependencies, meaning, a non-key attribute may not depend  
  on another non-key attribute. If this is the case the independent non-key attribute  
  should be part of the primary key

### Example
#### Data Governance

[🔝]

#### Compliance
[🔝]

#### Data Domains
[🔝]

### Example Modeling to the 1NF, 2NF, and 3NF
[🔝]

### Summary
[🔝]

## Beginning NoSQL Modeling
### Introduction
[🔝]

### The [JSON] Document
[🔝]

### Example
[🔝]

### Summary
[🔝]

## Beginning Dimensional Modeling
### Introduction
[🔝]

### [OLAP] vs [OLTP]
[🔝]

#### [DSS]
- Data Warehouse
- OLAP Cube
- Data Lake
- [DDM]

### Dimensional Terms and Concepts
[🔝]

### Key Performance Indicators
[🔝]

### Example
[🔝]

### Summary
[🔝]

## Building a Database from DDL
### Introduction
[🔝]

### Example
#### The Physical Model
[🔝]

#### [DDL]
[🔝]

#### Deploying to a Database Server
[🔝]

### Summary
[🔝]

# Summary

<!-- Same Page Links -->
[🔝]: #overview

<!-- Glossary Links -->
[DDL]: ../glossary/README.md#ddl--data-modeling-
[OLTP]: ../glossary/README.md#oltp--data-modeling-
[OLAP]: ../glossary/README.md#olap--data-modeling-
[DSS]: ../glossary/README.md#dss--data-modeling-
[DDM]: ../glossary/README.md#ddm--data-modeling-
[JSON]: ../glossary/README.md#json
[Reference Domain]: ../glossary/#reference-domain--data-modeling-
[Domain]: ../glossary/#domain--data-modeling-
[Foreign Key]: ../glossary/#foreign-key--data-modeling-


[]: ../glossary/#--data-modeling-
[]: ../glossary/#--data-modeling-
[]: ../glossary/#--data-modeling-
[]: ../glossary/#--data-modeling-

<!-- External Links -->
[Pluralsight Course]: https://app.pluralsight.com/ilx/video-courses/enterprise-data-modeling-getting-started