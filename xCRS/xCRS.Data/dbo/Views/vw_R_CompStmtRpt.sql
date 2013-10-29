create  VIEW dbo.vw_R_CompStmtRpt
AS
SELECT     dbo.CRS_tblSum_ChgHrs_by_Empl.Sum_ChgHrs AS Sum_ChgHrs, dbo.vw_R_Empl_DOPE.UDEF_DT AS DOSE, 
                      dbo.CRS_tblStaffBonus_Mike.BonAmt_Override AS Expr1, dbo.CRS_tblStaffBonus_Mike.BonAmt_Calc AS Expr2, dbo.CRS_tmpReport.User_ID, 
                      dbo.CRS_tmpReport.Empl_ID, dbo.CRS_tmpReport.LName, dbo.CRS_tmpReport.FName, dbo.CRS_tmpReport.MIName, dbo.CRS_tmpReport.DOPE, 
                      dbo.CRS_tmpReport.DOT, dbo.CRS_tmpReport.Active, dbo.CRS_tmpReport.ORG, dbo.CRS_tmpReport.Rev_Code, dbo.CRS_tmpReport.Grade_Category, 
                      dbo.CRS_tmpReport.SU1, dbo.CRS_tmpReport.SU1_Name, dbo.CRS_tmpReport.SU2, dbo.CRS_tmpReport.SU2_Name, dbo.CRS_tmpReport.SU3, 
                      dbo.CRS_tmpReport.SU3_Name, dbo.CRS_tmpReport.SU4, dbo.CRS_tmpReport.SU4_Name, dbo.CRS_tmpReport.SI1, dbo.CRS_tmpReport.PI1, 
                      dbo.CRS_tmpReport.GR1, dbo.CRS_tmpReport.RCol1, dbo.CRS_tmpReport.Row1, dbo.CRS_tmpReport.Bon1, dbo.CRS_tmpReport.BonType1, 
                      dbo.CRS_tmpReport.SI2, dbo.CRS_tmpReport.PI2, dbo.CRS_tmpReport.GR2, dbo.CRS_tmpReport.RCol2, dbo.CRS_tmpReport.Row2, 
                      dbo.CRS_tmpReport.Bon2, dbo.CRS_tmpReport.BonType2, dbo.CRS_tmpReport.SI3, dbo.CRS_tmpReport.PI3, dbo.CRS_tmpReport.GR3, 
                      dbo.CRS_tmpReport.RCol3, dbo.CRS_tmpReport.Row3, dbo.CRS_tmpReport.Bon3, dbo.CRS_tmpReport.BonType3, dbo.CRS_tmpReport.SI4, 
                      dbo.CRS_tmpReport.PI4, dbo.CRS_tmpReport.RCol4, dbo.CRS_tmpReport.Row4, dbo.CRS_tmpReport.Bon4, dbo.CRS_tmpReport.BonType4, 
                      dbo.CRS_tmpReport.Cur_Sal, dbo.CRS_tmpReport.New_Sal, dbo.CRS_tmpReport.Cur_Grade, dbo.CRS_tmpReport.Cur_GR_Step, 
                      dbo.CRS_tmpReport.New_Grade, dbo.CRS_tmpReport.New_GR_Step, dbo.CRS_tmpReport.Cur_Bon, dbo.CRS_tmpReport.Cur_Rate, 
                      dbo.CRS_tmpReport.[TimeStamp], dbo.CRS_tmpReport.YearVal, dbo.CRS_tmpReport.FullTime_Percent, dbo.CRS_tmpReport.Util_Percent, 
                      dbo.CRS_tmpReport.Sal2, dbo.CRS_tmpReport.Sal3, dbo.CRS_tmpReport.Sal_Inc_Tot, dbo.CRS_tmpReport.GR_Step1, dbo.CRS_tmpReport.GR_Step2, 
                      dbo.CRS_tmpReport.Grade_Step_Min3
FROM         dbo.CRS_tmpReport INNER JOIN
                      dbo.CRS_tblSum_ChgHrs_by_Empl ON dbo.CRS_tmpReport.Empl_ID = dbo.CRS_tblSum_ChgHrs_by_Empl.EMPL_ID INNER JOIN
                      dbo.CRS_tblStaffBonus_Mike ON dbo.CRS_tmpReport.Empl_ID = dbo.CRS_tblStaffBonus_Mike.Empl_ID LEFT OUTER JOIN
                      dbo.vw_R_Empl_DOPE ON dbo.CRS_tmpReport.Empl_ID = dbo.vw_R_Empl_DOPE.GENL_ID
