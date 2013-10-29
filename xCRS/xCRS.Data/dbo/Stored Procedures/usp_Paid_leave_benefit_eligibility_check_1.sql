



/* This is a supporting Quering used by usp_paidbenefit_data */

CREATE         procedure usp_Paid_leave_benefit_eligibility_check_1
		@fycd as int, @ts_pd_cd varchar(6), @MinQaulifyingHours numeric
as
Declare @numofyears	int
Declare @EmplID	varchar(15)
DECLARE @count INT
Declare @cat int
Declare @category char(1)
Declare @MaxPastYears int
--Declare @MinQaulifyingHours int

	truncate table crs_tbl_Paid_leave_benefit_py_checks
	set @MaxPastYears=5
	--set @MinQaulifyingHours=1000

	DECLARE getYOS CURSOR 
	FOR
		select @fycd - year(doe) as ydoe, empl_id 
				from crs_tbl_Paidbenefit_data a	where @fycd - year(doe)>=0 --and empl_id='1053068'
	OPEN getYOS
		FETCH NEXT FROM getYOS
		into @numofyears, @EmplID
		WHILE @@FETCH_STATUS = 0
			BEGIN
				Insert into crs_tbl_Paid_leave_benefit_py_checks(Empl_ID, fy_cd, hours, IsEligible )
				select @EmplID , service_year, sum(hours),
					case when sum(hours)>=@MinQaulifyingHours then 1 else 0 end iselig 
					from crs_lkpEmployee_hours_years	
						where empl_id=@EmplID  group by service_year
				set @cat = (select count(*) cat from crs_tbl_Paid_leave_benefit_py_checks where iseligible=1 and empl_id= @EmplID)
				if(@cat>0)
					BEGIN
						if (@ts_pd_cd = 'SEMI')
							update crs_lkpPaid_leave_benefit_eligibility -- assign category and years of service
								set yos=@cat, 
									category= case 
										when @cat > 4 then 'C'
										when @cat between 2 and 4 then 'B'
										when @cat <2 then 'A'
										end 
									where empl_id=@EmplID	
						else
							update crs_lkpPaid_leave_benefit_eligibility -- assign category and years of service
								set yos=@cat, 
									category= case 
										when @cat > 9 then 'D'
										when @cat between 4 and 9 then 'C'
										when @cat between 2 and 3 then 'B'
										when @cat <2 then 'A'
										end 
									where empl_id=@EmplID					
					end
			FETCH NEXT FROM getYOS
				into @numofyears, @EmplID
		END
	CLOSE getYOS
	DEALLOCATE getYOS


	
/*
1053068
1195520
select sum(act_hrs) from cpprod..DELTEK.LAB_HS
	where empl_id='1001784' and fy_cd='2007'
select @EmplID, fy_cd, sum(act_hrs) from cpprod..DELTEK.LAB_HS	where fy_cd ='+ @fycd - @count + 'group by fy_cd
select 1001784, fy_cd, sum(act_hrs) from cpprod..DELTEK.LAB_HS	where fy_cd =2005 and empl_id='1001784' group by fy_cd
truncate table crs_tbl_Paid_leave_benefit_py_checks
select * from crs_tbl_Paid_leave_benefit_py_checks
select count(*) cat, empl_id from crs_tbl_Paid_leave_benefit_py_checks
		where iseligible=1 group by empl_id
select * from crs_tbl_Paid_leave_benefit_py_checks
select * from crs_lkpPaid_leave_benefit_eligibility

select   fy_cd, sum(act_hrs),
	case when sum(act_hrs)>=1000 then 1 else 0 end iselig 
	from 
	cpprod..DELTEK.LAB_HS	where fy_cd between 2003 and 2008 and empl_id='1001784'  group by fy_cd
select crs_lkpPaid_leave_benefit_eligibility -- assign category and years of service
					set yos=@cat, 
					category= case 
							when @cat > 4 then 'C'
							when @cat between 2 and 4 then 'B'
							when @cat <2 then 'A'
							end 
					where empl_id=@EmplID	
select count(*) cat from crs_tbl_Paid_leave_benefit_py_checks where iseligible=1 group by empl_id
	--and empl_id= '1053068' 

select fy_cd, sum(act_hrs)
					from cpprod..DELTEK.LAB_HS	
						where fy_cd between 2003 and 2007 
						and empl_id='1053068'  group by fy_cd
*/








