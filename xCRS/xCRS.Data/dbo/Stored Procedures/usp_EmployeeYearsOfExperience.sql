CREATE procedure [dbo].[usp_EmployeeYearsOfExperience]
@Empl_id varchar(7)
as

select Years_of_Experience from crs_tmpreport_downloaded where empl_id = @Empl_id



