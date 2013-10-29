
CREATE  VIEW [dbo].[vw_Empl_Info]
AS
SELECT     dbo.DELTEK_EMPL.EMPL_ID, dbo.DELTEK_EMPL.LAST_NAME, dbo.DELTEK_EMPL.FIRST_NAME, dbo.DELTEK_EMPL_LAB_INFO.ORG_ID, 
                      dbo.crs_tblempl_info.Rev_Code, dbo.crs_tblempl_info.DOG, dbo.crs_tblempl_info.ACTIVE, dbo.crs_tblempl_info.Refresh_Run_MMYY, 
                      dbo.crs_tblempl_info.Archived, dbo.crs_tblempl_info.Sub_unit, dbo.crs_tblempl_info.Family_code, dbo.crs_tblempl_info.Hiring_commitement, 
                      dbo.crs_tblempl_info.TobeReviewed, dbo.crs_tblempl_info.fldReviewProcess, dbo.crs_tblempl_info.CompReviewType, 
                      dbo.DELTEK_EMPL_LAB_INFO.ANNL_AMT,
                          (SELECT     TOP 1 Grade
                            FROM          dbo.CRS_tblSal_Info
                            WHERE      (Empl_ID = dbo.crs_tblempl_info.Empl_ID)
                            ORDER BY Effect_DT DESC) AS SAL_GRADE_CD, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU1_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU2_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU3_Name, dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4, 
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4_Name, dbo.crs_tblempl_info.Util_Percent, dbo.crs_tblempl_info.FullTime_Percent, 
                      dbo.IDMaster.IDMaster_DOR AS DOR, dbo.IDMaster.IDMaster_DOE AS DOE, dbo.IDMaster.IDMaster_DOPE AS DOSE, 
                      dbo.IDMaster.IDMaster_DOT AS TERM_DT, i.Directory_Title, e.EMPL_CLASS_CD, o.ORG_NAME,
                          (SELECT     TOP 1 Grade_Step
                            FROM          dbo.CRS_tblSal_Info AS CRS_tblSal_Info_1
                            WHERE      (Empl_ID = dbo.crs_tblempl_info.Empl_ID)
                            ORDER BY Effect_DT DESC) AS grade_step, dbo.crs_tblempl_info.Perf_Review, 
                            tc.title, case when tc.flsa_cd='N' then 'Non-Exempt' else 'Exempt' end flsa_cd, 
                      dbo.crs_tblempl_info.Grade_Category, tc.title_code
FROM         dbo.crs_tblempl_info INNER JOIN
                      dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info ON 
                      dbo.crs_tblempl_info.Empl_ID = dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.Empl_ID INNER JOIN
                      dbo.IDMaster ON dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.IDMaster_WestatID = dbo.IDMaster.IDMaster_WestatID LEFT OUTER JOIN
                      dbo.vw_CRS_CP_DOSE ON dbo.crs_tblempl_info.Empl_ID = dbo.vw_CRS_CP_DOSE.GENL_ID LEFT OUTER JOIN
                      dbo.DELTEK_EMPL INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO ON dbo.DELTEK_EMPL.EMPL_ID = dbo.DELTEK_EMPL_LAB_INFO.EMPL_ID ON 
                      dbo.crs_tblempl_info.Empl_ID = dbo.DELTEK_EMPL.EMPL_ID LEFT OUTER JOIN
                      dbo.IDMaster AS i ON dbo.crs_tblempl_info.Empl_ID = i.IDMaster_WestatID INNER JOIN
                      dbo.DELTEK_ORG AS o ON dbo.DELTEK_EMPL_LAB_INFO.ORG_ID = o.ORG_ID INNER JOIN
                      dbo.DELTEK_EMPL_LAB_INFO AS e ON dbo.crs_tblempl_info.Empl_ID = e.EMPL_ID AND e.END_DT = '31-dec-2078' LEFT OUTER JOIN
                      wisdom_title as tc ON dbo.IDMaster.Title_Code = tc.title_code
WHERE     (dbo.DELTEK_EMPL_LAB_INFO.END_DT > CONVERT(DATETIME, '2078-12-30 00:00:00', 102)) AND 
                      (dbo.vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info.SU4 <> 'BRD')






GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[39] 2[1] 3) )"
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
            TopColumn = 16
         End
         Begin Table = "vw_R_IDMaster_Info_SU_DOPE_CRS_Empl_Info"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 121
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "idmaster"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "vw_CRS_CP_DOSE"
            Begin Extent = 
               Top = 246
               Left = 38
               Bottom = 361
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DELTEK_EMPL"
            Begin Extent = 
               Top = 246
               Left = 229
               Bottom = 361
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DELTEK_EMPL_LAB_INFO"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 481
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 601
               R', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_Empl_Info';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'ight = 327
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 366
               Left = 266
               Bottom = 481
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 606
               Left = 38
               Bottom = 721
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "crs_lkpTitleCodes"
            Begin Extent = 
               Top = 36
               Left = 506
               Bottom = 206
               Right = 658
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
         Column = 3000
         Alias = 900
         Table = 3060
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
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_Empl_Info';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_Empl_Info';

