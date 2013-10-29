
create VIEW [dbo].[vw_Issql1_Idmaster_Supervisor]
AS
SELECT     TOP 100 PERCENT SupervisorCode, LEFT(IDMaster_PreferredFirstName, 1) + '.' + IDMaster_PreferredLastName AS Name, IDMaster_WestatID
FROM         issql1.wisdom.dbo.idmaster
WHERE     (IDMaster_SupervisorFlag = 1)

