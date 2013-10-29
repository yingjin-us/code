




-- usp_paidbenefit_data 2012, 'SEMI', 0
-- usp_paidbenefit_data 2012, 'SPSTRC', 0
-- select * from crs_tbl_Paidbenefit_data
--select * from crs_lkpPaid_leave_benefit_hours
--insert into crs_lkpPaid_leave_benefit_hours values(770,1712,1626,2012,'SEMI')
--insert into crs_lkpPaid_leave_benefit_hours values(777,1728,1641,2012,'SPSTRC')
create            procedure [dbo].[usp_paidbenefit_data]
	@fycd as int, @ts_pd_cd varchar(6), @min_hrs_req as bit
as

declare @min_hrs numeric
declare @max_hrs_95 numeric

set @min_hrs = (select min_hours from crs_lkpPaid_leave_benefit_hours where fy_cd=@fycd and ts_pd_cd=@ts_pd_cd)
set @max_hrs_95 = (select max_hours_95 from crs_lkpPaid_leave_benefit_hours where fy_cd=@fycd and ts_pd_cd=@ts_pd_cd)

if (@min_hrs_req=0)
	set @min_hrs=0
 
truncate table crs_tbl_Paidbenefit_data -- delete the benefit table

if (@ts_pd_cd='SEMI') 
	BEGIN
		--print 'insert ' + @ts_pd_cd
		insert into crs_tbl_Paidbenefit_data
		SELECT e.empl_id, e.orig_hire_dt, l.effect_dt, l.hrly_amt, SUM(entered_hrs) hrs, null, null, null, null
		    FROM 
				cpprod..DELTEK.EMPL e, cpprod..DELTEK.EMPL_LAB_INFO l, cpprod..DELTEK.TS_LN_HS o
		    WHERE 
		        l.lab_grp_type ='HSM' 
		        AND e.s_empl_status_cd ='ACT'
		        AND e.empl_id=l.empl_id
		        AND l.end_dt  ='31-Dec-2078'
		        AND o.empl_id = l.empl_id 
		        --AND o.fy_cd =@fycd
				and l.org_id like '%.2'
				and o.ts_dt BETWEEN '01-Jan-' + cast(@fycd as char(4)) AND '15-Nov-' + cast(@fycd as char(4))  
		        AND left(o.proj_id,4)<> '1196'
		    GROUP BY e.empl_id, l.effect_dt, l.hrly_amt, e.orig_hire_dt
				having sum(entered_hrs)>=@min_hrs -- this will filter our ppl who do not have min hours to begin with
	END
else
	BEGIN
		insert into crs_tbl_Paidbenefit_data
		SELECT e.empl_id, e.orig_hire_dt, l.effect_dt, l.hrly_amt, SUM(entered_hrs) hrs, null, null, null, null
		    FROM 
				cpprod..DELTEK.EMPL e, cpprod..DELTEK.EMPL_LAB_INFO l, cpprod..DELTEK.TS_LN_HS o
		    WHERE 
		        e.lv_pd_cd ='WKLY'
				AND l.s_hrly_sal_cd='H' --if we need to look up paytype
		        AND e.s_empl_status_cd ='ACT'
		        AND e.empl_id=l.empl_id
		        AND l.end_dt  ='31-Dec-2078'
		        AND o.empl_id = l.empl_id 
		        AND o.pay_type <>'OTP'
				and l.org_id in ('1.56.11.2','1.57.11.2') 
				and o.ts_dt BETWEEN '01-Jan-' + cast(@fycd as char(4)) AND '15-Nov-' + cast(@fycd as char(4))  
		        AND left(o.proj_id,4)<> '1196'
		    GROUP BY e.empl_id, l.effect_dt, l.hrly_amt, e.orig_hire_dt
				having sum(entered_hrs)>=@min_hrs -- this will filter our ppl who do not have min hours to begin with
	END

delete from crs_lkpEmployee_hours_years 
	where empl_id in (select empl_id from crs_tbl_Paidbenefit_data)
		and service_year=@fycd

insert into crs_lkpEmployee_hours_years (Empl_id,hours,service_year)
	select empl_id, hrs, @fycd from crs_tbl_Paidbenefit_data

