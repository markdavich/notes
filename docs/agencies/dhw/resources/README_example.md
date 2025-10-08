# Introduction 
TARS is a time tracking system used by the ITSD division at IDHW.  This allows people to track users time to projects and tasks while also tying Luma project codes to each of those projects.

# Environments:
---

##  **DEVL**
    Server(s): DHWNETWEBD1
    IIS Apppool Account: ApplicationPoolIdentity
    URL: https://tarsdev.dhw.state.id.us/

    Database: SQLDEVL4.HWIT_DB_TARS_DEVL
    DB Account: tarsapp  (non-gmsa)
        
    CAWA Jobs: n/a
    Used Network Paths: n/a
    SQL Server Jobs: HWIT_TARS_PROD Stored Procs – Mondays at 6am    
        - SQLDVLPL1_TARS-usp_AD_Update – Hourly from 6am-5:59pm
        - SQLDVLPL1_TARS-usp_LockTimeSheets & usp_ProjectActivityTaskCleanup – Daily @ 11pm
        - SQLDVLPL1_TARS-usp_PCACode_ExpireNotice – Daily @ 6am
        - SQLDVLPL1_TARS-usp_Send_xp_SendMail – Every 5 minutes
        - SQLDVLPL1_TARS-usp_SubmitTimeSheetWarning – Daily @ 7am
        - SQLDVLPL1_TAR-usp_TimeSheetApprovalWarning – Daily @ 8:30am

##  **QUAL**
    Server(s): DHWNETWEBQ1
    IIS Apppool Account: ApplicationPoolIdentity
    URL: https://tarsqual.dhw.state.id.us/

    Database: SQLDEVL4.HWIT_DB_TARS_QUAL
    DB Account: tarsapp  (non-gmsa)
        
    CAWA Jobs: n/a
    Used Network Paths: n/a 
    SQL Server Jobs: HWIT_TARS_PROD Stored Procs – Mondays at 6am    
        - SQLQUALL1_TARS-usp_AD_Update – Hourly from 6am-5:59pm
        - SQLQUALL1_TARS-usp_LockTimeSheets & usp_ProjectActivityTaskCleanup – Daily @ 11pm
        - SQLQUALL1_TARS-usp_PCACode_ExpireNotice – Daily @ 6am
        - SQLQUALL1_TARS-usp_Send_xp_SendMail – Every 5 minutes
        - SQLQUALL1_TARS-usp_SubmitTimeSheetWarning – Daily @ 7am
        - SQLQUALL1_TAR-usp_TimeSheetApprovalWarning – Daily @ 8:30am 

##  **PROD** 
    Server(s): DHWNETWEB1
    IIS Apppool Account: ApplicationPoolIdentity
    URL: https://tars.dhw.state.id.us/

    Database: SQLPRODL1.HWIT_DB_TARS_PROD
    DB Account: tarsapp  (non-gmsa)
        
    CAWA Jobs: n/a
    Used Network Paths: n/a
    SQL Server Jobs:HWIT_TARS_PROD Stored Procs – Mondays at 6am    
        - SQLPRODL1_TARS-usp_AD_Update – Hourly from 6am-5:59pm
        - SQLPRODL1_TARS-usp_LockTimeSheets & usp_ProjectActivityTaskCleanup – Daily @ 11pm
        - SQLPRODL1_TARS-usp_PCACode_ExpireNotice – Daily @ 6am
        - SQLPRODL1_TARS-usp_Send_xp_SendMail – Every 5 minutes
        - SQLPRODL1_TARS-usp_SubmitTimeSheetWarning – Daily @ 7am
        - SQLPRODL1_TAR-usp_TimeSheetApprovalWarning – Daily @ 8:30am

---

#Security/Access
TARS uses SSO utilizing AD credentials.  These are utilized for all 3 environments.
- TARS user
- TARS Manager
- TARS Administrator
- TARS Budget Analyst

#Linked Documents/sharepoint

#Common issues:
1.	User says that they can't enter time because the cells are greyed out.
    - This is usually caused because the Luma Code(PCA) has expired and either the assignment to the project needs to be updated or the actually luma code needs to be updated (or both).
2.	Duplicate tasks show up in the list.
    - This happens only 1 or 2 times a year and there is no known caused
    - Just have the user delete all the duplicate tasks on their time sheet
    - NOTE: if they view forward(look at a future time sheet) it will continue to copy the duplicates

# Build and Test
A single pipeline has been built to deploy code based on which branch it is checked into.<More details to come> 
