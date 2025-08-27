# Troubleshooting Reimbursement Batch Process
## August 25th 2025 (Monday)
<div style="margin-left: 2em; padding-left: 1em; border-left: solid 1px">

While troubleshooting to reproduce the "Reimbursement Batch Process" problem,  
it was discovered that the value in database column DateSupervisorApproved  
(AuthorizationRequests table) was left blank for all the juveniles who are not  
being cleared during the batch process.  

However, the DateApproved column in the Reimbursements table IS populated, which  
could be what pulls the records into the result set in the first place.
 
### Observations
It is believed that because the DateSupervisorApproved column is left blank while  
the DateApproved column has a value, the batch does not process for these juveniles,  
because the call to "https://djcwfe.idjc.idaho.gov/COPS_API/reimbursements/batch/start"  
cannot handle the discrepancy. 

The erroneous result is that the BatchNumber column is not populated, and the  
juveniles remain displayed in the "Ready To Be Processed" tab/section.
 
### Questions
Is it part of the normal authorization process for the Supervisor Approval to be  
left blank, and the reimbursement request still be approved for services and  
subsequent payment?

### SQL

<div style="margin-left: 2em;">

| IDJC.Api > Controllers > ReimbursmentsController > StartBatch()     |
| :------------------------------------------------------------------ |
| `https://djcwfe.idjc.idaho.gov/COPS_API/reimbursements/batch/start` |

```sql
use IDJC

SELECT
	AuthorizationRequests.ID,
	AuthorizationRequests.ClientLegalName,
	AuthorizationRequests.IsDeleted,
	AuthorizationRequests.DateSupervisorApproved,
	Reimbursements.DateApproved,
	Reimbursements.Id,
	Reimbursements.BatchNumber,
	Invoices.InvoiceNumber,
	Invoices.InvoiceAmount
FROM
	AuthorizationRequests

	LEFT JOIN Treatments
        ON Treatments.AuthorizationRequestId = AuthorizationRequests.Id

	LEFT JOIN AuthorizationExtensions
        ON AuthorizationExtensions.AuthorizationRequestId = AuthorizationRequests.Id

	LEFT JOIN AuthorizationExtensionTreatments
        ON AuthorizationExtensionTreatments.AuthorizationExtensionId = AuthorizationExtensions.Id

	LEFT JOIN Reimbursements
        ON Reimbursements.AuthorizationRequestId = AuthorizationRequests.Id

	LEFT JOIN Invoices
        ON Invoices.ReimbursementId = Reimbursements.Id

	LEFT JOIN Notes
        ON Notes.AuthorizationRequestId = AuthorizationRequests.Id
WHERE
   -- -------------------------------------------------------------------------------
   -- This WHERE¹ shows us what is in the excel results
   -- -------------------------------------------------------------------------------
	Reimbursements.Id in (38064,40097,38100,40121,40192,41125,41137)
	AND
	ClientLegalName like 'Land%'

   -- -------------------------------------------------------------------------------
   -- This WHERE² shows us what is in the CBAS results that will be processed when
   -- clicking the 'Process AA and Download CSV Export' button
   -- -------------------------------------------------------------------------------
   -- AuthorizationRequests.IsDeleted = 0
   -- AND
   -- AuthorizationRequests.DateSupervisorApproved IS NOT NULL
   -- AND
   -- ClientLegalName like 'LAND%'
   -- AND
   -- EXISTS (
   --    SELECT 1
   --       FROM
   --          Reimbursements
   --       WHERE
   --          AuthorizationRequestId = AuthorizationRequests.Id
   --       AND
   --          BatchNumber IS NULL
   -- )
ORDER BY 2;
```

#### WHERE¹ Results

| ID                                     | ClientLegalName | IsDeleted | DateSupervisorApproved | DateApproved | Id    | BatchNumber | InvoiceNumber | InvoiceAmount |
| :------------------------------------- | :-------------- | :-------- | :--------------------- | :----------- | :---- | :---------- | :------------ | :------------ |
| `C90627C7-A2EE-4BD6-8465-A77CDC83D769` | L.B.            | 0         | NULL                   | 10:58.3      | 38064 | NULL        | 1000000001-01 | 144.04        |
| `C90627C7-A2EE-4BD6-8465-A77CDC83D769` | L.B.            | 0         | NULL                   | 57:43.2      | 40097 | NULL        | 1000000002-01 | 144.04        |
| `C90627C7-A2EE-4BD6-8465-A77CDC83D769` | L.B.            | 0         | NULL                   | 20:20.7      | 40192 | NULL        | 1000000027-01 | 360.1         |
| `C90627C7-A2EE-4BD6-8465-A77CDC83D769` | L.B.            | 0         | NULL                   | 16:58.0      | 41125 | NULL        | 1000000028-01 | 288.08        |
| `C90627C7-A2EE-4BD6-8465-A77CDC83D769` | L.B.            | 0         | NULL                   | 08:38.8      | 41137 | NULL        | 1000000029-01 | 684.19        |
| `B4C0461A-7790-4E9A-BA97-881C72AAAB1A` | L.D.            | 0         | NULL                   | 35:03.8      | 40121 | NULL        | 50017-01      | 180           |
| `B4C0461A-7790-4E9A-BA97-881C72AAAB1A` | L.D.            | 0         | NULL                   | 28:56.5      | 38100 | NULL        | 40016-01      | 90            |

| IDJC.Api > Controllers > ReimbursmentsController > GetReimbursements() |
| :--------------------------------------------------------------------- |
| `https://djcwfe.idjc.idaho.gov/COPS_API/reimbursements`                |

```sql
-- Defaults from GetReimbursements(includeAlreadyProcessed = false, startDate = null, endDate = null)
-- DECLARE @includeAlreadyProcessed bit      = 0;    -- false
-- DECLARE @startDate             datetime2 = NULL;  -- null
-- DECLARE @endDate               datetime2 = NULL;  -- null

SELECT
    Reimbursements.Id,
    Reimbursements.AuthorizationRequestId,
    Reimbursements.DateSubmitted,
    Reimbursements.DateApproved,
    Reimbursements.BatchNumber,
    Invoices.Id AS InvoiceId,
    Invoices.InvoiceNumber,
    Invoices.InvoiceAmount
FROM
    Reimbursements

    LEFT JOIN Invoices
        ON Invoices.ReimbursementId = Reimbursements.Id

    INNER JOIN AuthorizationRequests
        ON
            AuthorizationRequests.Id = Reimbursements.AuthorizationRequestId
            AND
            AuthorizationRequests.IsDeleted = 0
WHERE
    (@includeAlreadyProcessed = 1 OR Reimbursements.BatchNumber IS NULL)
    AND
    (@startDate IS NULL OR Reimbursements.DateSubmitted >= @startDate)
    AND
    (@endDate   IS NULL OR Reimbursements.DateSubmitted <= @endDate)
    AND
    Reimbursements.DateApproved IS NOT NULL
    AND
    Reimbursements.BatchNumber IS NULL;

```

</div>
</div>