CREATE procedure usp_getExperienceDetailforExport
	@empl_id varchar(12)
AS
Select
	
Prior_Employer [PRIOR EMPLOYER], 
Prior_Position [PRIOR POSITION], 
Start_Date_of_Employement [START DATE OF EMPLOYMENT],
End_Date_of_Employement [END DATE OF EMPLOYMENT],
Employement_code [TYPE],
Yearsof_Exp [YEARS] from  dbo.CRS_tblEmployee_Experience
	where CRS_tblEmployee_Experience.Empl_ID=@empl_id
