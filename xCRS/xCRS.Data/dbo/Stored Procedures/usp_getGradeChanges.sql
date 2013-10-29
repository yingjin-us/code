




CREATE           procedure usp_getGradeChanges
AS

declare @totcount as int
set @totcount= (Select count(*) from CRS_empl_rate_update)
if (@totcount=0)
	BEGIN	
		insert into CRS_empl_rate_update
		select e.empl_id, e.effect_dt, e.Hur_rate, 
			case when (c.DETL_JOB_CD is null) AND (d.org like '%.2' OR d.org like '%.3') then
				'ZZZ'
			else
				c.DETL_JOB_CD		
			END DETL_JOB_CD, 
			case when (d.org like '%.2' OR d.org like '%.3') then
				'ZZZ'
			when (d.cur_grade=e.grade) AND (d.org like '%.1') then
				c.DETL_JOB_CD
			else
				NULL
			END DETL_JOB_CD_N,
		
			'CRS_USER' modified_by, getdate() time_stamp,
			d.cur_grade, e.grade, d.org
			from crs_tblsal_info_downloaded e
			inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
			inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
		where c.End_DT='12/31/2078' and e.reviewed=1 and (d.dot is null)
	END


select e.empl_id, d.lname + ', ' + d.fname name, g.org,
	cast(e.Hur_rate as decimal(5,2)) Hur_rate, g.JOB_CD_OLD, g.JOB_CD_NEW, 
	d.cur_grade cur_grade, e.grade new_grade, c.TITLE_DESC oldTitle
	from crs_tblsal_info_downloaded e
	inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
	inner join CRS_empl_rate_update g on g.empl_id=e.empl_id
	inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
	where e.grade<>d.cur_grade and c.End_DT='12/31/2078'	
		and (g.org like '%.1') and g.JOB_CD_NEW is NULL
	order by e.grade desc


/*
Test code

update crs_tblsal_info_downloaded set grade='08' where grade ='8'
select * from crs_tblsal_info_downloaded where empl_id = '1040331'

select FUNC_JOB_CD, FUNC_JOB_DESC from CPPROD..DELTEK.FUNC_JOB_TITLES
insert into CRS_empl_rate_update
select e.empl_id, e.effect_dt, e.Hur_rate, c.DETL_JOB_CD, 'CRS_USER' modified_by, getdate() time_stamp
	from crs_tblsal_info_downloaded e
	inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
	where c.End_DT='12/31/2078' and e.reviewed=1
	
select e.*, d.cur_grade, g.grade, c.TITLE_DESC from CRS_empl_rate_update e
	inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
	inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
	inner join crs_tblsal_info_downloaded g on g.empl_id=e.empl_id
where c.End_DT='12/31/2078'	
select * from CPPROD..DELTEK.EMPL_LAB_INFO
select e.empl_id, e.effect_dt, e.Hur_rate, 'CRS_USER' modified_by, getdate() time_stamp
	from crs_tblsal_info_downloaded e
	inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
	--inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
	--w-here c.End_DT='12/31/2078'


select * from DELTEK_EMPL_LAB_INFO
select * from  CRS_empl_rate_update
select * into CRS_empl_rate_update 
	from CPPROD..CRS_USER.EMPL_RATE_UPDATE


select *	from CPPROD..CRS_USER.EMPL_RATE_UPDATE
select *	from CPPROD..DELTEK.EMPL

*/









