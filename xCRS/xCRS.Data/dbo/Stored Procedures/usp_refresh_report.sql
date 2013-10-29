CREATE procedure usp_refresh_report
	@ReviewStatus as int,
	@IsAdmin as bit,
	@ReviewYear as varchar(4),
	@SUEmpl_ID as varchar(12)
As
	Declare @tablename as varchar(25);

	if(@ReviewStatus=2) --closed
		Select @tablename= 'CRS_tmpReport'
	else
		Select @tablename= 'CRS_tmpReport_downloaded'
/*
select * from crs_users
select * from crs..CRS_tmpSalYear1_Uploaded Where Owner_ID='1041303'

*/
