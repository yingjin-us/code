







--Do not initialize before doing a check on the comp review look up
--select * from crs_lkpCompReviewType
--select * from crs_tmpreport_downloaded where dot is not null and active = 1
--Refresh = 0 to reset the crs_user status account
-- usp_InitializeDownloadProcess_2 '2012'
--After initialization bring CRS_R3.CRS_tmpReport_Downloaded_ProductionCopy table

CREATE          procedure [dbo].[usp_InitializeDownloadProcess_2]
	@ReviewYear 	int
	--@Refresh	bit
AS

Declare @SUCode 	char(3)
Declare @SUEmplID 	varchar(15)	
Declare @Effect_DT	varchar(15)
Declare @Effect_Dt_ForFld	varchar(15)
Declare @SelectedYear 	int


truncate table CRS_tblBon_Info_Downloaded
truncate table CRS_tblSal_Info_Downloaded
truncate table crs_empl_rate_update

truncate table CRS_tmpSalYear1_Downloaded
Select @SelectedYear=@ReviewYear-3
INSERT INTO CRS_tmpSalYear1_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @SelectedYear

truncate table CRS_tmpSalYear2_Downloaded    
Select @SelectedYear=@ReviewYear-2
INSERT INTO CRS_tmpSalYear2_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @SelectedYear

truncate table CRS_tmpSalYear3_Downloaded   
Select @SelectedYear=@ReviewYear-1
INSERT INTO CRS_tmpSalYear3_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @SelectedYear

truncate table CRS_tmpSalYear4_Downloaded
INSERT INTO CRS_tmpSalYear4_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @ReviewYear



-- added DOSE column in the table 11/02/2006
truncate table CRS_tmpReport_Downloaded
INSERT INTO CRS_tmpReport_Downloaded ( Empl_ID, LName, FName, MIName, DOSE, DOPE, DOT, Active,
ORG, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, SU4_Name, 
	Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCol1, Row1, Bon1, SI2, PI2, GR2, RCol2, 
	Row2, Bon2, SI3, PI3, GR3, Cur_GR_Step, RCol3, Row3, Bon3, SI4, PI4,
	New_Grade, New_GR_Step, RCol4, Row4, Bon4, New_Sal, Cur_Rate, 
	Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1,GR_Step2, Grade_Step_Min3,YearVal, sub_unit, family_code, Hiring_commitement) 
SELECT EMPL_ID, LAST_NAME, FIRST_NAME, MID_NAME, IDMaster_DOPE, IDMaster_DOE, TERM_DT, 
	Active, ORG_ID, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, 
	SU4_Name, Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCOL1, ROW1, BON1, SI2,
	PI2, GR2, RCOL2, ROW2, BON2, SI3, PI3, GR3, Cur_GR_Step , RCOL3,
	ROW3, BON3, SI4, PI4, GR4, New_GR_Step, RCOL4, ROW4, BON4, New_Sal,
	Cur_Rate, Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1,GR_Step2,Grade_Step_Min3, @ReviewYear, sub_unit, family_code, Hiring_commitement FROM vw_R_Empl_Sal_Info_Downloaded

update CRS_tmpReport_Downloaded 
	set PTS =(
		select e.empl_class_cd
			from 
			cpprod..DELTEK.EMPL_LAB_INFO e
			inner join CRS_tmpReport_Downloaded d on
			d.EMPL_ID = e.empl_id
			where e.empl_class_cd like 'PTS%'
		  	and e.end_dt = '31-dec-2078' and d.empl_id=CRS_tmpReport_Downloaded.empl_id)

update CRS_tmpReport_Downloaded
	set orgName = (
		select org_name 
			from 
		CPPROD..DELTEK.ORG o 
		inner join CRS_tmpReport_Downloaded d on
		d.Org = o.ORG_ID and d.empl_id=CRS_tmpReport_Downloaded.empl_id)


update CRS_tmpReport_Downloaded
	set Directory_title= (
	select Directory_title from idmaster
		where idmaster_westatid=CRS_tmpReport_Downloaded.empl_ID)

/* FOR TESTING	
select *, su4 from CRS_tmpReport_Downloaded where user_id is null 
	and su4<>'BRD'
select * from CRS_tmpSalYear1_Downloaded
	where owner_id='1004362'
select * from CRS..CRS_tmpSalYear1_uploaded
	where owner_id='1004362'
select * from crs_users
select org_name from CPPROD..DELTEK.ORG where org_id='1.21.21.3'
select e.empl_class_cd
			from 
			cpprod..DELTEK.EMPL_LAB_INFO e
			inner join CRS_tmpReport_Downloaded d on
			d.EMPL_ID = e.empl_id
			where e.empl_class_cd like 'PTS%'
		  	and e.end_dt = '31-dec-2078' and d.empl_id='1005637' 
select * from vw_empl_info where  empl_id='1001061' */

--Download data for all the employees in edit table
--Cursor loops thru record from idmaster and sups and looks for SU4


--exec usp_RefreshTMPReportData @ReviewYear

