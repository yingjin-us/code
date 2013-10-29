create procedure sendpasswordReminder
	@username varchar(25)
As
SELECT     YEAR(dbo.DELTEK_EMPL.BIRTH_DT) AS yearofbirth, dbo.CRS_Users.Username, dbo.CRS_Users.Empl_ID
FROM         dbo.DELTEK_EMPL INNER JOIN
                      dbo.CRS_Users ON dbo.DELTEK_EMPL.EMPL_ID = dbo.CRS_Users.Empl_ID
	where dbo.CRS_Users.Username=@username
