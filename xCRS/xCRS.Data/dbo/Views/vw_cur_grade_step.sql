

create view [dbo].[vw_cur_grade_step]
as

select cast(g.empl_id as nvarchar(12)) as  empl_id, g.Grade_Step from
(select s.empl_id, max(effect_dt) as effect_dt 
 from CRS_tblSal_Info s 
 group by s.empl_id) m, CRS_tblSal_Info g
 where m.empl_id = g.empl_id
 and m.effect_dt = g.effect_dt
 


