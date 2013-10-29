















/*
PLEASE BE VERY CAREFUL BEFORE YOU RUN THIS 
IT CLEANS UP THE ALL THE CURRENT REVIEW DATA AND RE-INITIALIZES THE SYSTEM
*/

CREATE                 procedure [dbo].[usp_AdminOnly_finalCloseReviewProcess]
	@ReviewYear as int
As

--update grade information in wisdom database for the employees whose 
--grades have changed.
/*
begin transaction
rollback
commit

select * into idmaster_backup_before_gradeupdates_121812
	from issql1.wisdom.dbo.idmaster

--create a history record.


sp_help issql1.wisdom.dbo.idmaster_history


insert into issql1.wisdom.dbo.idmaster_history(
IDMaster_WestatID	,
SysInsertDate	,
SysInsertUid	,
SysUpdateDate	,
SysUpdateUid	,
IDMaster_SSN	,
IDMaster_LastName	,
IDMaster_FirstName	,
IDMaster_MiddleInitial	,
IDMaster_PreferredLastName	,
IDMaster_PreferredFirstName	,
IDMaster_NameSuffix	,
IDMaster_DOE	,
IDMaster_DOPE	,
IDMaster_DOR	,
IDMaster_DOT	,
StaffType_Code	,
PayType_Code	,
Grade_Code	,
Title_Code	,
IDMasterStatus_Code	,
Company_Code	,
OrgType_Code	,
OrgUnit_Code	,
OrgUnitGLC_Code	,
IDMaster_SupervisorFlag	,
IDMaster_WestatID_Supervisor	,
Location_Code	,
IDMaster_NewHireNotification	,
IDMaster_TermNotification	,
IDMaster_WINSCardIssued	,
ECC_Code	,
IDMaster_ExistsInCostPoint	,
IDMaster_NextHistoryID	,
IDMaster_Archived	,
IDMaster_PriorLastName	,
IDMaster_CostPointExportDate	,
IDMaster_WestatID_Supervisor2	,
IDMaster_WestatID_Supervisor3	,
IDMaster_WestatID_Supervisor4	,
SupervisorCode	,
Util_Code	,
EmailAddress	,
EffectiveDate	,
MsgGroupCode	,
IDMaster_WestatID_ASup	,
IDMaster_Level	,
IDMaster_ASupFlag	,
ASupCode	,
Directory_Sup	,
Directory_Title	,
Directory_Sup_Flag	,
POB_City	,
POB_State	,
POB_County	,
POB_Country	,
DOB	,
ADDR_1	,
ADDR_2	,
ADDR_3	,
ADDR_City	,
ADDR_State	,
ADDR_Country	,
ADDR_Zip	,
Phone_Number	,
Gender	,
Race	,
BestGuess	,
TermType) 	

-- Run the Next Select statement and exect the each row in Wisdom..
select 'exec pr_WINS_UpdateIDMasterHistory ' + cast(i.idmaster_westatid as varchar(22))  
from issql1.wisdom.dbo.idmaster i inner join CRS_EMPL_RATE_UPDATE e
	on e.empl_id=i.idmaster_westatID
			where e.oldgrade<>e.newgrade
			and e.oldgrade = i.grade_code 
			and e.org like '%.1' and i.grade_code<>e.newgrade


pr_WINS_UpdateIDMasterHistory '1305812'
select i.* from issql1.wisdom.dbo.idmaster i inner join CRS_EMPL_RATE_UPDATE e
	on e.empl_id=i.idmaster_westatID
			where e.oldgrade<>e.newgrade
			and e.oldgrade = i.grade_code 
			and e.org like '%.1' and i.grade_code<>e.newgrade

-- title_code TO FIX - This year 2009 - Sarah bucher will provide us with employee id and title code

update issql1.wisdom.dbo.idmaster
	set grade_code=e.newgrade
from issql1.wisdom.dbo.idmaster i inner join CRS_EMPL_RATE_UPDATE e
	on e.empl_id=i.idmaster_westatID
			where e.oldgrade<>e.newgrade
			and e.oldgrade = i.grade_code 
			and e.org like '%.1' and i.grade_code<>e.newgrade


--Update DOG field crs_tblempl_info for ppl whose grade has changed.
--12/01/YEAR	
-- set DOG when cur_grade and new_grade are different
begin transaction
declare @ReviewYear varchar(4)
set @ReviewYear =2011
UPDATE crs_tblempl_info set dog = @ReviewYear + '-12-01 00:00:00.000'
where empl_id in 
      ( select empl_id from crs_tmpreport_downloaded
            where cur_grade <> new_grade
            and cur_grade <> 'NA'
            and new_grade <> 'NA'
      )
commit


sp_help crs_tblempl_info

update issql1.wisdom.dbo.idmaster
	set grade_code=e.newgrade
from issql1.wisdom.dbo.idmaster i inner join CRS_EMPL_RATE_UPDATE e
	on e.empl_id=i.idmaster_westatID
			where e.oldgrade<>e.newgrade
			and e.oldgrade = i.grade_code 
			and e.org like '%.1' and i.grade_code<>e.newgrade

select e.*
	from issql1.wisdom.dbo.idmaster 
	i inner join CRS_EMPL_RATE_UPDATE e
	on e.empl_id=i.idmaster_westatID
	where e.oldgrade<>e.newgrade
		and e.org like '%.1'

select e.empl_id, e.oldgrade,e.newgrade, i.grade_code from issql1.wisdom.dbo.idmaster i
	inner join CRS_EMPL_RATE_UPDATE e
	on e.empl_id=i.idmaster_westatID
		where e.oldgrade<>e.newgrade
			and e.newgrade = i.grade_code 
			and e.org like '%.1'
			and i.grade_code<>e.newgrade
select * from CRS_EMPL_RATE_UPDATE
*/


update CRS_Users set status=2 --close the review cycle
update crs_tblCloseReview_Process --Make sure CloseReviewProcess is set to uninitialized state.
	set CloseReviewStatusCode=3
exec usp_refresh_Data

-- select * from crs_tblAreaHeadApprovalList
delete from crs_tblAreaHeadApprovalList 
-- select * from CRS_tblNewPSUP
delete from CRS_tblNewPSUP

update dbo.CRS_lkpReportItems
	set AdminOnly=1,
	ShowIndownloadModule=1
		
update dbo.CRS_lkpReportItems
	set ShowIndownloadModule=1,
	AdminOnly=0
where actual_name='postcompensation_report.rpt'

-- this will bring in the all staff bonus
exec usp_refresh_CP_BonusInfo @ReviewYear
	
--exec usp_InitializeDownloadProcess_2 @ReviewYear, 1 --1 becuase we do not want to open the system at this time

















