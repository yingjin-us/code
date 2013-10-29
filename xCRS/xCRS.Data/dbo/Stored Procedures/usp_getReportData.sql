CREATE    procedure usp_getReportData 
	@ProjID as varchar(10)
as
select dbo.vw_R_projTeam.*, crs_tmpreport.* from
	dbo.vw_R_projTeam RIGHT OUTER JOIN
                      dbo.crs_tmpreport ON dbo.vw_R_projTeam.Empl_ID = dbo.crs_tmpreport.Empl_ID
where dbo.vw_R_projTeam.proj_id = @ProjID order by cur_sal desc
