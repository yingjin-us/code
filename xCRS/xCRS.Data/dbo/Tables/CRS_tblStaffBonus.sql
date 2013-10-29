CREATE TABLE [dbo].[CRS_tblStaffBonus] (
    [Empl_ID]         CHAR (10)  NOT NULL,
    [Effect_DT]       DATETIME   NULL,
    [BonAmt_Calc]     SMALLMONEY NULL,
    [BonAmt_Override] SMALLMONEY NULL,
    [ReviewYear]      SMALLINT   NULL,
    CONSTRAINT [PK_CRS_tblStaffBonus] PRIMARY KEY CLUSTERED ([Empl_ID] ASC) WITH (FILLFACTOR = 90)
);

