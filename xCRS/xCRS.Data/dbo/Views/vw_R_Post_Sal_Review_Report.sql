/*	and org ='1.84.21.1'
	AND CRS_tmpSalYear4_downloaded.Grade_Category IS NOT NULL*/
CREATE VIEW dbo.vw_R_Post_Sal_Review_Report
AS
SELECT     dbo.crs_tmpreport_downloaded.User_ID, dbo.crs_tmpreport_downloaded.Empl_ID, dbo.crs_tmpreport_downloaded.LName, 
                      dbo.crs_tmpreport_downloaded.FName, dbo.crs_tmpreport_downloaded.MIName, dbo.crs_tmpreport_downloaded.DOSE, 
                      dbo.crs_tmpreport_downloaded.DOPE, dbo.crs_tmpreport_downloaded.DOT, dbo.crs_tmpreport_downloaded.Active, 
                      dbo.crs_tmpreport_downloaded.ORG, dbo.crs_tmpreport_downloaded.Rev_Code, dbo.crs_tmpreport_downloaded.Grade_Category, 
                      dbo.crs_tmpreport_downloaded.SU1, dbo.crs_tmpreport_downloaded.SU1_Name, dbo.crs_tmpreport_downloaded.SU2, 
                      dbo.crs_tmpreport_downloaded.SU2_Name, dbo.crs_tmpreport_downloaded.SU3, dbo.crs_tmpreport_downloaded.SU3_Name, 
                      dbo.crs_tmpreport_downloaded.SU4, dbo.crs_tmpreport_downloaded.SU4_Name, dbo.crs_tmpreport_downloaded.SI1, 
                      dbo.crs_tmpreport_downloaded.PI1, dbo.crs_tmpreport_downloaded.GR1, dbo.crs_tmpreport_downloaded.RCol1, 
                      dbo.crs_tmpreport_downloaded.Row1, dbo.crs_tmpreport_downloaded.Bon1, dbo.crs_tmpreport_downloaded.BonType1, 
                      dbo.crs_tmpreport_downloaded.SI2, dbo.crs_tmpreport_downloaded.PI2, dbo.crs_tmpreport_downloaded.GR2, dbo.crs_tmpreport_downloaded.RCol2, 
                      dbo.crs_tmpreport_downloaded.Row2, dbo.crs_tmpreport_downloaded.Bon2, dbo.crs_tmpreport_downloaded.BonType2, 
                      dbo.crs_tmpreport_downloaded.SI3, dbo.crs_tmpreport_downloaded.PI3, dbo.crs_tmpreport_downloaded.GR3, dbo.crs_tmpreport_downloaded.RCol3, 
                      dbo.crs_tmpreport_downloaded.Row3, dbo.crs_tmpreport_downloaded.Bon3, dbo.crs_tmpreport_downloaded.BonType3, 
                      dbo.crs_tmpreport_downloaded.SI4, dbo.crs_tmpreport_downloaded.PI4, dbo.crs_tmpreport_downloaded.RCol4, dbo.crs_tmpreport_downloaded.Row4, 
                      dbo.crs_tmpreport_downloaded.Bon4, dbo.crs_tmpreport_downloaded.BonType4, dbo.crs_tmpreport_downloaded.Cur_Sal, 
                      dbo.crs_tmpreport_downloaded.New_Sal, dbo.crs_tmpreport_downloaded.Cur_Grade, dbo.crs_tmpreport_downloaded.Cur_GR_Step, 
                      dbo.crs_tmpreport_downloaded.New_Grade, dbo.crs_tmpreport_downloaded.New_GR_Step, dbo.crs_tmpreport_downloaded.Cur_Bon, 
                      dbo.crs_tmpreport_downloaded.Cur_Rate, dbo.crs_tmpreport_downloaded.TimeStamp, dbo.crs_tmpreport_downloaded.YearVal, 
                      dbo.crs_tmpreport_downloaded.Util_Percent, dbo.crs_tmpreport_downloaded.FullTime_Percent, dbo.crs_tmpreport_downloaded.Sal2, 
                      dbo.crs_tmpreport_downloaded.Sal3, dbo.crs_tmpreport_downloaded.Sal_Inc_Tot, dbo.crs_tmpreport_downloaded.GR_Step1, 
                      dbo.crs_tmpreport_downloaded.GR_Step2, dbo.crs_tmpreport_downloaded.Grade_Step_Min3, dbo.crs_tmpreport_downloaded.Notes, 
                      dbo.crs_tmpreport_downloaded.Perf_Rating, dbo.crs_tmpreport_downloaded.Growth_Rating, dbo.crs_tmpreport_downloaded.Directory_Title, 
                      dbo.crs_tmpreport_downloaded.Sub_Unit, dbo.crs_tmpreport_downloaded.Family_code, dbo.crs_tmpreport_downloaded.Hiring_commitement, 
                      dbo.crs_tmpreport_downloaded.PTS, dbo.crs_tmpreport_downloaded.OrgName, dbo.crs_tmpreport_downloaded.Total_BonusForPreviousYears, 
                      dbo.crs_tmpreport_downloaded.BudgetGrade, dbo.crs_tmpreport_downloaded.BudgetSalary, dbo.crs_tmpreport_downloaded.BudgetBonus, 
                      dbo.crs_tmpreport_downloaded.CompReviewStatus, dbo.crs_tmpreport_downloaded.InitialCompReviewStatus, 
                      dbo.crs_tmpreport_downloaded.AllStaffBon AS Util_Perc, dbo.crs_tblempl_info.Util_Percent AS Grade_Cate, 
                      dbo.CRS_tmpSalYear4_Downloaded.Grade_Category AS Expr1, dbo.crs_tblempl_info.Archived AS Expr2
FROM         dbo.crs_tblempl_info RIGHT OUTER JOIN
                      dbo.crs_tmpreport_downloaded ON dbo.crs_tblempl_info.Empl_ID = dbo.crs_tmpreport_downloaded.Empl_ID FULL OUTER JOIN
                      dbo.CRS_tmpSalYear4_Downloaded ON dbo.crs_tmpreport_downloaded.Empl_ID = dbo.CRS_tmpSalYear4_Downloaded.Empl_ID
WHERE     (dbo.crs_tblempl_info.Archived = 0) AND (dbo.crs_tmpreport_downloaded.DOT IS NULL OR
                      dbo.crs_tmpreport_downloaded.DOT >= CONVERT(DATETIME, '2008-01-01 00:00:00', 102))

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "crs_tblempl_info"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "crs_tmpreport_downloaded"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CRS_tmpSalYear4_Downloaded"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 121
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_R_Post_Sal_Review_Report';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_R_Post_Sal_Review_Report';

