CREATE TABLE [dbo].[CRS_tblStaffBonus_Mike] (
    [Empl_ID]         NVARCHAR (255) NULL,
    [HOMEORG]         NVARCHAR (255) NULL,
    [LST_NAME]        NVARCHAR (255) NULL,
    [FIR_NAME]        NVARCHAR (255) NULL,
    [BonAmt_Override] SMALLMONEY     NULL,
    [GRADE]           FLOAT (53)     NULL,
    [YTDHRS]          FLOAT (53)     NULL,
    [YTDHRSLWOP]      FLOAT (53)     NULL,
    [YTDFMLA]         FLOAT (53)     NULL,
    [Sum_ChgHrs]      FLOAT (53)     NULL,
    [STATUS]          NVARCHAR (255) NULL,
    [HRSAVAL]         FLOAT (53)     NULL,
    [ACTPERC]         FLOAT (53)     NULL,
    [DOSE]            SMALLDATETIME  NULL,
    [TYTDGROSS]       FLOAT (53)     NULL,
    [CHART]           FLOAT (53)     NULL,
    [BonAmt_Calc]     SMALLMONEY     NULL
);

