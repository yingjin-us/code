create procedure [dbo].[usp_EmployeeLanguage]
@Empl_id varchar(7)
as
select * from issql1.wisdom.dbo.EmployeeLanguage where employeeID = @Empl_id

