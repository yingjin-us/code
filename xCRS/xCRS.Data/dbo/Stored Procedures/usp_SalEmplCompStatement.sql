-- =============================================
-- Author:		Vanka, Vamsi
-- Create date: Nov 2nd 2009
-- Description:	Westat Salaried Employee Compensation Statement
-- =============================================
CREATE PROCEDURE [dbo].[usp_SalEmplCompStatement]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
-- select * from CRS_tmpReport_Downloaded


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
Order By substring(CRS_tmpReport_Downloaded.su1_Name,3, 20), Cur_Sal Desc
End
-- select * from CRS_tmpReport_Downloaded






