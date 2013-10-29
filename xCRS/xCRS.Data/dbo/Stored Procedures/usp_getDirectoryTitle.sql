CREATE procedure usp_getDirectoryTitle
	@empl_ID varchar(12)
AS
	select Directory_title from idmaster
	where idmaster_westatid=@empl_ID
