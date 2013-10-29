


--select * from vw_Import_NewAndRehireEmployees_Report
CREATE   VIEW [dbo].[vw_Import_NewAndRehireEmployees_Report]
AS

/*
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.SSN_ID, dbo.IDMaster.IDMaster_LastName, dbo.IDMaster.IDMaster_FirstName, 
                      dbo.IDMaster.Grade_Code, dbo.IDMaster.IDMaster_DOE, dbo.IDMaster.IDMaster_DOPE, dbo.IDMaster.IDMaster_DOR, dbo.IDMaster.IDMaster_DOT, 
                      dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT, ROUND(dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000 + 0.0049, 1) AS ANNL_AMT, 
                      dbo.DELTEK_EMPL_LAB_INFO.ORG_ID AS ORG_ID
FROM         dbo.DELTEK_EMPL RIGHT OUTER JOIN
                      dbo.IDMaster ON dbo.DELTEK_EMPL.EMPL_ID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID
WHERE     (dbo.DELTEK_EMPL.EMPL_ID NOT IN
                          (SELECT     Empl_ID
                            FROM          CRS_tblEmpl_Info)) AND (dbo.DELTEK_EMPL.TS_PD_CD = 'FLD') AND (dbo.IDMaster.OrgType_Code < '58') AND 
                      (dbo.IDMaster.StaffType_Code = 'EE') AND (dbo.DELTEK_EMPL_LAB_INFO.END_DT = CONVERT(DATETIME, '2078-12-31 00:00:00', 102)) AND 
                      (dbo.IDMaster.IDMasterStatus_Code = 'A') OR
                      (dbo.DELTEK_EMPL.EMPL_ID NOT IN
                          (SELECT     Empl_ID
                            FROM          CRS_tblEmpl_Info)) AND (dbo.DELTEK_EMPL.TS_PD_CD = 'SEMI') AND (dbo.IDMaster.StaffType_Code = 'EE') AND 
                      (dbo.DELTEK_EMPL_LAB_INFO.END_DT = CONVERT(DATETIME, '2078-12-31 00:00:00', 102)) AND (dbo.IDMaster.IDMasterStatus_Code = 'A')

*/

SELECT     dbo.DELTEK_EMPL_LAB_INFO.ORG_ID AS ORG_ID, dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.SSN_ID, dbo.IDMaster.IDMaster_LastName, dbo.IDMaster.IDMaster_FirstName, 
                      dbo.IDMaster.Grade_Code, dbo.IDMaster.IDMaster_DOE, dbo.IDMaster.IDMaster_DOPE, dbo.IDMaster.IDMaster_DOR, dbo.IDMaster.IDMaster_DOT, 
		CONVERT(decimal(10,2), dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT, 101) HRLY_AMT,
		--ROUND(dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000 + 0.049, 1) AS ANNL_AMT, 
		--According to Sarah we don't need to round the salary.
		ROUND(dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000, 1) AS ANNL_AMT,
		-1 Select_for_Import
		, (select top 1 grade_step from crs_tblsal_info where empl_id = cast(dbo.IDMaster.IDMaster_WestatID as nvarchar(7)) order by Effect_dt desc) as Grade_Step
FROM         dbo.DELTEK_EMPL RIGHT OUTER JOIN dbo.IDMaster ON dbo.DELTEK_EMPL.EMPL_ID = dbo.IDMaster.IDMaster_WestatID 
                             LEFT OUTER JOIN dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID
WHERE     (dbo.DELTEK_EMPL.EMPL_ID NOT IN
                          (SELECT     Empl_ID
                            FROM          CRS_tblEmpl_Info)) AND (dbo.DELTEK_EMPL.TS_PD_CD = 'FLD') 
						AND (dbo.IDMaster.OrgType_Code < '58') 
						AND (dbo.IDMaster.IDMaster_DOT IS NULL) 
						--AND  dbo.IDMaster.IDMaster_DOR IS NULL) 
						AND 
						(dbo.IDMaster.StaffType_Code = 'EE') 
						AND (dbo.DELTEK_EMPL_LAB_INFO.END_DT = CONVERT(DATETIME, '2078-12-31 00:00:00', 102)) 
						AND (dbo.IDMaster.IDMasterStatus_Code = 'A') OR
                      (dbo.DELTEK_EMPL.EMPL_ID NOT IN
                          (SELECT     Empl_ID
                            FROM          CRS_tblEmpl_Info)) AND (dbo.DELTEK_EMPL.TS_PD_CD = 'SEMI') 
AND (dbo.IDMaster.IDMaster_DOT IS NULL) 
					--AND (dbo.IDMaster.IDMaster_DOR IS NULL) 
					AND (dbo.IDMaster.StaffType_Code = 'EE') AND 
                      (dbo.DELTEK_EMPL_LAB_INFO.END_DT = CONVERT(DATETIME, '2078-12-31 00:00:00', 102)) AND (dbo.IDMaster.IDMasterStatus_Code = 'A')


UNION




SELECT     dbo.DELTEK_EMPL_LAB_INFO.ORG_ID AS ORG_ID, dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.SSN_ID, dbo.IDMaster.IDMaster_LastName, dbo.IDMaster.IDMaster_FirstName, 
                      dbo.IDMaster.Grade_Code, dbo.IDMaster.IDMaster_DOE, dbo.IDMaster.IDMaster_DOPE, dbo.IDMaster.IDMaster_DOR, dbo.IDMaster.IDMaster_DOT, 
                      dbo.DELTEK_EMPL_LAB_INFO.HRLY_AMT, ROUND(dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT / 1000 + 0.049, 1) AS ANNL_AMT, 0 Select_for_Import
                      , (select top 1 grade_step from crs_tblsal_info where empl_id = cast(dbo.IDMaster.IDMaster_WestatID as nvarchar(7)) order by Effect_dt desc) as Grade_Step
FROM         dbo.DELTEK_EMPL RIGHT OUTER JOIN
                      dbo.IDMaster ON dbo.DELTEK_EMPL.EMPL_ID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID
WHERE     

		 	(dbo.DELTEK_EMPL.TS_PD_CD = 'FLD') AND (dbo.IDMaster.OrgType_Code < '58') 
				AND (dbo.IDMaster.IDMaster_DOR IS NOT NULL) 
		AND 
                      (dbo.IDMaster.StaffType_Code = 'EE') AND (dbo.IDMaster.IDMaster_DOT IS NULL) AND 
                      (dbo.DELTEK_EMPL_LAB_INFO.END_DT = CONVERT(DATETIME, '2078-12-31 00:00:00', 102)) AND 
((dbo.DELTEK_EMPL.EMPL_ID IN  (SELECT     Empl_ID    FROM          CRS_tblEmpl_Info where ACTIVE=0))) AND (dbo.IDMaster.IDMasterStatus_Code = 'A') 

OR
                      (dbo.DELTEK_EMPL.TS_PD_CD = 'SEMI') AND (dbo.IDMaster.IDMaster_DOR IS NOT NULL) AND (dbo.IDMaster.StaffType_Code = 'EE') AND 
                      (dbo.IDMaster.IDMaster_DOT IS NULL) AND (dbo.DELTEK_EMPL_LAB_INFO.END_DT = CONVERT(DATETIME, '2078-12-31 00:00:00', 102)) AND 
                      ((dbo.DELTEK_EMPL.EMPL_ID IN
                          (SELECT     Empl_ID
                            FROM          CRS_tblEmpl_Info where ACTIVE=0))) AND (dbo.IDMaster.IDMasterStatus_Code = 'A')








