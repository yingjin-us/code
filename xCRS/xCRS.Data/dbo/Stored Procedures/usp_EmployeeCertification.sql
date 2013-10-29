create procedure [dbo].[usp_EmployeeCertification]
@Empl_id varchar(7)
as
select * from issql1.wisdom.dbo.EmployeeCertification where employeeID = @Empl_id