






CREATE          procedure usp_run_utilization_mgmt_grp
	
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

/*
print @usedate
print @pd_year --year(getdate())
print @pd_month
*/

delete from temp_fulltime_Utilization_after_year
delete from temp_fulltime_Utilization_before_year
delete from temp_Utilization
--update CRS_tblempl_info set FullTime_Percent=NULL, Refresh_Run_MMYY=NULL, Util_Percent=NULL


select * from temp_fulltime_Utilization_after_year t
	inner join vw_Management_Info v on
	v.empl_id=t.empl_id

--select * from vw_Management_Info



insert into temp_fulltime_Utilization_after_year
SELECT ORA_DKHS.EMPL_ID, 
	--SUM(ACT_HRS), DK_LAB.ORIG_HIRE_DT, 
	--((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT, @usedate) + 2) * 5 / 7 * 8) AS PercentFT1 ,
	SUM(ACT_HRS)/((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT,@usedate) + 2) * 5 / 7 * 8) * 100 AS PercentFT 
	FROM vw_DELTEK_EMPL_HireDate_after_010104 DK_LAB INNER JOIN
	     cpprod..DELTEK.LAB_HS ORA_DKHS ON DK_LAB.EMPL_ID = ORA_DKHS.EMPL_ID
	WHERE 
	((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT, @usedate) + 2) * 5 / 7 * 8 > 0) AND
	((ORA_DKHS.FY_CD = @pd_year) AND (ORA_DKHS.PD_NO <= @pd_month) AND (LEFT(ORA_DKHS.PROJ_ID, 4) <> '1196'))
	GROUP BY ORA_DKHS.EMPL_ID, DK_LAB.ORIG_HIRE_DT
	HAVING (ORA_DKHS.EMPL_ID IS NOT NULL)
	ORDER BY SUM(ACT_HRS)/ ((DATEDIFF(d, DK_LAB.ORIG_HIRE_DT, @usedate) + 2) * 5 / 7 * 8) * 100 DESC


insert into temp_fulltime_Utilization_before_year
SELECT ORA_DKHS.EMPL_ID,
    --SUM(ACT_HRS),
    --SUM(ACT_HRS)/ 2080 * 100 as PercentFT 
    SUM(ACT_HRS)/ (select sum(hours) from pay_period_hours where month<=@pd_month) * 100 as PercentFT 
    from vw_DELTEK_EMPL_HireDate_before_010204 DK_LAB INNER JOIN
    cpprod..DELTEK.LAB_HS ORA_DKHS ON 
    DK_LAB.EMPL_ID = ORA_DKHS.EMPL_ID 
    WHERE     (ORA_DKHS.FY_CD = @pd_year) AND (ORA_DKHS.PD_NO <= @pd_month) AND (LEFT(ORA_DKHS.PROJ_ID, 4) <> '1196')
--and 	ORA_DKHS.EMPL_ID='1028658' 
    GROUP BY ORA_DKHS.EMPL_ID, DK_LAB.ORIG_HIRE_DT
    HAVING      (ORA_DKHS.EMPL_ID IS NOT NULL)
    ORDER BY SUM(ORA_DKHS.ACT_HRS) DESC

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