truncate table crs_lkpPaid_leave_benefit_eligibility
insert into crs_lkpPaid_leave_benefit_eligibility -- get the base record in for all employees
	select empl_id, 1, 'A' from crs_tbl_Paidbenefit_data --set all to 1 and cat A


--Now, we need to update yos in the crs_lkpPaid_leave_benefit_eligibility table
--after we update yos, we can update category based on yos
--A-<2 yrs
--B-2/4
--C->5
--select * from crs_lkpPaid_leave_benefit_eligibility where empl_id='1419851'
--select * from crs_lkpPaid_leave_benefit_eligibility
--select * from crs_lkpPaid_leave_benefit_hours

exec usp_Paid_leave_benefit_eligibility_check_2 @fycd, @ts_pd_cd, @min_hrs

/*
select year(doe) ydoe, 
	case when @fycd - year(doe)>=5 then 5
		else @fycd - year(doe) end numofyears, * from crs_tbl_Paidbenefit_data
	where @fycd - year(doe)>=1

select *
from crs_lkpPaid_leave_benefit_eligibility a, crs_lkpPaid_leave_benefit_category b, crs_tbl_Paidbenefit_data c
	where 
		a.category = b.category
		and a.category is not null
		and a.empl_id = c.empl_id and c.empl_id='1001784'

select * from crs_tbl_Paidbenefit_data where empl_id='1001784'
declare @max_hrs_95 int
set @max_hrs_95=1781
*/

update crs_tbl_Paidbenefit_data
	set pd_ben_Hrs = b.Max_ben_hours
from crs_lkpPaid_leave_benefit_eligibility a, crs_lkpPaid_leave_benefit_category b, crs_tbl_Paidbenefit_data c
	where 
		a.category = b.category
		and b.ts_pd_cd=@ts_pd_cd
		and a.category is not null
		and a.empl_id = c.empl_id
		
/*
select * from  crs_tbl_Paidbenefit_data where proration_pt>100 empl_id='1256928'
update crs_tbl_Paidbenefit_data
	set proration_pt = case 
							when hrs >= @max_hrs_95 then 100
							else hrs/@max_hrs_95 * 100 end 
select hrs, 
	ROUND(hrs/1778 * 100, 2), pd_ben_hrs * (proration_pt/100), case 
							when hrs >= 1770 then 100
							else hrs/1770 * 100 end , empl_id from crs_tbl_Paidbenefit_data
	where empl_id in ('1001515', 1295440, 1196627)

select * from crs_lkpPaid_leave_benefit_hours where fy_cd='2009'
*/

/* WHAT THE HELL IS 1770 - Where are you getting this number from? */

update crs_tbl_Paidbenefit_data
	set proration_pt = ROUND(hrs/@max_hrs_95 * 100, 2)
	
--if we need to limit to max 100 then enable this

update crs_tbl_Paidbenefit_data
	set proration_pt = 100
where proration_pt>100

update crs_tbl_Paidbenefit_data
	set Prorated_ben_hrs = pd_ben_hrs * (proration_pt/100)

update crs_tbl_Paidbenefit_data
	set cash_value = Prorated_ben_hrs * hrly_amt  
		where Prorated_ben_hrs is not null

/*

RUN TESTS

select c.*, a.yos, b.*, l.org_id, i.paytype_code
	from crs_lkpPaid_leave_benefit_eligibility a, crs_lkpPaid_leave_benefit_category b, 
			crs_tbl_Paidbenefit_data c, deltek_empl_lab_info l, issql1.wisdom.dbo.idmaster i
	where 
		a.category = b.category
		and a.category is not null
		and a.empl_id=l.empl_id and l.end_dt='31-Dec-2078'
		and a.empl_id=i.idmaster_westatid
		and a.empl_id = c.empl_id

select * from crs_lkpPaid_leave_benefit
select * from crs_lkpPaid_leave_benefit_eligibility 
select * from crs_tbl_Paid_leave_benefit_py_checks where empl_id='1195520'
select * from crs_tbl_Paidbenefit_data
*/











