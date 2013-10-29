


/*
1489017
1489008
1488759
1488991
1488679
1488884
1489053

'1383611',
'1472276',
'1488768',
'1480686'

usp_Insert_New_EmployeeIntoDownloadTable '2009','1489017'



Things to do before running this.

insert into idmaster select * from issql1.wisdom.dbo.idmaster where idmaster_westatid=@empl_id
Insert into DELTEK_EMPL select * from CPPROD..DELTEK.EMPL where EMPL_ID=@empl_id
insert into DELTEK_EMPL_LAB_INFO select * from CPPROD..DELTEK.EMPL_LAB_INFO where EMPL_ID=@empl_id
insert into DELTEK_GENL_UDEF select * from CPPROD..DELTEK.GENL_UDEF where EMPL_ID=@empl_id

insert into crs_tblsal_info
insert into crs_tblempl_info
select * from
vw_empl_info where empl_id in

*/
CREATE     procedure [dbo].[usp_Insert_New_EmployeeIntoDownloadTable]
	@Empl_ID varchar(12),
	@ReviewYear varchar(4)
AS
	
Declare @Effect_DT	varchar(15)
Declare @SUEmplID	varchar(15)

Select @Effect_DT = '12/01/' + @ReviewYear

INSERT INTO CRS_tmpSalYear4_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @ReviewYear-1 and Employee_ID=@Empl_ID

INSERT INTO CRS_tmpReport_Downloaded ( Empl_ID, LName, FName, MIName, DOPE, DOT, Active,
	ORG, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, SU4_Name, 
	Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCol1, Row1, Bon1, SI2, PI2, GR2, RCol2, 
	Row2, Bon2, SI3, PI3, GR3, Cur_GR_Step, RCol3, Row3, Bon3, SI4, PI4,
	New_Grade, New_GR_Step, RCol4, Row4, Bon4, New_Sal, Cur_Rate, 
	Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1,GR_Step2, Grade_Step_Min3,YearVal) 
SELECT EMPL_ID, LAST_NAME, FIRST_NAME, MID_NAME, IDMaster_DOE, TERM_DT, 
	Active, ORG_ID, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, 
	SU4_Name, Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCOL1, ROW1, BON1, SI2,
	PI2, GR2, RCOL2, ROW2, BON2, SI3, PI3, GR3, Cur_GR_Step , RCOL3,
	ROW3, BON3, SI4, PI4, GR4, New_GR_Step, RCOL4, ROW4, BON4, New_Sal,
	Cur_Rate, Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1,GR_Step2,Grade_Step_Min3, @ReviewYear FROM 
	vw_R_Empl_Sal_Info_Downloaded 
	where EMPL_ID=@Empl_ID	and EMPL_ID not in (select empl_id from CRS_tmpReport_Downloaded where empl_id = @Empl_ID)

Select @SUEmplID = (select IDMaster_WestatID from IDMaster where Supervisorcode=(select SU4 from vw_empl_info where Empl_ID=@Empl_ID))

/*
Insert into CRS_tblSal_Info_Downloaded(Empl_ID, Effect_DT, Supervisor_Empl_ID)
	values(@Empl_ID, '2009-12-01 00:00:00.000', @SUEmplID)
*/

-- changed this hard coded date value to @effect_dt on 27th apr, 2011 after taking to murali
Insert into CRS_tblSal_Info_Downloaded(Empl_ID, Effect_DT, Supervisor_Empl_ID)
	values(@Empl_ID, @Effect_DT, @SUEmplID)

UPDATE dbo.CRS_tmpReport_Downloaded SET User_ID = @SUEmplID
	WHERE Empl_ID =@Empl_ID 





/*
1004745
Select * from vw_SelectEmployeesToDownload	
				where SU4='FAR' and empl_ID='1333612'

select * from vw_empl_info where Empl_ID='1333612'

select * from CRS_tblSal_Info_Downloaded where empl_id='1315561'
select v.SupervisorCode, i.IDMaster_WestatID from vw_CRS_Supervisor v
		inner join idmaster i on v.IDMaster_WestatID=i.IDMaster_WestatID 
		where (v.SupervisorCode <> 'BRD') AND i.IDMaster_WestatID_Supervisor='1000001'

select IDMaster_WestatID from IDMaster 
	 where Supervisorcode=(select SU4 from vw_empl_info where Empl_ID='1333612')
select * from vw_empl_info where empl_id='1333612'
select * from vw_empl_info where org_id=''
select * from vw_empl_info where org_id='1.21.31.1'

usp_Insert_New_EmployeeIntoDownloadTable '1333612', '2006'

 */







