
CREATE VIEW [dbo].[vw_R_Bon_Type_BNH_Downloaded]
AS
SELECT Empl_ID, Effect_Year, Bon_Type, Bon_Amt
FROM dbo.vw_R_Bon_Info_List_Downloaded
WHERE (Bon_Type = 'BNH')

