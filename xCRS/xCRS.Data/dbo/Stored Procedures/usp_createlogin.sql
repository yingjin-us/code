-- [usp_createlogin]
CREATE  procedure [dbo].[usp_createlogin]
	@username varchar(50),
	@userwins varchar(15),
	@MgrWins  varchar(15),
	@level int
as
--use master
EXEC sp_addlogin @username,'westat1'
--USE CRS
EXEC sp_grantdbaccess @username, @username

--insert into crs_users values (@username, @userwins, 0,0,1, @MgrWins, null, null,0,'PSUP Added.', 2,0,0,0,@level,0,0)
insert into crs_users values (@username, @userwins, 0,0,1, @MgrWins, null, null,0,'PSUP Added.', 2,0,0,0,@level,0,0,1)

