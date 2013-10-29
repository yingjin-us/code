
CREATE            Procedure usp_Sum_HrsByEmpl_FY_HD_Before_year  
	@pd_month as integer,
	@pd_year as varchar(4)
AS
SELECT ORA_DKHS.EMPL_ID,SUM(ACT_HRS),
    --SUM(ACT_HRS)/ 2080 * 100 as PercentFT 
    SUM(ACT_HRS)/ (select sum(hours) from pay_period_hours where month<=@pd_month) * 100 as PercentFT 
    from vw_DELTEK_EMPL_HireDate_before_010204 DK_LAB INNER JOIN
    cpprod..DELTEK.LAB_HS ORA_DKHS ON 
    DK_LAB.EMPL_ID = ORA_DKHS.EMPL_ID 
    WHERE     (ORA_DKHS.FY_CD = @pd_year) AND (ORA_DKHS.PD_NO <= @pd_month) AND (LEFT(ORA_DKHS.PROJ_ID, 4) <> '1196')
--and 	ORA_DKHS.EMPL_ID='1028658' 
    GROUP BY ORA_DKHS.EMPL_ID, DK_LAB.ORIG_HIRE_DT
    HAVING      (ORA_DKHS.EMPL_ID IS NOT NULL)
    ORDER BY SUM(ORA_DKHS.ACT_HRS) DESC

