
CREATE  view vw_employee_information_report
As
select v.*, i.Directory_title, e.empl_class_cd  

	from vw_empl_info v
	left outer join idmaster i on
	v.empl_id=i.idmaster_westatid
	inner join DELTEK_EMPL_LAB_INFO e on
	v.empl_id=e.empl_id
	and e.end_dt = '31-dec-2078' 

