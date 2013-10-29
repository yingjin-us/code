


CREATE    procedure usp_refreshFldAndHourlyData
AS
BEGIN TRANSACTION

	Delete from CRS_empl_rate_update
		where org not like '%.1'
	IF @@ERROR <> 0
	 BEGIN
	    -- Rollback the transaction
	    ROLLBACK
	    -- Raise an error and return
	    RAISERROR ('Error refreshing CRS_empl_rate_update table.', 16, 1)
	    RETURN
	END
		
	insert into CRS_empl_rate_update
		select e.empl_id, e.effect_dt, e.Hur_rate, 
			case when (c.DETL_JOB_CD is null) AND (d.org like '%.2' OR d.org like '%.3') then
				'ZZZ'
			else
				c.DETL_JOB_CD		
			END DETL_JOB_CD, 
			case when (d.org like '%.2' OR d.org like '%.3') then
				'ZZZ'
			else
				NULL
			END DETL_JOB_CD_N,
			'CRS_USER' modified_by, getdate() time_stamp,
			d.cur_grade, e.grade, d.org
			from crs_tblsal_info_downloaded e
			inner join crs_tmpreport_downloaded d on d.empl_id=e.empl_id
			inner join CPPROD..DELTEK.EMPL_LAB_INFO c on c.empl_id=e.empl_id
		where c.End_DT='12/31/2078' and e.reviewed=1
			and d.org not like '%.1' and active=1
	IF @@ERROR <> 0
	 BEGIN
	    -- Rollback the transaction
	    ROLLBACK
	    -- Raise an error and return
	    RAISERROR ('Error re-importing data from salary download table to CRS_empl_rate_update table.', 16, 1)
	    RETURN
	END
COMMIT

--select * from CRS_empl_rate_update 	where org not like '%.1'

select * from CRS_empl_rate_update
		where org not like '%.1'

