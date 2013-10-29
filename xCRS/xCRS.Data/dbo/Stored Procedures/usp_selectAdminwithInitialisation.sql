
CREATE  procedure dbo.usp_selectAdminwithInitialisation
	as
SELECT    
	dbo.IDMaster.IDMaster_PreferredLastName + ' ' + dbo.IDMaster.IDMaster_PreferredFirstName AS Name, 
        dbo.IDMaster.SupervisorCode, dbo.CRS_Users.Empl_ID, IDMaster_1.IDMaster_WestatID AS ManagerID, 
	IDMaster_1.SupervisorCode AS ManagerSUCode, dbo.CRS_Users.DownloadTimeStamp, dbo.CRS_Users.UploadTimeStamp
FROM         dbo.CRS_Users INNER JOIN
                      dbo.IDMaster ON dbo.CRS_Users.Empl_ID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.IDMaster IDMaster_1 ON dbo.CRS_Users.ManagerWestatID = IDMaster_1.IDMaster_WestatID
WHERE     (dbo.CRS_Users.IsAdmin = 0) AND (dbo.CRS_Users.DownloadTimeStamp IS NOT NULL)


UNION


select 
	dbo.IDMaster.IDMaster_PreferredLastName + ' ' + dbo.IDMaster.IDMaster_PreferredFirstName AS Name,
	dbo.IDMaster.SupervisorCode, dbo.CRS_Users.Empl_ID, IDMaster_1.IDMaster_WestatID AS ManagerID, 
	IDMaster_1.SupervisorCode AS ManagerSUCode, dbo.CRS_Users.DownloadTimeStamp, dbo.CRS_Users.UploadTimeStamp
	from crs_users inner join dbo.IDMaster ON 
		crs_users.Empl_ID = idmaster.IDMaster_WestatID
	LEFT OUTER JOIN
                dbo.IDMaster IDMaster_1 ON dbo.CRS_Users.ManagerWestatID = IDMaster_1.IDMaster_WestatID
where managerWestatID in 
(Select empl_id from crs_users where dbo.CRS_Users.IsAdmin = 0 AND dbo.CRS_Users.DownloadTimeStamp IS NOT NULL)



ORDER BY Name

