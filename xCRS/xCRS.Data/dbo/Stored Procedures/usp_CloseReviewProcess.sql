



-- usp_CloseReviewProcess 2012



/****************************************************
THIS PROCESS SHOULD BE CALLED FROM THE CRS APPLICATION
THE CRS APP WILL DELETE COSTPOINTS TABLE CRS_USER.EMPL_RATE_UPDATE FIRST
****************************************************/


CREATE          procedure [dbo].[usp_CloseReviewProcess]
	@ReviewYear 	int
	--, @OrgType char(3) --Parameter value '%.1' or '%.2' or '%.3'
As

BEGIN TRANSACTION
	
	--******************************************************************************
	--BACK UP SAL DOWNLOAD AND BONUS DOWNLOAD
	--******************************************************************************

	if NOT EXISTS (select * from INFORMATION_SCHEMA.tables where table_name 
			= 'CRS_tblSal_Info_Downloaded_backup')
		select * into CRS_tblSal_Info_Downloaded_backup	from CRS_tblSal_Info_Downloaded
	IF @@ERROR <> 0
	 BEGIN
	    -- Rollback the transaction
	    ROLLBACK
	    -- Raise an error and return
	    RAISERROR ('Error creating backup table for CRS_tblSal_Info_Downloaded', 16, 1)
	    RETURN
	END	
	
	if NOT EXISTS (select * from INFORMATION_SCHEMA.tables where table_name = 
		'CRS_tblBon_Info_Downloaded_backup')
		select * into CRS_tblBon_Info_Downloaded_backup	from CRS_tblBon_Info_Downloaded
	
	IF @@ERROR <> 0
	 BEGIN
	    -- Rollback the transaction
	    ROLLBACK
	    -- Raise an error and return
	    RAISERROR ('Error creating backup table for CRS_tblBon_Info_Downloaded', 16, 1)
	    RETURN
	 END	


	--******************************************************************************
	--BACK UP SAL DOWNLOAD AND BONUS DOWNLOAD COMPLETED
	--******************************************************************************
--sp_help CRS_tblSal_Info_Downloaded
	insert into CRS_tblSal_Info
	select c.Empl_ID, c.Effect_DT, c.Hur_Rate, c.Sal, c.Sal_Inc,
			c.Per_Inc, Grade, c.Grade_Step, c.Rating_Col, c.Rating_Row, c.Bon_Tot,
			c.Grade_Category, c.Change_Code, c.UpdateID, c.UpdateDate, @ReviewYear , c.Notes,
			c.Perf_Rating, c.Growth_Rating, NULL, SalInc_InPercent
			from CRS_tblSal_Info_Downloaded c
				inner join crs_tmpreport_downloaded t 			on t.empl_id=c.empl_id
				inner join crs_empl_rate_update d				on d.empl_id=c.empl_id
			where c.Reviewed = 1 and t.dot is null
				--and t.org like @OrgType  --Posting all the data at once so, no filter for @OrgType

	-- Rollback the transaction if there were any errors
	IF @@ERROR <> 0
		BEGIN
		    -- Rollback the transaction
		    ROLLBACK
		    -- Raise an error and return
		    RAISERROR ('Error in inserting salary data. Transaction has been rolled back.', 16, 1)
		    RETURN
		 END

	insert into CRS_tblBon_Info
	select CRS_tblBon_Info_Downloaded.*, @ReviewYear from CRS_tblBon_Info_Downloaded
			inner join CRS_tblSal_Info_Downloaded sal 
				on sal.empl_id=CRS_tblBon_Info_Downloaded.empl_id
			inner join crs_tmpreport_downloaded t 			on t.empl_id=sal.empl_id
				where sal.reviewed=1 and t.dot is null and bon_amt>0
					--and t.org like @OrgType --Posting all the data at once so, no filter for @OrgType
	-- Rollback the transaction if there were any errors
	IF @@ERROR <> 0
	 BEGIN
	    -- Rollback the transaction
	    ROLLBACK
	    -- Raise an error and return
	    RAISERROR ('Error in inserting bonus data. Transaction has been rolled back.', 16, 1)
	    RETURN
	 END

COMMIT	--Commit all the transaction

--insert the records into Costpoint's table

insert into 
	CPPROD..CRS_USER.EMPL_RATE_UPDATE
	Select EMPL_ID, EFFECT_DT, HRLY_AMT, JOB_CD_NEW, MODIFIED_BY, TIME_STAMP
	from CRS_EMPL_RATE_UPDATE --where org like @OrgType --Posting all the data at once so, no filter for @OrgType
	
/*

-- set DOG when cur_grade and new_grade are different
UPDATE crs_tblempl_info set dog = @ReviewYear + '-12-01 00:00:00.000'
where empl_id in 
	( select empl_id from crs_tmpreport_downloaded
		where cur_grade <> new_grade
		and cur_grade <> 'NA'
		and new_grade <> 'NA'
	)

*/

/* update the close review status to 2. This will disable post to crs and enable post to CP */
update crs_tblCloseReview_Process set closereviewstatuscode=2



