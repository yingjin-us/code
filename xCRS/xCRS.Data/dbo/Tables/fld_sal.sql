CREATE TABLE [dbo].[fld_sal] (
    [empl_id]          VARCHAR (12)    NOT NULL,
    [effect_dt]        DATETIME        NOT NULL,
    [hrly_amt]         NUMERIC (10, 4) NOT NULL,
    [ann_amt]          NUMERIC (15, 7) NULL,
    [Sal_Inc]          INT             NOT NULL,
    [Per_Inc]          INT             NOT NULL,
    [sal_Grade_cd]     VARCHAR (10)    NULL,
    [Grade_Step]       INT             NULL,
    [Rating_Col]       VARCHAR (2)     NOT NULL,
    [Rating_Row]       VARCHAR (1)     NOT NULL,
    [Bon_Tot]          INT             NOT NULL,
    [Grade_Category]   INT             NULL,
    [Change_Code]      VARCHAR (1)     NOT NULL,
    [UpdateID]         VARCHAR (6)     NOT NULL,
    [UpdateDate]       DATETIME        NOT NULL,
    [effect_year]      INT             NULL,
    [Notes]            VARCHAR (1)     NOT NULL,
    [Perf_Rating]      INT             NULL,
    [Growth_Rating]    INT             NULL,
    [PostToCP]         INT             NULL,
    [SalInc_InPercent] INT             NOT NULL
);

