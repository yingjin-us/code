CREATE procedure dbo.usp_FindTable
@name varchar(30)
as
select * from sysobjects s
where s.id in (
select id from syscolumns o
where o.name like @name + '%')

