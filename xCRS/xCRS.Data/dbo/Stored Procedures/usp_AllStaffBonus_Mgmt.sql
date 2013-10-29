


--select * from vw_AllStaffBonus_2006 order by cur_grade
--usp_AllStaffBonus '2006'

create    procedure usp_AllStaffBonus_Mgmt
	@reviewYear as varchar(4)
as

truncate table dbo.CRS_tblSum_ChgHrs_by_Empl
--select * from dbo.CRS_tblSum_ChgHrs_by_Empl
insert into CRS_tblSum_ChgHrs_by_Empl
select empl_id , sum(act_hrs) TotalHours
	from cpprod..DELTEK.LAB_HS where fy_cd=@reviewYear and pd_no<=11
	--and empl_id in ('1305812','1052121')
	and empl_id is not null and org_id like '%.1'
	group by empl_id

--Declare @reviewYear as varchar(4)
--set @reviewYear='2006'
select l.empl_id [Westat ID], e.lname [Last Name], e.fname [First Name],
	--e.su4 SU4, 
	convert(varchar, e.dope, 101)DOPE, 
	--e.cur_sal [Current Salary],
	--e.cur_grade [Current Grade], l.Sum_ChgHrs [Charged Hours],
	--b.bonamt [Bonus Amount], 
	--b.is_percent, 
	--b.bon_rate [Bonus Rate], 
	--b.min_percent,
       case 
         when l.sum_Chghrs >= b.fulltime_hours then
              float_holiday_hours
         when l.sum_chghrs < b.fulltime_hours then
         case 
           when e.dose < '2-jan-' + @reviewyear then
           case 
             when sum_chgHrs / prorate_hours < min_percent /100 then
                  round((min_percent / 100) * float_holiday_hours + .49,0)
             when sum_chgHrs / prorate_hours > min_percent / 100 and sum_chgHrs <= prorate_hours then
                  round( sum_chgHrs / prorate_hours * float_holiday_hours + .49,0)
             when sum_ChgHrs > prorate_hours then
                  float_holiday_hours
           end
           when e.dose >= '2-jan-' + @reviewyear then
           case 
             when sum_chgHrs / fulltime_hours < min_percent /100 then
                round((min_percent / 100) * float_holiday_hours + .49,0)
             when sum_chgHrs / fulltime_hours > min_percent / 100 then
                round((sum_ChgHrs / fulltime_hours) * float_holiday_hours + .49,0)
           end
         end
       end [Float Holiday Bonus]
from  crs_tmpReport_downloaded e, crs_lkpStaffBonus b, CRS_tblSum_ChgHrs_by_Empl l
where l.empl_id = e.empl_id
  and e.cur_grade = b.grade
  and b.reviewyear =  @reviewyear
  and e.dot is null
  and e.su4 = 'BRD'
  and e.org like '%.1'










