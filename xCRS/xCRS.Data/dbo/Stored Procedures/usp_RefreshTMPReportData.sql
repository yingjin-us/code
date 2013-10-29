



CREATE                 procedure usp_RefreshTMPReportData
	@ReviewYear int
AS

Declare @SUCode 	char(3)
Declare @SUEmplID 	varchar(15)	
Declare @Effect_DT	varchar(15)
Declare @SelectedYear 	int


truncate table CRS_tmpSalYear1
Select @SelectedYear=@ReviewYear-3
INSERT INTO CRS_tmpSalYear1(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @SelectedYear

truncate table CRS_tmpSalYear2   
Select @SelectedYear=@ReviewYear-2
INSERT INTO CRS_tmpSalYear2(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @SelectedYear

truncate table CRS_tmpSalYear3   
Select @SelectedYear=@ReviewYear-1
INSERT INTO CRS_tmpSalYear3(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @SelectedYear

truncate table CRS_tmpSalYear4
INSERT INTO CRS_tmpSalYear4(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
	Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
	Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
	FROM vw_MaxSalInfo_by_rev_year_all_fields
	Where reviewyear = @ReviewYear


truncate table CRS_tmpReport
INSERT INTO CRS_tmpReport ( Empl_ID, LName, FName, MIName, DOPE, DOT, Active,
ORG, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, SU4_Name, 
	Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCol1, Row1, Bon1, SI2, PI2, GR2, RCol2, 
	Row2, Bon2, SI3, PI3, GR3, Cur_GR_Step, RCol3, Row3, Bon3, SI4, PI4,
	New_Grade, New_GR_Step, RCol4, Row4, Bon4, New_Sal, Cur_Rate, 
	Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1,GR_Step2, Grade_Step_Min3,YearVal, sub_unit, family_code, Hiring_commitement) 
SELECT EMPL_ID, LAST_NAME, FIRST_NAME, MID_NAME, IDMaster_DOE, TERM_DT, 
	Active, ORG_ID, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, 
	SU4_Name, Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCOL1, ROW1, BON1, SI2,
	PI2, GR2, RCOL2, ROW2, BON2, SI3, PI3, GR3, Cur_GR_Step , RCOL3,
	ROW3, BON3, SI4, PI4, GR4, New_GR_Step, RCOL4, ROW4, BON4, New_Sal,
	Cur_Rate, Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot, Grade_Step1, GRade_Step2, Grade_Step_Min3, @ReviewYear, sub_unit, family_code, Hiring_commitement 
	FROM vw_R_Empl_Sal_Info


update CRS_tmpReport 
	set PTS =(
		select e.empl_class_cd
			from 
		cpprod..DELTEK.EMPL_LAB_INFO e
			inner join CRS_tmpReport d on
			d.EMPL_ID = e.empl_id
			where e.empl_class_cd like 'PTS%'
		  	and e.end_dt = '31-dec-2078' and d.empl_id=CRS_tmpReport.empl_id)

update CRS_tmpReport
	set orgName = (
		select org_name 
			from 
		CPPROD..DELTEK.ORG o 
		inner join CRS_tmpReport d on
		d.Org = o.ORG_ID and d.empl_id=CRS_tmpReport.empl_id)


update CRS_tmpReport
	set Directory_title= (
	select Directory_title from idmaster
		where idmaster_westatid=CRS_tmpReport.empl_ID)

--usp_RefreshStaticReportData 2006
--select * from crs_tmpreport




