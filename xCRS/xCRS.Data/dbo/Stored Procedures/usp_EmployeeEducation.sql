create procedure [dbo].[usp_EmployeeEducation]
@Empl_id varchar(7)
as
select * from issql1.wisdom.dbo.EmployeeDegree where employeeID = @Empl_id