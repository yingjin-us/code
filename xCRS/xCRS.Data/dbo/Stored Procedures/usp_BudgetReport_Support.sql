




CREATE   procedure [dbo].[usp_BudgetReport_Support]
as
SELECT  b.*,
	(select a.bon_amt
		from CRS_tblBon_Info_Downloaded a where a.empl_id=b.empl_id
		and a.bon_type='BSA') AS AwardBonus,
	(select c.allstaffbonus
		from crs_lkpallstaffbonus c where c.empl_id=b.empl_id
		) AS AllStaffBonus
FROM         dbo.CRS_tmpReport_Downloaded b, dbo.crs_tblempl_info e
where b.empl_id = e.empl_id and e.fldReviewProcess = 'Supp-Exempt'



