
--GetMidYearTitleChanges

CREATE            procedure [dbo].[GetMidYearTitleChanges]
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
			from crs_tblsal_info e
			inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
			inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
		where 
			c.End_DT='12/31/2078' 
			and (d.dot is null)
			and e.PosttoCP=1

	END


select e.empl_id, d.lname + ', ' + d.fname name, g.org,
	cast(e.Hur_rate as decimal(5,2)) Hur_rate, g.JOB_CD_OLD, g.JOB_CD_NEW, 
	d.cur_grade cur_grade, e.grade new_grade, c.TITLE_DESC oldTitle
	from crs_tblsal_info e
	inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
	inner join CRS_empl_rate_update g on g.empl_id=e.empl_id
	inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
	where e.grade<>d.cur_grade and c.End_DT='12/31/2078'	
		and (g.org like '%.1') and g.JOB_CD_NEW is NULL
	and e.PosttoCP=1
	order by e.grade desc