Select @Effect_DT = '12/01/' + cast(@ReviewYear as char(4)) --+ cast(Year(Getdate()) as char(4))
	DECLARE getSU CURSOR 
	FOR
		/*
		 	select v.SupervisorCode, i.IDMaster_WestatID from vw_CRS_Supervisor v
				inner join idmaster i on v.IDMaster_WestatID=i.IDMaster_WestatID 
				where (v.SupervisorCode <> 'BRD') AND i.IDMaster_WestatID_Supervisor='1000001'
		*/

	select v.supervisorcode, e.empl_id from vw_CRS_Supervisor v
		inner join crs_users e on e.empl_id=v.IDMaster_WestatID
		where 
				e.allowdownload=1 and
				e.managerwestatID is null 

	OPEN getSU
		FETCH NEXT FROM getSU
		into @SUCode, @SUEmplID
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert into CRS_tblSal_Info_Downloaded(Empl_ID, Effect_DT, Supervisor_Empl_ID, Reviewed)
			Select Empl_ID, @Effect_DT, @SUEmplID,0 from vw_SelectEmployeesToDownload	
				where SU4=@SUCode

			UPDATE dbo.CRS_tmpReport_Downloaded SET User_ID = @SUEmplID
				WHERE Empl_ID IN 
			(SELECT Empl_ID From dbo.CRS_tblSal_Info_Downloaded WHERE (Supervisor_Empl_ID = @SUEmplID))
			
			/*
			UPDATE dbo.CRS_tmpReport SET User_ID = @SUEmplID
				WHERE Empl_ID IN 
			(SELECT Empl_ID From dbo.CRS_tblSal_Info_Downloaded WHERE (Supervisor_Empl_ID = @SUEmplID))
			*/

			FETCH NEXT FROM getSU
				into @SUCode, @SUEmplID
		END
	CLOSE getSU
	DEALLOCATE getSU

/* make sure to update AllStaffbon=0 for terminated employees. AllStaffBon field is set 1 by default for all. */

update crs_tmpreport_downloaded
	set AllStaffbon=0 where (dot is not null)
Update crs_tmpreport_downloaded set Years_Of_Experience = ''
--if (@Refresh=0)
	--update crs_users set DownloadTimeStamp=getdate(), status=0, UploadTimeStamp = NULL

--recreate tmp report table.	

/* TEST
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = '2004' and employee_id='1050034' */


truncate table CRS_TBL_WHATIF_BONUS_DATA
delete from CRS_empl_rate_update

/*
Select @Effect_Dt_ForFld = @Effect_DT --'12/01/' + cast(@ReviewYear + 1 as char(4))
--print @Effect_Dt_ForFld

--update the effect_dt for all the fld professional and hourly staff to 01/01/+nextyear

update CRS_tblSal_Info_Downloaded
	set effect_dt=@Effect_Dt_ForFld
from CRS_tblSal_Info_Downloaded e
	inner join CRS_tmpReport_Downloaded f
	on  e.empl_id=f.empl_id
	where right(org,1)<>1
		and user_id is not null */


/*Get the bonus from CP and update downloaded table
Declare @startDate varchar(11)
Declare @endDate varchar(11)
select @startDate='01-Dec-' + cast(@ReviewYear-1 as char(4))
select @endDate='30-Nov-' + cast(@ReviewYear as char(4))
*/


/*
select effect_dt, org from CRS_tblSal_Info_Downloaded e
	inner join 	CRS_tmpReport_Downloaded f
	on  e.empl_id=f.empl_id
	where right(org,1)<>1
		and user_id is not null
select * from 
	CRS_tmpReport_Downloaded
	where right(org,1)<>1 and user_id is not null
and empl_id not in (select e.empl_id from CRS_tblSal_Info_Downloaded e
	inner join 	CRS_tmpReport_Downloaded f
	on  e.empl_id=f.empl_id
	where right(org,1)<>1 and user_id is not null)

*/

update crs_tblCloseReview_Process set CloseReviewStatusCode=0


/****************************************************************
PLEASE MAKE SURE TO CHECK the tables after running this process
--****************************************************************/
--this get the all the bonus from the costpoint and add it all togther
--and puts it in the tmp report table - AllBonusPreviousYear colum

exec usp_refresh_CP_BonusInfo @ReviewYear --@startDate, @endDate
--the above refresh the following view - gets the total bonus
--select bon_amt/1000 from vw_DELTEK_TS_LN_HS where bon_year ='2007'

---Budget Updates
--RUN exec usp_InitializeBudget
--NO NEED INIT IF IT HAS DONE ALREADY
--exec usp_InitializeBudgetData
--check table CRS_tmpReport_Downloaded for 
--select * from CRS_tmpReport_Downloaded
--budgetgrade, budgetbonus, etc

--estimate for all staff bonus
--exec dbo.usp_InitializeAllStaffBonus @ReviewYear
--RUN dbo.usp_InitializeAllStaffBonus '2007'
--check table crs_lkpallstaffbonus
--select allstaffbonus from crs_lkpallstaffbonus where empl_id='1305812'

-- Delete Hourly from these tables vv/mb 092512
 delete from crs_tmpreport_downloaded where empl_id in (select empl_id from crs_tblempl_info where isbrowse_only = 1)
 delete from CRS_tblSal_Info_Downloaded where empl_id in (select empl_id from crs_tblempl_info where isbrowse_only = 1)
 delete from CRS_tblBon_Info_Downloaded where empl_id in (select empl_id from crs_tblempl_info where isbrowse_only = 1)

-- Set the Grades as empty if they are SMF
update crs_tmpreport_downloaded set Cur_Grade = null, Cur_GR_Step = null, New_Grade = null, New_GR_Step = null where org like '%.3'







