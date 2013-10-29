

CREATE     procedure dbo.usp_parttime_status
	@empl_id varchar(15)
AS

select e.empl_class_cd
	from DELTEK_EMPL_LAB_INFO e
	where e.empl_class_cd like 'PTS%'
  and e.end_dt = '31-dec-2078' and e.empl_id=@empl_id



