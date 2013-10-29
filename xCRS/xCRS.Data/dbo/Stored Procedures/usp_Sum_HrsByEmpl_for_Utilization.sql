
CREATE    Procedure usp_Sum_HrsByEmpl_for_Utilization
	@pd_month as integer,
	@pd_year as varchar(4)
AS
select  empl_id,
        sum(case substring(proj_id,1,1)
				when '1' then 0 
				else l.act_hrs
			end) Worked,
	sum(case substring(proj_id,1,4)
		when '1191' then 0
		when '1196' then 0
		when '1199' then 0
		else l.act_hrs
		end) Available,
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
--exec usp_Sum_HrsByEmpl_for_Utilization 8, '2005'

