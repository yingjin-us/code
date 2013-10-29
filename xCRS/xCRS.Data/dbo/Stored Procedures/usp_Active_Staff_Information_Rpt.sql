CREATE procedure [dbo].[usp_Active_Staff_Information_Rpt]
as

SELECT
    CRS_tmpReport.Empl_ID, CRS_tmpReport.LName, CRS_tmpReport.FName, CRS_tmpReport.MIName, CRS_tmpReport.DOSE, CRS_tmpReport.DOPE, CRS_tmpReport.Active, CRS_tmpReport.ORG, CRS_tmpReport.Grade_Category, CRS_tmpReport.SU1_Name, CRS_tmpReport.Cur_Sal, CRS_tmpReport.Cur_Grade, CRS_tmpReport.Cur_Rate, CRS_tmpReport.Util_Percent, CRS_tmpReport.FullTime_Percent,
    vw_Empl_Info.EMPL_CLASS_CD, vw_Empl_Info.title, vw_Empl_Info.flsa_cd
    , (select top 1 Grade_Step from CRS_tblSal_Info s where s.empl_id = CRS_tmpReport.Empl_id  order by s.effect_dt desc) as Cur_GR_Step
    , CRS_tmpReport.RCol3
    , CRS_tmpReport.Row3
    , CRS_tmpReport.ORG
    , CRS_tmpReport.Sal2
    , CRS_tmpReport.Sal3
    , CRS_tmpReport.SI3
    , CRS_tmpReport.Sal_Inc_Tot
    , CRS_tmpReport.FullTime_Percent
    , CRS_tmpReport.LName
    , CRS_tmpReport.FName
    , CRS_tmpReport.MIName
    , CRS_tmpReport.RCol4
    , CRS_tmpReport.Row4
    , CRS_tmpReport.Active
    , CRS_tmpReport.Util_Percent    
    , CRS_tmpReport.GR_Step2
FROM
    CRS_tmpReport_Downloaded CRS_tmpReport,
    vw_Empl_Info vw_Empl_Info    
WHERE
    CRS_tmpReport.Empl_ID = vw_Empl_Info.EMPL_ID AND
    CRS_tmpReport.Active = 1  
ORDER BY
    CRS_tmpReport.Cur_Sal DESC,
    CRS_tmpReport.LName ASC,
    CRS_tmpReport.FName ASC

