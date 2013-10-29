

-- [usp_a_z_create_new_employee_record] 1550360, 16,null, 2012, 1, 'SEPSRF'

CREATE     procedure [dbo].[usp_a_z_create_new_employee_record]
	@empl_id as varchar(10), 
	@grade as varchar(2), 
	@grade_step as int,
	@reviewYear as varchar(4),
	@TobeReviewed as int,
	@fldReviewProcess as varchar(20),
	@PostToIdmaster as int
AS

	Declare @Effect_DT	varchar(15)
	Declare @SUEmplID	varchar(15)
	Declare @curreviewYear  varchar(4)
	Declare @changecode	char(1) 		
    Declare @dose datetime


set @changecode='A'
set @curreviewYear = @reviewYear - 1

if @PostToIdmaster = 1
begin
	
	delete from idmaster where idmaster_westatid = @empl_id;
	insert into dbo.idmaster
		select * from issql1.WISDOM.dbo.idmaster where idmaster_westatid = @empl_id;
	
	delete from DELTEK_EMPL where EMPL_ID = @empl_id;
	insert into DELTEK_EMPL
		select * from CPPROD..DELTEK.EMPL E WHERE E.EMPL_ID = @EMPL_ID;
	
	delete from DELTEK_EMPL_LAB_INFO where EMPL_ID = @empl_id;
	insert into DELTEK_EMPL_LAB_INFO
		select * from CPPROD..DELTEK.EMPL_LAB_INFO EL WHERE EL.EMPL_ID = @empl_id;	
end			

-- Insert record to crs_tblEmpl_Info
print 'Print crs_tblEmpl_Info'
set @dose = (Select top 1 idmaster_dope from dbo.idmaster i where i.IDMaster_WestatID = @empl_id)
delete from crs_tblEmpl_Info where empl_id = @empl_id
insert into crs_tblEmpl_Info (empl_id, active, archived, util_percent, fulltime_percent, DOG, TobeReviewed, fldReviewProcess, family_code) 
      VALUES(@empl_id, 1,0,0,0, @dose, @TobeReviewed, @fldReviewProcess, @fldReviewProcess) 

-- Insert record to CRS_tblProjTeam
print 'Print CRS_tblProjTeam'
delete from CRS_tblProjTeam where empl_id = @empl_id
Insert Into CRS_tblProjTeam (Empl_ID, Proj_ID, UpdateID, UpdateDate) VALUES(@empl_id, 'WESTAT','Import',GetDate())

-- Insert record to crs_tblSal_Info
print 'Print crs_tblSal_Info'
delete from crs_tblSal_Info where empl_id = @empl_id
if @grade=''
	set @grade=NULL

	--print 'GRADE' + @grade
	if @grade<='15'
			insert into crs_tblSal_Info 
				(empl_id, effect_dt, hur_rate, sal, sal_inc,per_inc, 
				grade, grade_step, change_code, updateid, updatedate, ReviewYear) 
			select e.empl_id, effect_dt ,l.hrly_amt,round(annl_amt/1000,1) sal, 0 sal_inc,0 per_inc, 
				empl_grade grade, grade grade_step, @changecode, 'Import', getdate(), @curreviewYear 
				from DELTEK_empl e, 
				DELTEK_empl_lab_info l, 
				CRS_lkpGrade_Level_Sal g, 
				CRS_lkpGrade_Step gs  
				where ((ts_pd_cd = 'FLD' and org_id < '1.58')  or (ts_pd_cd = 'SEMI' ))  
				and end_dt = '31-dec-2078' and e.empl_id = l.empl_id 
				and g.dateval = (select max(dateval) from CRS_lkpGrade_Level_Sal) 
				and round(annl_amt/1000 + .0049 ,1) between from_dol and to_dol 
				and round(annl_amt/1000 + .0049 ,1) = gs.sal  
				and round(annl_amt/1000 + .0049 ,1) <=  g.To_DOL 
				and e.empl_id = @empl_id --order by e.empl_id, effect_dt desc
				--i don;t think we need order by clause here
	else if @grade>'15'
			insert into crs_tblSal_Info 
				(empl_id, effect_dt, hur_rate, sal, sal_inc,per_inc, 
				grade, grade_step, change_code, updateid, updatedate, ReviewYear)  
			select e.empl_id,effect_dt ,l.hrly_amt,round(annl_amt/1000,1) sal, 0 sal_inc,0 per_inc, 
				--16 grade, '16.00' grade_step,  
				@grade grade, @grade + '.00' grade_step,
				@changecode, 'Import',getdate(),  @curreviewYear
			from DELTEK_empl e, 
				DEltek_empl_lab_info l 
			where ((ts_pd_cd = 'FLD' and org_id < '1.58') or (ts_pd_cd = 'SEMI' )) 
			and end_dt = '31-dec-2078' 
			and e.empl_id = l.empl_id 
			and round(annl_amt/1000+.0049,1) >= (select top 1 From_DOL from CRS_lkpGrade_Level_Sal where empl_grade=@grade)
			and e.empl_id = @empl_id  order by e.empl_id, effect_dt desc 
	else if @grade is NULL
			--print 'ok'
			insert into crs_tblSal_Info (
				empl_id, effect_dt, hur_rate, sal, sal_inc,per_inc, 
				grade, grade_step, change_code, updateid, updatedate, ReviewYear) 
			select e.empl_id,effect_dt ,l.hrly_amt,round(annl_amt/1000,1) sal, 0 sal_inc,0 per_inc, 
			null grade, null grade_step, @changecode, 'Import',getdate(), @curreviewYear 
			from DELTEK_empl e, 
				DELTEK_empl_lab_info l 
			where ((ts_pd_cd = 'FLD' and org_id < '1.58')  or (ts_pd_cd = 'SEMI' ))  
			and end_dt = '31-dec-2078' 
			and e.empl_id = l.empl_id 
			and e.empl_id = @empl_id --order by e.empl_id, effect_dt desc
	else
			insert into crs_tblSal_Info (
				empl_id, effect_dt, hur_rate, sal, sal_inc,per_inc, 
				grade, grade_step, change_code, updateid, updatedate, ReviewYear) 
			select e.empl_id,effect_dt ,l.hrly_amt,round(annl_amt/1000,1) sal, 0 sal_inc,0 per_inc, 
			null grade, null grade_step, @changecode, 'Import',getdate(), @curreviewYear 
			from DELTEK_empl e, 
				DELTEK_empl_lab_info l 
			where ((ts_pd_cd = 'FLD' and org_id < '1.58')  or (ts_pd_cd = 'SEMI' ))  
			and end_dt = '31-dec-2078' 
			and e.empl_id = l.empl_id 
			and e.empl_id = @empl_id --order by e.empl_id, effect_dt desc
	
	
