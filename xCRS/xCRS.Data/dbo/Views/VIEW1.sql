CREATE VIEW dbo.VIEW1
AS
SELECT     dbo.CRS_tmpSalYear1_Downloaded.*
FROM         dbo.CRS_tmpReport_Downloaded INNER JOIN
                      dbo.CRS_tmpSalYear1_Downloaded ON dbo.CRS_tmpReport_Downloaded.User_ID = dbo.CRS_tmpSalYear1_Downloaded.Owner_ID
WHERE     (dbo.CRS_tmpReport_Downloaded.SU1 = N'CAH') OR
                      (dbo.CRS_tmpReport_Downloaded.SU2 = N'CAH') OR
                      (dbo.CRS_tmpReport_Downloaded.SU3 = N'CAH') OR
                      (dbo.CRS_tmpReport_Downloaded.SU4 = N'CAH')
