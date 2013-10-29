










CREATE    procedure [dbo].[usp_run_utilization]
	
AS
declare @pd_month as varchar(2)
declare	@pd_year as varchar(4)
declare @newdate as varchar(15)
declare @usedate as datetime
declare @nmonth as varchar(2)

select @pd_month=month(getdate()) -1 
select @nmonth=month(getdate())
select @pd_year= year(getdate())
select @newdate=@nmonth + '/01/' + @pd_year
select @usedate=CONVERT(DATETIME, cast(@newdate as datetime), 102)

if @pd_month = 0
Begin
 set  @pd_month	= 12
 set  @pd_year = @pd_year - 1
End

/*
print @usedate
print @pd_year --year(getdate())
print @pd_month
*/

delete from temp_fulltime_Utilization_after_year
delete from temp_fulltime_Utilization_before_year
delete from temp_Utilization
delete from temp_working_hours
update CRS_tblempl_info set FullTime_Percent=NULL, Refresh_Run_MMYY=NULL, Util_Percent=NULL

declare @st_date as datetime 
select @st_date = CONVERT(DATETIME, cast(@pd_year +'-01-01' as datetime), 102)

declare @i as int
while (@st_date < @usedate)
begin
select @i = cast(DATEPART(WEEKDAY, @st_date) as int)
	if @i > 1 and @i < 7
    begin
		insert into temp_working_hours (WorkDays,No_of_hours) values(@st_date, 8)
	end
 select @st_date = @st_date + 1
end

/* 
By Vamsi on June 15th 09
Before: SUM(ACT_HRS)/((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT,@usedate) + 2) * 5 / 7 * 8) * 100 AS PercentFT 
If the year of DK_LAB.ORIG_HIRE_DT is not same as @pd_year(report data running for the year) then use jan 1st of @pd_year
After : SUM(ACT_HRS)/( select sum(No_Of_Hours) from dbo.temp_working_hours where workdays between case when DK_LAB.ORIG_HIRE_DT < @pd_year + '-01-01' then @pd_year + '-01-01' else DK_LAB.ORIG_HIRE_DT end  and @usedate) * 100 AS PercentFT 
*/
insert into temp_fulltime_Utilization_after_year
SELECT ORA_DKHS.EMPL_ID, 
	--SUM(ACT_HRS), DK_LAB.ORIG_HIRE_DT, 
	--((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT, @usedate) + 2) * 5 / 7 * 8) AS PercentFT1 ,
	SUM(ACT_HRS)/( select sum(No_Of_Hours) from dbo.temp_working_hours where workdays between case when DK_LAB.ORIG_HIRE_DT < @pd_year + '-01-01' then @pd_year + '-01-01' else DK_LAB.ORIG_HIRE_DT end  and @usedate) * 100 AS PercentFT 
	FROM vw_DELTEK_EMPL_HireDate_after_010104 DK_LAB INNER JOIN
	     cpprod..DELTEK.LAB_HS ORA_DKHS ON DK_LAB.EMPL_ID = ORA_DKHS.EMPL_ID
	WHERE 
	((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT, @usedate) + 2) * 5 / 7 * 8 > 0) AND
	((ORA_DKHS.FY_CD = @pd_year) AND (ORA_DKHS.PD_NO <= @pd_month) 
	AND (LEFT(ORA_DKHS.PROJ_ID, 4) <> '1196' AND LEFT(ORA_DKHS.PROJ_ID, 7) <> '1191.06'))
	GROUP BY ORA_DKHS.EMPL_ID, DK_LAB.ORIG_HIRE_DT
	HAVING (ORA_DKHS.EMPL_ID IS NOT NULL)
	ORDER BY 2 DESC


Update CRS_tblempl_info 
	set FullTime_Percent = (select p.PercentFT from temp_fulltime_Utilization_after_year p where p.empl_id=CRS_tblempl_info.empl_id), 
	Refresh_Run_MMYY = @pd_month + '-' + @pd_year 
	where empl_id in (select empl_id from temp_fulltime_Utilization_after_year)

Update CRS_tmpreport_downloaded 
	set FullTime_Percent = (select p.PercentFT from temp_fulltime_Utilization_after_year p where p.empl_id=CRS_tmpreport_downloaded.empl_id) 
	where empl_id in (select empl_id from temp_fulltime_Utilization_after_year)

