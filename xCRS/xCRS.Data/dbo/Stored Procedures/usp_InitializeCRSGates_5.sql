






--TODO
--Final Initialization
--usp_InitializeCRSGates_5

CREATE        procedure usp_InitializeCRSGates_5
as
delete from CRS_lkpReportItems where actual_name ='NA'
update dbo.CRS_lkpReportItems
	set AdminOnly=0,
	ShowIndownloadModule=1

update dbo.CRS_lkpReportItems
	set ShowIndownloadModule=0,
	AdminOnly=1
where 
	(actual_name='postcompensation_report.rpt' OR actual_name='SpecialBonus_Report.rpt' or actual_name='PostCompensation_admin_Report.rpt')

update crs_users set DownloadTimeStamp=getdate(), status=0, UploadTimeStamp = NULL




