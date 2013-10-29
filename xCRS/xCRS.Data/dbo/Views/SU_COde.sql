CREATE VIEW dbo.SU_COde
AS
SELECT     IDMaster_WestatID, IDMaster_WestatID_Supervisor, IDMaster_WestatID_Supervisor2, IDMaster_WestatID_Supervisor3, 
                      IDMaster_WestatID_Supervisor4, IDMaster_LastName, IDMaster_FirstName
FROM         dbo.IDMaster
WHERE     (IDMaster_WestatID_Supervisor = 1007047) AND (IDMaster_DOT IS NULL) AND (IDMaster_WestatID_Supervisor4 <> 1000001)