/*
Update CRS_tmpreport 
	set FullTime_Percent = (select p.PercentFT from temp_fulltime_Utilization_after_year p where p.empl_id=CRS_tmpreport.empl_id) 
	where empl_id in (select empl_id from temp_fulltime_Utilization_after_year)
*/
/*	 
select Refresh_Run_MMYY, FullTime_Percent from CRS_tblempl_info
	where Refresh_Run_MMYY='8-2006'
*/	

insert into temp_fulltime_Utilization_before_year
SELECT ORA_DKHS.EMPL_ID,
    --SUM(ACT_HRS),
    --SUM(ACT_HRS)/ 2080 * 100 as PercentFT 
    SUM(ACT_HRS)/( select sum(No_Of_Hours) from dbo.temp_working_hours where workdays between case when DK_LAB.ORIG_HIRE_DT < @pd_year + '-01-01' then @pd_year + '-01-01' else DK_LAB.ORIG_HIRE_DT end  and @usedate) * 100 AS PercentFT 
    from vw_DELTEK_EMPL_HireDate_before_010204 DK_LAB INNER JOIN
    cpprod..DELTEK.LAB_HS ORA_DKHS ON 
    DK_LAB.EMPL_ID = ORA_DKHS.EMPL_ID 
    WHERE     (ORA_DKHS.FY_CD = @pd_year) AND (ORA_DKHS.PD_NO <= @pd_month) 
    AND (LEFT(ORA_DKHS.PROJ_ID, 4) <> '1196' AND LEFT(ORA_DKHS.PROJ_ID, 7) <> '1191.06')
 --and 	ORA_DKHS.EMPL_ID='1028658' 
    GROUP BY ORA_DKHS.EMPL_ID, DK_LAB.ORIG_HIRE_DT
    HAVING      (ORA_DKHS.EMPL_ID IS NOT NULL)
    ORDER BY 2 DESC

Update CRS_tblempl_info 
	set FullTime_Percent = (select p.PercentFT from temp_fulltime_Utilization_before_year p where p.empl_id=CRS_tblempl_info.empl_id), 
	Refresh_Run_MMYY = @pd_month + '-' + @pd_year 
	where empl_id in (select empl_id from temp_fulltime_Utilization_before_year)
Update CRS_tmpreport_downloaded 
	set FullTime_Percent = (select p.PercentFT from temp_fulltime_Utilization_before_year p where p.empl_id=CRS_tmpreport_downloaded.empl_id) 
	where empl_id in (select empl_id from temp_fulltime_Utilization_before_year)

/*

Update CRS_tmpreport 
	set FullTime_Percent = (select p.PercentFT from temp_fulltime_Utilization_before_year p where p.empl_id=CRS_tmpreport.empl_id) 
	where empl_id in (select empl_id from temp_fulltime_Utilization_before_year)
*/

--select * from CRS_tmpreport

--utilization


insert into temp_Utilization
select  empl_id,
        case when 	sum(case substring(proj_id,1,4)
		when '1191' then 0
		when '1196' then 0
		when '1199' then 0
		else l.act_hrs
		end) = 0
        then 
        sum(case substring(proj_id,1,1)
				when '1' then 0 
				else l.act_hrs
			end)
        else
        sum(case substring(proj_id,1,1)
				when '1' then 0 
				else l.act_hrs
			end) /
	sum(case substring(proj_id,1,4)
		when '1191' then 0
		when '1196' then 0
		when '1199' then 0
		else l.act_hrs
		end) * 100 
        end Util
 from cpprod..DELTEK.LAB_HS l
 where fy_cd = @pd_year
 and pd_no <=@pd_month
--and empl_id = '1001757' 
and act_hrs<>0
 group by empl_id
 having sum(act_hrs) > 0 
	and empl_id is not null

Update CRS_tblempl_info 
	set Util_Percent = (select p.util from temp_Utilization p where p.empl_id=CRS_tblempl_info.empl_id)

/*
Update CRS_tmpreport 
	set Util_Percent = (select p.util from temp_Utilization p where p.empl_id=CRS_tmpreport.empl_id)
*/

Update CRS_tmpreport_downloaded 
	set Util_Percent = (select p.util from temp_Utilization p where p.empl_id=CRS_tmpreport_downloaded.empl_id)


--usp_run_utilization 8, '2006'




















