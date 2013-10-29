create procedure [dbo].[usp_EmployeeWorkExperience]
@Empl_id varchar(7)
as
select * from issql1.wisdom.dbo.EmployeeWorkExperience where employeeID = @Empl_id

