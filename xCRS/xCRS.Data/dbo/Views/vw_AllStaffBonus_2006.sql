/*
--update the production database DOSE column
update crs_tmpreport_downloaded
	set DOSE=i.IDMaster_DOPE
from crs_tmpreport_downloaded t
	inner join idmaster i on
	i.Idmaster_westatID=t.empl_id
	and DOSE is not null

*/
--select * from vw_AllStaffBonus_2006 order by cur_grade
CREATE   view vw_AllStaffBonus_2006
as
select l.empl_id, e.lname,e.fname, e.su4, e.dope, e.cur_sal, e.cur_grade, l.Sum_ChgHrs,b.bonamt, b.is_percent, b.bon_rate, b.min_percent,
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
             when cur_sal * bon_rate / 100 >= b.bonamt then
                  b.bonamt
             when cur_sal * bon_rate / 100 < b.bonamt then
                  cur_sal * bon_rate / 100
           end 
         end
         /* Full Time Service section ends. */

         /* Non Full Time Service Section Begins. 
            Part time staff and new staff who joined in the current year. */
         when l.sum_chghrs < b.fulltime_hours then
         case 
           when e.dose < '2-jan-2006' then
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
                   when cur_sal * bon_rate / 100 >= b.bonamt then
                     (min_percent / 100) * bonamt
                   when cur_sal * bon_rate / 100 < b.bonamt  then
                     (min_percent / 100) * cur_sal * bon_rate / 100
                 end 
               when sum_chgHrs / prorate_hours > min_percent / 100 then
                 case 
                 when cur_sal * bon_rate / 100 >= b.bonamt then
                   case
                     when sum_chgHrs < prorate_hours then
                       (sum_chgHrs / prorate_hours) * bonamt
                     when sum_chgHrs >= prorate_hours then
                       b.bonamt
                   end
                 when cur_sal * bon_rate / 100 < b.bonamt then
                   case 
                     when sum_chgHrs < prorate_hours then
                       (sum_chgHrs / prorate_hours) * cur_sal * bon_rate / 100
                     when sum_chgHrs >= prorate_hours then
                       cur_sal * bon_rate / 100
                   end
                 end 
             end
           end
           when e.dose >= '2-jan-2006' then
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
                   when cur_sal * bon_rate / 100 >= b.bonamt then
                     (min_percent / 100) * bonamt
                   when cur_sal * bon_rate / 100 < b.bonamt  then
                     (min_percent / 100) * cur_sal * bon_rate / 100
                 end 
               when sum_chgHrs / fulltime_hours > min_percent / 100 then
                 case 
                 when cur_sal * bon_rate / 100 >= b.bonamt then
                   (sum_chgHrs / fulltime_hours) * bonamt
                 when cur_sal * bon_rate / 100 < b.bonamt and sum_chgHrs < fulltime_hours then
                   (sum_chgHrs / fulltime_hours) * cur_sal * bon_rate / 100
                 when sum_chgHrs >= fulltime_hours then
                   b.bonamt
                 end 
             end
           end

         end
             
       end AllStaffBonus,
       case 
         when l.sum_Chghrs >= b.fulltime_hours then
              float_holiday_hours
         when l.sum_chghrs < b.fulltime_hours then
         case 
           when e.dose < '2-jan-2006' then
           case 
             when sum_chgHrs / prorate_hours < min_percent /100 then
                  round((min_percent / 100) * float_holiday_hours + .49,0)
             when sum_chgHrs / prorate_hours > min_percent / 100 and sum_chgHrs <= prorate_hours then
                  round( sum_chgHrs / prorate_hours * float_holiday_hours + .49,0)
             when sum_ChgHrs > prorate_hours then
                  float_holiday_hours
           end
           when e.dose >= '2-jan-2006' then
           case 
             when sum_chgHrs / fulltime_hours < min_percent /100 then
                round((min_percent / 100) * float_holiday_hours + .49,0)
             when sum_chgHrs / fulltime_hours > min_percent / 100 then
                round((sum_ChgHrs / fulltime_hours) * float_holiday_hours + .49,0)
           end
         end
       end Float_Holiday_Bonus
from  crs_tmpReport_downloaded e, crs_lkpStaffBonus b, CRS_tblSum_ChgHrs_by_Empl l
where l.empl_id = e.empl_id
  and e.cur_grade = b.grade
  and b.reviewyear = 2006
  and e.dot is null
  and e.su4 <> 'BRD'
  and e.org like '%.1'








