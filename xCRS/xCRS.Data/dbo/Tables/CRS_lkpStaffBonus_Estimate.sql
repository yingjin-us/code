CREATE TABLE [dbo].[CRS_lkpStaffBonus_Estimate] (
    [ReviewYear]          CHAR (4)     NULL,
    [Grade]               CHAR (2)     NULL,
    [BonAmt]              MONEY        NULL,
    [Notes]               VARCHAR (50) NULL,
    [Bon_rate]            MONEY        NULL,
    [Is_Percent]          BIT          NULL,
    [Min_percent]         NUMERIC (18) NULL,
    [FullTime_Hours]      NUMERIC (5)  NULL,
    [Prorate_Hours]       NUMERIC (5)  NULL,
    [Float_Holiday_Hours] NUMERIC (2)  NULL,
    [ID]                  INT          IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_CRS_lkpStaffBonus] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

