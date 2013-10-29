﻿CREATE TABLE [dbo].[CRS_tblSal_Info] (
    [Empl_ID]          NVARCHAR (12)   NOT NULL,
    [Effect_DT]        SMALLDATETIME   NOT NULL,
    [Hur_Rate]         MONEY           NULL,
    [Sal]              MONEY           NULL,
    [Sal_Inc]          MONEY           NULL,
    [Per_Inc]          DECIMAL (18, 4) NULL,
    [Grade]            NVARCHAR (3)    NULL,
    [Grade_Step]       DECIMAL (18, 2) NULL,
    [Rating_Col]       NVARCHAR (3)    NULL,
    [Rating_Row]       NVARCHAR (2)    NULL,
    [Bon_Tot]          MONEY           NULL,
    [Grade_Category]   NVARCHAR (2)    NULL,
    [Change_Code]      NVARCHAR (2)    NULL,
    [UpdateID]         NVARCHAR (50)   NULL,
    [UpdateDate]       DATETIME        NULL,
    [ReviewYear]       SMALLINT        NULL,
    [Notes]            VARCHAR (1000)  NULL,
    [Perf_Rating]      NVARCHAR (3)    NULL,
    [Growth_Rating]    NVARCHAR (3)    NULL,
    [PostToCP]         BIT             NULL,
    [SalInc_InPercent] BIT             NULL,
    CONSTRAINT [PK_CRS_tblSal_Info] PRIMARY KEY CLUSTERED ([Empl_ID] ASC, [Effect_DT] ASC) WITH (FILLFACTOR = 90)
);
