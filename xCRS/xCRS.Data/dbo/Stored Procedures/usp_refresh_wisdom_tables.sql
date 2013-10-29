CREATE procedure [dbo].[usp_refresh_wisdom_tables]
as
/*
EXEC CRS.dbo.usp_worksheet_EmployeeEduData
select * from dbo.wisdom_title
select * from dbo.wisdom_EmployeeDegree
*/

delete from dbo.wisdom_title;
insert into dbo.wisdom_title select * from issql1.wisdom.dbo.title;

delete from dbo.wisdom_EmployeeDegree; 
insert into dbo.wisdom_EmployeeDegree select * from issql1.wisdom.dbo.EmployeeDegree;

select * from dbo.wisdom_title;
select * from dbo.wisdom_EmployeeDegree;

