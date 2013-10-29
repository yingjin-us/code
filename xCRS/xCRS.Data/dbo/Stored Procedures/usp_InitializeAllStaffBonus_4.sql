

-- Stored Procedure
--Make sure we have record in the bonus table for the review year
--insert into crs_lkpStaffBonus
--select '2008', grade, bonAmt, Notes, Bon_rate, Is_percent, Min_percent,
--	fulltime_hours, prorate_hours, float_holiday_hours
-- from crs_lkpStaffBonus where reviewyear='2007'
--select * from vw_AllStaffBonus_2006 order by cur_grade
--usp_AllStaffBonus '2007'
--select * from CRS_tblSum_ChgHrs_by_Empl where empl_id='1305812'
--select * from crs_lkpAllstaffBonus where reviewyear='2009'
--usp_InitializeAllStaffBonus_4 '2012', 11

CREATE                            procedure [dbo].[usp_InitializeAllStaffBonus_4]
	@reviewYear as varchar(4),
	@period as int

as

declare @sum_chghrs as decimal
--set @sum_chghrs = (select sum(hours) from pay_period_hours where month <MONTH(getdate()))
set @sum_chghrs = (select sum(hours) from pay_period_hours where month < @period)

update crs_lkpStaffBonus
	set fulltime_hours=@sum_chghrs,
	prorate_hours= FLOOR(@sum_chghrs * 0.95)
where reviewyear=@reviewYear

/*
********Uncomment it later*/

truncate table dbo.CRS_tblSum_ChgHrs_by_Empl
--select * from dbo.CRS_tblSum_ChgHrs_by_Empl
insert into CRS_tblSum_ChgHrs_by_Empl
select empl_id , sum(act_hrs) TotalHours
	from cpprod..DELTEK.LAB_HS where fy_cd=@reviewYear and pd_no < @period
	--and empl_id in ('1305812','1052121')
	and empl_id is not null 
	--exclude lop
	and proj_id <> '1196.01'
	--and org_id like '%.1'
	group by empl_id

truncate table crs_lkpAllstaffBonus
insert into crs_lkpAllstaffBonus
select l.empl_id [Westat ID], e.lname [Last Name], e.fname [First Name],
	e.su4 SU4, convert(varchar, e.dose, 101)DOSE, 
	e. cur_sal * 1000  [Current Salary], -- Changed to used DOSE from DOPE on Jawa 
	e.cur_grade [Current Grade], l.Sum_ChgHrs [Charged Hours], fulltime_hours,
	b.bonamt [Bonus Amount], 
	b.is_percent, 
	b.bon_rate [Bonus Rate], 
	b.min_percent,
	--case when Sum_ChgHrs >= 1744 then 
	--	'1744.00'
	--else
	--	prorate_hours
	--end Denominator,
	case when e.dose < '2-jan-' + @reviewyear then
		case when Sum_ChgHrs >= fulltime_hours then 
			fulltime_hours --'1744'
		else
			prorate_hours -- '1656'
		end
	else
		fulltime_hours --'1744' -- fulltime_hours
	end Denominator,
       case 
         when su4 = 'BRD' or l.empl_id in (1384004,1489482,1539865,1421250,1252691,1311627,1460458,1303137,1488143,1490906,1529224,1526165,1307721,
1522999,1524300,1357524,1307730,1383292,1488928
)
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
--             when   cur_sal * 1000  *1000  * bon_rate / 100 >= b.bonamt then EDITED by Jawa 12/5/2006
             when   cur_sal * 1000  * bon_rate / 100 >= b.bonamt then
                  b.bonamt
--             when   cur_sal * 1000  *1000  * bon_rate / 100 < b.bonamt then EDITED by Jawa 12/5/2006
             when   cur_sal * 1000  * bon_rate / 100 < b.bonamt then
--                    cur_sal * 1000  * 1000  * bon_rate / 100 EDITED by Jawa 12/5/2006
                    cur_sal * 1000  * bon_rate / 100
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
--                   when   cur_sal * 1000  * 1000  * bon_rate / 100 >= b.bonamt then EDITED by Jawa 12/5/2006
                   when   cur_sal * 1000   * bon_rate / 100 >= b.bonamt then
                     (min_percent / 100) * bonamt
--                   when   cur_sal * 1000  * 1000  * bon_rate / 100 < b.bonamt  then EDITED by Jawa 12/5/2006
                   when   cur_sal * 1000  * bon_rate / 100 < b.bonamt  then
--                     (min_percent / 100) *   cur_sal * 1000  * 1000  * bon_rate / 100 EDITED by Jawa 12/5/2006
                     (min_percent / 100) *   cur_sal * 1000  * bon_rate / 100
                 end 
               when sum_chgHrs / prorate_hours > min_percent / 100 then
                 case 
--                 when   cur_sal * 1000  * 1000  * bon_rate / 100 >= b.bonamt then EDITED by Jawa 12/5/2006
                 when   cur_sal * 1000  * bon_rate / 100 >= b.bonamt then
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
  --and e.su4 <> 'BRD'
  and e.org like '%.1'
  and  e.dose < '1-Nov-' + @reviewyear
  --murali bala 060309 added this check 
  --make sure the employee is supposed to get all staff
  --a new field has been added to crs_tmpreport table
  --and e.AllStaffBon = 1	


-- compensation statement is run off of mike;s table.
-- make sure to refresh this

delete from CRS_tblStaffBonus_Mike
insert into CRS_tblStaffBonus_Mike 
(empl_id, homeorg, lst_name, fir_name, grade, sum_chghrs, bonamt_calc)
SELECT  a.empl_id, b.org, lastname, firstname, b.cur_grade, charged_hrs, AllStaffBonus
	FROM         dbo.CRS_lkpAllStaffBonus a, crs_tmpreport_downloaded b
		where a.empl_id=b.empl_id
  		and b.AllStaffBon = 1	
		and b.su4<>'BRD'


-- Given by Sarah on Dec 3rd 2012 Email..List copy and paste
if @ReviewYear = 2012
update crs_tblStaffBonus_Mike set bonamt_calc = 0 where empl_id in 
(1227032,1287191,1049895,1016331,1375675,1381276,1485422,1448892,1468584,1037531,1545091,1157081,1162388, 1430295)










