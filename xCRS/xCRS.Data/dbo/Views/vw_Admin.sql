CREATE VIEW dbo.vw_Admin
AS
SELECT     TOP 100 PERCENT dbo.IDMaster.IDMaster_PreferredLastName + ' ' + dbo.IDMaster.IDMaster_PreferredFirstName AS Name, 
                      dbo.IDMaster.SupervisorCode, dbo.CRS_Users.Empl_ID, IDMaster_1.IDMaster_WestatID AS ManagerID, 
                      IDMaster_1.SupervisorCode AS ManagerSUCode
FROM         dbo.CRS_Users INNER JOIN
                      dbo.IDMaster ON dbo.CRS_Users.Empl_ID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.IDMaster IDMaster_1 ON dbo.CRS_Users.ManagerWestatID = IDMaster_1.IDMaster_WestatID
WHERE     (dbo.CRS_Users.IsAdmin = 0)
ORDER BY Name
