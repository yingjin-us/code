
-- View



CREATE   VIEW  [dbo].[vw_R_Comp_Report_With_Bonus_103012]
AS
SELECT     CRS_tmpReport.User_ID, CRS_tmpReport.Empl_ID,  CRS_tmpReport.LName,  CRS_tmpReport.FName,  CRS_tmpReport.MIName, 
                       CRS_tmpReport.DOPE,  CRS_tmpReport.DOT,  CRS_tmpReport.Active,  CRS_tmpReport.ORG,  CRS_tmpReport.Rev_Code, 
                       CRS_tmpReport.Grade_Category,  CRS_tmpReport.SU1,  CRS_tmpReport.SU1_Name,  CRS_tmpReport.SU2, 
                       CRS_tmpReport.SU2_Name,  CRS_tmpReport.SU3,  CRS_tmpReport.SU3_Name,  CRS_tmpReport.SU4, 
                       CRS_tmpReport.SU4_Name,  CRS_tmpReport.SI2,  CRS_tmpReport.PI2,  CRS_tmpReport.GR2,  CRS_tmpReport.RCol2, 
                       CRS_tmpReport.Row2,  CRS_tmpReport.Bon2,  CRS_tmpReport.SI3,  CRS_tmpReport.PI3,  CRS_tmpReport.GR3, 
                       CRS_tmpReport.RCol3,  CRS_tmpReport.Row3,  CRS_tmpReport.Bon3,  CRS_tmpReport.SI4,  CRS_tmpReport.PI4, 
                       CRS_tmpReport.RCol4,  CRS_tmpReport.Row4,  CRS_tmpReport.Bon4,  CRS_tmpReport.Cur_Sal,  CRS_tmpReport.New_Sal, 
                       CRS_tmpReport.Cur_Grade,  CRS_tmpReport.Cur_GR_Step,  CRS_tmpReport.New_Grade,  CRS_tmpReport.New_GR_Step, 
                       CRS_tmpReport.Cur_Bon,  CRS_tmpReport.Cur_Rate,  CRS_tmpReport.YearVal,  CRS_tmpBonType.All_Bon_Type, 
                       CRS_tmpBonType.Sum_Bon_Amt,  vw_R_Bon_Type_BSA.Bon_Type AS Bon_Type_BSA, ISNULL( vw_R_Bon_Type_BSA.Bon_Amt, 0) 


                      AS Bon_Amt_BSA,  vw_R_Bon_Type_BST.Bon_Type AS Bon_Type_BST, ISNULL( vw_R_Bon_Type_BST.Bon_Amt, 0) AS Bon_Amt_BST, 
                       vw_R_Bon_Type_BNH.Bon_Type AS Bon_Type_BNH, ISNULL( vw_R_Bon_Type_BNH.Bon_Amt, 0) AS Bon_Amt_BNH
FROM          CRS_tmpReport_downloaded CRS_tmpReport LEFT OUTER JOIN
                       vw_R_Bon_Type_BSA ON  CRS_tmpReport.Empl_ID =  vw_R_Bon_Type_BSA.Empl_ID AND 

                       CRS_tmpReport.YearVal =  vw_R_Bon_Type_BSA.Effect_Year LEFT OUTER JOIN
                       vw_R_Bon_Type_BNH ON  CRS_tmpReport.Empl_ID =  vw_R_Bon_Type_BNH.Empl_ID AND 
                       CRS_tmpReport.YearVal =  vw_R_Bon_Type_BNH.Effect_Year LEFT OUTER JOIN
                       vw_R_Bon_Type_BST ON  CRS_tmpReport.Empl_ID =  vw_R_Bon_Type_BST.Empl_ID AND 
                       CRS_tmpReport.YearVal =  vw_R_Bon_Type_BST.Effect_Year LEFT OUTER JOIN
                       CRS_tmpBonType ON  CRS_tmpReport.Empl_ID =  CRS_tmpBonType.Empl_ID








