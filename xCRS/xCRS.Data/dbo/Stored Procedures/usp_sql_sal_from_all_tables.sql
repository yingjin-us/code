CREATE procedure [dbo].[usp_sql_sal_from_all_tables]
as
select t.empl_id, t.lname, t.fname, i.paytype_code 
, el.hrly_amt as deltek_hur_rate, el.annl_amt as deltek_salary
, s.hur_rate as sal_table_hur_rate, s.sal as sal_table_salary
, t.new_sal as rpt_new_sal
, t.new_grade as tmp_rpt_grade
, i.grade_code as idmaster_grade
, s.grade as sal_grade
from 
crs_tblempl_info e, crs_tmpreport_downloaded t, idmaster i
,DELTEK_EMPL_LAB_INFO EL
, (SELECT EMPL_ID, MAX(END_DT) MAX_END_DT 
   FROM DELTEK_EMPL_LAB_INFO 
   GROUP BY EMPL_ID) ELM
, crs_tblsal_info_downloaded s   
where e.active = 1
and e.empl_id = t.empl_id
and t.active = 1
and t.empl_id = i.idmaster_westatid
and i.paytype_code in ('S','M','P')
AND T.EMPL_ID = el.empl_id
AND EL.EMPL_ID = ELM.EMPL_ID
AND EL.END_DT = ELM.MAX_END_DT
and t.empl_id = s.empl_id


