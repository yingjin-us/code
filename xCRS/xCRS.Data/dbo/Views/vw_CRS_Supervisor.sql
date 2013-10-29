CREATE VIEW dbo.vw_CRS_Supervisor
AS
SELECT     TOP 100 PERCENT SupervisorCode, LEFT(IDMaster_PreferredFirstName, 1) + '.' + IDMaster_PreferredLastName AS Name, IDMaster_WestatID
FROM         dbo.IDMaster
WHERE     (IDMaster_SupervisorFlag = 1)
