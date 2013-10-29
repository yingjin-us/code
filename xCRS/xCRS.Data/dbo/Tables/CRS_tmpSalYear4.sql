CREATE TABLE [dbo].[CRS_tmpSalYear4] (
    [Empl_ID]        NVARCHAR (12)   NOT NULL,
    [Effect_DT]      DATETIME        NOT NULL,
    [Hur_Rate]       MONEY           NULL,
    [Sal]            MONEY           NULL,
    [Sal_Inc]        MONEY           NULL,
    [Per_Inc]        DECIMAL (18, 4) NULL,
    [Grade]          NVARCHAR (3)    NULL,
    [Grade_Step]     DECIMAL (18, 2) NULL,
    [Rating_Col]     NVARCHAR (3)    NULL,
    [Rating_Row]     CHAR (2)        NULL,
    [Bon_Tot]        MONEY           NULL,
    [Grade_Category] NVARCHAR (2)    NULL,
    [Change_Code]    VARCHAR (2)     NULL,
    [Sal_Inc_Tot]    MONEY           NULL,
    [Grade_Step_Min] DECIMAL (18, 2) NULL
);

