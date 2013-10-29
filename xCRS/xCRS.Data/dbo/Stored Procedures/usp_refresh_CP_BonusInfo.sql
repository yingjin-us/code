CREATE      procedure [dbo].[usp_refresh_CP_BonusInfo]
	@ReviewYear char(4)
AS

-- [usp_refresh_CP_BonusInfo] 2012
truncate table DELTEK_TS_LN_HS	

insert into DELTEK_TS_LN_HS
/*select t.empl_id, t.pay_type, sum(t.lab_cst_amt) bon_amt
    from CPPROD..DELTEK.TS_LN_HS t
    where t.pay_type like 'B%'
      and t.ts_dt between @startDate and @endDate
    group by t.empl_id, t.pay_type  */

select t.empl_id, t.pay_type, sum(t.lab_cst_amt) bon_amt, t.ts_dt
    from CPPROD..DELTEK.TS_LN_HS t
    where t.pay_type like 'B%' 
	and t.lab_cst_amt>0
      --and empl_id='1305812'
      --and t.ts_dt between @startDate and @endDate
    group by t.empl_id, t.pay_type, t.ts_dt

--select *, bon_amt/1000 from DELTEK_TS_LN_HS 1121547
--select * from crs_tmpreport_downloaded where empl_id='1121547'
--print COALESCE(NULL * 40 * 52, 5) AS 'Total Salary' 


--begin transaction
	Declare @bonTotal 	decimal (18,3)
	Declare @EmplID 	varchar(15)	

	DECLARE getBonusTotal CURSOR 
	FOR

	/*select empl_id,  sum(bon_amt) from DELTEK_TS_LN_HS 
		where bon_date between 
		@startDate and @endDate
		--'01-Dec-2006' and  '11-Nov-2007'
		group by empl_id */
	select empl_id, sum(bon_amt) bon_total from vw_DELTEK_TS_LN_HS 
		where bon_year=@ReviewYear
		--bon_date between '01-Dec-2005' and '30-Nov-2007'
		--'01-Dec-2006' and  '11-Nov-2007'
		--and 
		group by empl_id

	OPEN getBonusTotal
		FETCH NEXT FROM getBonusTotal into @EmplID, @bonTotal
		WHILE @@FETCH_STATUS = 0
		BEGIN
			UPDATE dbo.CRS_tmpReport_Downloaded 
				SET Total_BonusForPreviousYears = coalesce(@bonTotal/1000,0)
				WHERE Empl_ID = @EmplID

			FETCH NEXT FROM getBonusTotal into @EmplID, @bonTotal
		END
	CLOSE getBonusTotal
	DEALLOCATE getBonusTotal
	IF @@ERROR <> 0
	BEGIN
	    -- Rollback the transaction
	    --ROLLBACK
	    -- Raise an error and return
	    RAISERROR ('Error updating reocrds', 16, 1)
	    RETURN
	END	
--commit





