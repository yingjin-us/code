CREATE TABLE [dbo].[CRS_tblStaffBonus_Estimate] (
    [Empl_ID]         CHAR (10)  NOT NULL,
    [Effect_DT]       DATETIME   NULL,
    [BonAmt_Calc]     SMALLMONEY NULL,
    [BonAmt_Override] SMALLMONEY NULL,
    [ReviewYear]      SMALLINT   NULL
);

