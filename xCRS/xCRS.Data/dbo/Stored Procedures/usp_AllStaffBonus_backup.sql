


--select * from vw_AllStaffBonus_2006 order by cur_grade
--usp_AllStaffBonus '2006'

create    procedure usp_AllStaffBonus_backup
	@reviewYear as varchar(4)
as

/*
********Uncomment it later
truncate table dbo.CRS_tblSum_ChgHrs_by_Empl
--select * from dbo.CRS_tblSum_ChgHrs_by_Empl
insert into CRS_tblSum_ChgHrs_by_Empl
select empl_id , sum(act_hrs) TotalHours
	from cpprod..DELTEK.LAB_HS where fy_cd=@reviewYear and pd_no<=11
	--and empl_id in ('1305812','1052121')
	and empl_id is not null and org_id like '%.1'
	group by empl_id
*/

select l.empl_id [Westat ID], e.lname [Last Name], e.fname [First Name],
	e.su4 SU4, convert(varchar, e.dope, 101)DOPE, e. cur_sal * 1000  [Current Salary],
	e.cur_grade [Current Grade], l.Sum_ChgHrs [Charged Hours],
	b.bonamt [Bonus Amount], 
	--b.is_percent, 
	b.bon_rate [Bonus Rate], 
	--b.min_percent,
       case 
         when su4 = 'BRD' or l.empl_id in (1250069, 1257357, 1252691, 1252405, 1252717, 1252708,  1246887, 1311627, 1307730,1307721,1270966)
               then
             0
         /** Full time service section begins.
             Hours worked are greater than or equal to total 
             fulltime service hours for the year. */
         when l.sum_chghrs >= b.fulltime_hours then 
         case 
           /** IS_PERCENT indicates whether bonus is computed as percent of salary subject to 
               a max BONAMT. **/
           when b.is_percent = 0 then
             b.bonamt
           when b.is_percent = 1 then
           case 
             when   cur_sal * 1000  *1000  * bon_rate / 100 >= b.bonamt then
                  b.bonamt
             when   cur_sal * 1000  *1000  * bon_rate / 100 < b.bonamt then
                    cur_sal * 1000  * 1000  * bon_rate / 100
           end 
         end
         /* Full Time Service section ends. */

         /* Non Full Time Service Section Begins. 
            Part time staff and new staff who joined in the current year. */
         when l.sum_chghrs < b.fulltime_hours then
         case 
           when e.dose < '2-jan-' + @reviewyear then
           case 
             when b.is_percent = 0 then
             case 
               when sum_chgHrs / prorate_hours < min_percent /100 then
                  (min_percent / 100) * bonamt
               when (sum_chgHrs / prorate_hours > min_percent / 100) and sum_ChgHrs <= prorate_hours then
                  (sum_chgHrs / prorate_hours) * bonamt
               when sum_chgHrs >= prorate_hours then
                  bonamt
             end
             when b.is_percent = 1 then
             case 
               when sum_chgHrs / prorate_hours < min_percent /100 then
                 case 
                   when   cur_sal * 1000  * 1000  * bon_rate / 100 >= b.bonamt then
                     (min_percent / 100) * bonamt
                   when   cur_sal * 1000  * 1000  * bon_rate / 100 < b.bonamt  then
                     (min_percent / 100) *   cur_sal * 1000  * 1000  * bon_rate / 100
                 end 
               when sum_chgHrs / prorate_hours > min_percent / 100 then
                 case 
                 when   cur_sal * 1000  * 1000  * bon_rate / 100 >= b.bonamt then
                   case
                     when sum_chgHrs < prorate_hours then
                       (sum_chgHrs / prorate_hours) * bonamt
                     when sum_chgHrs >= prorate_hours then
                       b.bonamt
                   end
                 when  cur_sal * 1000  * bon_rate / 100 < b.bonamt then
                   case 
                     when sum_chgHrs < prorate_hours then
                       (sum_chgHrs / prorate_hours) *  cur_sal * 1000  * bon_rate / 100
                     when sum_chgHrs >= prorate_hours then
                        cur_sal * 1000  * bon_rate / 100
                   end
                 end 
             end
           end
           when e.dose >= '2-jan-' + @reviewyear then
           case 
             when b.is_percent = 0 then
             case 
               when sum_chgHrs / fulltime_hours < min_percent /100 then
                  (min_percent / 100) * bonamt
               when (sum_chgHrs / fulltime_hours > min_percent / 100) and sum_ChgHrs <= fulltime_hours then
                  (sum_chgHrs / fulltime_hours) * bonamt
               when sum_chgHrs >= fulltime_hours then
                  b.bonamt
             end
             when b.is_percent = 1 then
             case 
               when sum_chgHrs / fulltime_hours < min_percent /100 then
                 case 
                   when  cur_sal * 1000  * bon_rate / 100 >= b.bonamt then
                     (min_percent / 100) * bonamt
                   when  cur_sal * 1000  * bon_rate / 100 < b.bonamt  then
                     (min_percent / 100) *  cur_sal * 1000  * bon_rate / 100
                 end 
               when sum_chgHrs / fulltime_hours > min_percent / 100 then
                 case 
                 when  cur_sal * 1000  * bon_rate / 100 >= b.bonamt then
                   (sum_chgHrs / fulltime_hours) * bonamt
                 when  cur_sal * 1000  * bon_rate / 100 < b.bonamt and sum_chgHrs < fulltime_hours then
                   (sum_chgHrs / fulltime_hours) *  cur_sal * 1000  * bon_rate / 100
                 when sum_chgHrs >= fulltime_hours then
                   b.bonamt
                 end 
             end
           end

         end
             
       end [All Staff Bonus],
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
  and e.su4 <> 'BRD'
  and e.org like '%.1'










