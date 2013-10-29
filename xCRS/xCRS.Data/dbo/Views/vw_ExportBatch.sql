create  VIEW dbo.vw_ExportBatch
AS
SELECT SSN, EMPL_ID, LAST_NAME AS LNAME, 
    FIRST_NAME AS FNAME, ORG_ID, SU1, SU2, SU3, SU4, 
    Cur_Rate AS RATE, New_Rate AS NHRRATE, 
    Cur_Grade AS GR, GR4 AS NGRADE, BON4 * 1000 AS BON, 
    ROUND(Cur_Sal, - 2) AS OSALARY, 
    New_Sal * 1000 AS NSALARY, SI4 * 1000 AS SALINC, 
    New_Rate - Cur_Rate AS RATEINC, SU1_Name, SU2_Name, 
    SU3_Name, SU4_Name
FROM dbo.vw_R_Empl_Sal_Info
WHERE (New_Sal * 1000 IS NOT NULL)

