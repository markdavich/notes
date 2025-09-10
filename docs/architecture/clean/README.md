# Clean Architecture (Onion)

## The Onion
```mermaid

graph TD
  subgraph API["Presentation Layer"]
    A1["ASP.NET Core MVC\nControllers / Middleware / DTOs"]
  end

  subgraph APP[Application Layer]
    B1["Commands / Queries (CQRS)"]
    B2["Handlers / Use Cases"]
    B3["Validators (FluentValidation)"]
    B4["Result / Error Handling"]
    B5["IOrderRepository, IUnitOfWork (interfaces)"]
  end

  subgraph DOMAIN[Domain Layer]
    C1["Aggregates / Entities"]
    C2["Value Objects"]
    C3["Domain Services / Events"]
  end

  subgraph INFRA["Infrastructure Layer"]
    D1["EF Core DbContext\n(Unit of Work)"]
    D2["Repositories (EF Core impl)"]
    D3["Entity Configurations (Data Mapper)"]
    D4["External Adapters\nHTTP / Queue / SMTP"]
    D5["SQL Server / Postgres"]
  end

  %% DI flows
  A1 -->|"[DI] Calls"| B2
  B2 -->|"[DI] Uses"| B5
  B2 --> C1
  B3 --> B2
  B5 -->|"[DI] Impl"| D2
  D2 --> D1
  D1 --> D3
  D1 --> D5
  D4 -.-> B2

```

## The Sequence
```mermaid
sequenceDiagram
    autonumber
    participant Client
    participant API as API (Controller)
    participant APP as Application (Handler)
    participant DOM as Domain (Aggregate)
    participant INF as Infrastructure (Repo/UoW)
    participant DB as Database

    Client->>API: POST /api/orders {json}
    Note over API: Model binding -> Request DTO
    API->>API: Map DTO -> Command (Adapter)
    API->>APP: Handle(command, ct)  [DI]

    APP->>APP: Validate (FluentValidation)
    APP->>INF: IOrderRepository.GetDraft...  [DI]
    INF->>INF: OrderRepository (EF Core)
    INF->>DB: SELECT ... JOIN ...
    DB-->>INF: Rows
    INF-->>APP: Aggregate (Order)

    APP->>DOM: Order.AddItem(...) / Place()
    DOM-->>APP: Invariants enforced (DDD)

    APP->>INF: IOrderRepository.Add(order)  [DI]
    APP->>INF: IUnitOfWork.SaveChangesAsync()  [DI]
    INF->>DB: INSERT Orders, OrderItems
    DB-->>INF: ok
    INF-->>APP: committed

    APP-->>API: Result<OrderDto>
    API-->>Client: 201 Created + {OrderDto}

```

## The Process
First thing, pick an architecture
- Repository (with Service layer [For business logic])
- Clean Architecture
- [Your Architecture Here]

Having an architecture will provide simple locations where code can be extracted

> - Create a `C#` representation of the database in the `Domain` layer (Or an   
>   agency domain package like `Abc.Domain.Models`).
> - Create an **EF Core *Migrations** project, perform initial migration (If using  
>   *Code First* approach)
> - Identify database operations and move them to correct layer
> - Choose how database operations will be performed, **Dapper**, **EF Core**???

### 1. Scaffold Database Into Models

### 2. Identify Database Operations
- Create a **Controller** in the `Presentation` (API) layer for the table, if  
  needed, or if it is an aggregated query, create an appropriate controller like,  
  `AuditReportsController`
- Move SQL to `Infrastructure` layer
- Move **Agency Wide** business rules/logic to the domain layer (or package like  
  `Abc.Domain.BusinessRules`)
- Create `Application` layer objects for the request
  - Business rules
  - Handler for the request
  - 

Each database operation will happen in a `ASP.NET Core WebAPI` call  