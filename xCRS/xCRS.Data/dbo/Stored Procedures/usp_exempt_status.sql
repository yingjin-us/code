create   procedure dbo.usp_exempt_status
	@empl_id varchar(15)
AS
select top 1 e.exmpt_FL
	from cpprod..DELTEK.EMPL_LAB_INFO e
	where e.empl_id=@empl_id order by effect_dt desc

