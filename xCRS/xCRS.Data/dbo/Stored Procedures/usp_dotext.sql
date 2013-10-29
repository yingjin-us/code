CREATE procedure usp_dotext
as
declare @stat int
select @stat=(select count(*) from crs_users where status<>2)
print @stat
if (@stat>0)
	BEGIN
		print 'Hello'
		RETURN
	END

--refresh
select * from crs_tblempl_info where empl_id='1305812'


--select * from crs_users

