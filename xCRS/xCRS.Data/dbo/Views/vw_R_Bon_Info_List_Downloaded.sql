
CREATE VIEW [dbo].[vw_R_Bon_Info_List_Downloaded]
AS
SELECT Empl_ID, { fn YEAR(Effect_DT) } AS Effect_Year, Bon_Type, 
    Bon_Amt
FROM dbo.CRS_tblBon_Info_downloaded