-- Insert record to CRS_tmpSalYear3_Downloaded		
print 'Print CRS_tmpSalYear3_Downloaded'
Select @Effect_DT = '12/01/' + @ReviewYear
delete from CRS_tmpSalYear3_Downloaded where empl_id = @empl_id		
INSERT INTO CRS_tmpSalYear3_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
			Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
		SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
			Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
			FROM vw_MaxSalInfo_by_rev_year_all_fields
			Where reviewyear = @reviewYear-1 and Employee_ID=@empl_id

print 'Print CRS_tmpSalYear4_Downloaded'
-- Insert record to CRS_tmpSalYear4_Downloaded	
delete from CRS_tmpSalYear4_Downloaded where empl_id = @empl_id		
INSERT INTO CRS_tmpSalYear4_Downloaded(Empl_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc,
			Per_Inc, Grade, Grade_Step, Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min)
		SELECT Employee_ID, Effect_DT, Hur_Rate, Sal, Sal_Inc, Per_Inc, Grade, Grade_Step,
			Rating_Col, Rating_Row, Bon_Tot, Grade_Category, Sal_Inc_Tot, Change_Code, Grade_Step_Min
			FROM vw_MaxSalInfo_by_rev_year_all_fields
			Where reviewyear = @reviewYear and Employee_ID=@empl_id

print 'Print CRS_tmpReport_Downloaded'		
-- Insert record to CRS_tmpReport_Downloaded		
delete from CRS_tmpReport_Downloaded where empl_id = @empl_id	
			INSERT INTO CRS_tmpReport_Downloaded ( Empl_ID, LName, FName, MIName, DOSE, DOPE, DOT, Active,
				ORG, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, SU4_Name, 
				Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCol1, Row1, Bon1, SI2, PI2, GR2, RCol2, 
				Row2, Bon2, SI3, PI3, GR3, Cur_GR_Step, RCol3, Row3, Bon3, SI4, PI4,
				New_Grade, New_GR_Step, RCol4, Row4, Bon4, New_Sal, Cur_Rate, 
				Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1
				,GR_Step2, Grade_Step_Min3,YearVal, Years_Of_Experience) 
			SELECT EMPL_ID, LAST_NAME, FIRST_NAME, MID_NAME, IDMaster_DOPE, IDMaster_DOE, TERM_DT, 
				Active, ORG_ID, Rev_Code, SU1, SU1_Name, SU2, SU2_Name, SU3, SU3_Name, SU4, 
				SU4_Name, Cur_Sal, Cur_Grade, SI1, PI1, GR1, RCOL1, ROW1, BON1, SI2,
				PI2, GR2, RCOL2, ROW2, BON2, SI3, PI3, GR3, @grade_step , RCOL3,
				ROW3, BON3, SI4, PI4, GR4, New_GR_Step, RCOL4, ROW4, BON4, New_Sal,
				Cur_Rate, Util_Percent, FullTime_Percent, Sal2, Sal3, Sal_Inc_Tot,GR_Step1
				,GR_Step2,Grade_Step_Min3, @reviewYear, '' FROM 
				vw_R_Empl_Sal_Info_Downloaded where EMPL_ID=@empl_id

print 'Print CRS_tblSal_Info_Downloaded'		
-- Insert record to CRS_tblSal_Info_Downloaded			
select @SUEmplID=(select IDMaster_WestatID_Supervisor4 from IDMaster where idmaster_westatID=@empl_id)	
delete from CRS_tblSal_Info_Downloaded where empl_id = @empl_id	
Insert into CRS_tblSal_Info_Downloaded(Empl_ID, Effect_DT, Supervisor_Empl_ID)
				values(@empl_id, @Effect_DT, @SUEmplID)
	

UPDATE dbo.CRS_tmpReport_Downloaded SET User_ID = @SUEmplID
			WHERE Empl_ID =@empl_id


















