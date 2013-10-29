-- =============================================
-- Author:		Vanka, Vamsi
-- Create date: Nov 2nd 2009
-- Description:	Westat Salaried Employee Compensation Statement
-- usp_SalEmplCompStatement_EmployeeFilter 1333328
-- =============================================
CREATE PROCEDURE [dbo].[usp_SalEmplCompStatement_EmployeeFilter]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
-- select * from CRS_tmpReport_Downloaded
declare @empl_id as varchar(10)
select min(dbo.CRS_tmpReport_Downloaded.empl_id) as empl_id into test1
	FROM dbo.CRS_tmpReport_Downloaded Left JOIN CRS_tblStaffBonus_Mike ON dbo.CRS_tmpReport_Downloaded.Empl_ID = CRS_tblStaffBonus_Mike.Empl_ID
         INNER JOIN dbo.CRS_tblsal_info_downloaded ON dbo.CRS_tmpReport_Downloaded.Empl_ID = CRS_tblsal_info_downloaded.Empl_ID
	WHERE dbo.CRS_tmpReport_Downloaded.Active=1 and  CRS_tmpReport_Downloaded.empl_id > (select empl_id from test)
	and CRS_tmpReport_Downloaded.empl_id in (select empl_id from zzz_test)
	;

drop table test
select * into test from test1

	SELECT dbo.CRS_tmpReport_Downloaded.*
	, CRS_tblStaffBonus_Mike.BonAmt_Calc
	, CRS_tblStaffBonus_Mike.BonAmt_Override
	, CRS_tblStaffBonus_Mike.Sum_ChgHrs
	, dbo.crs_tmpreport_Downloaded.FName + ' ' + dbo.crs_tmpreport_Downloaded.LName as Empl_Name
	, substring(dbo.CRS_tmpReport_Downloaded.Org,9,1) as OrgLastDigit
	, CRS_tblsal_info_downloaded.Hur_Rate
	--, case when dbo.CRS_tmpReport_Downloaded.Org = '1.21.21.1' then '2' else '1' end as OrgLastDigit
	FROM dbo.CRS_tmpReport_Downloaded Left JOIN CRS_tblStaffBonus_Mike ON dbo.CRS_tmpReport_Downloaded.Empl_ID = CRS_tblStaffBonus_Mike.Empl_ID
         INNER JOIN dbo.CRS_tblsal_info_downloaded ON dbo.CRS_tmpReport_Downloaded.Empl_ID = CRS_tblsal_info_downloaded.Empl_ID
	WHERE dbo.CRS_tmpReport_Downloaded.Active=1 
	and dbo.crs_tmpreport_downloaded.empl_id = ( select empl_id from test1)
	
drop table test1;
End
-- select * from CRS_tmpReport_Downloaded
--select * from test 
-- update test set empl_id = 0
-- select * from zzz_test order by empl_id
-- select * from test1
-- delete from zzz_test where empl_id = 1001061





