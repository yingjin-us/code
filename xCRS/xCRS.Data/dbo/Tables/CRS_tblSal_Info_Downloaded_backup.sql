﻿CREATE TABLE [dbo].[CRS_tblSal_Info_Downloaded_backup] (
    [Empl_ID]            NVARCHAR (12)   NOT NULL,
    [Effect_DT]          DATETIME        NOT NULL,
    [Hur_Rate]           MONEY           NULL,
    [Sal]                MONEY           NULL,
    [Sal_Inc]            MONEY           NULL,
    [Per_Inc]            NUMERIC (18, 4) NULL,
    [Grade]              NVARCHAR (3)    NULL,
    [Grade_Step]         NUMERIC (18, 2) NULL,
    [Rating_Col]         NVARCHAR (3)    NULL,
    [Rating_Row]         NVARCHAR (2)    NULL,
    [Bon_Tot]            MONEY           NULL,
    [Grade_Category]     NVARCHAR (2)    NULL,
    [Change_Code]        CHAR (1)        NULL,
    [UpdateID]           NVARCHAR (30)   NULL,
    [UpdateDate]         DATETIME        NULL,
    [Supervisor_Empl_ID] NVARCHAR (12)   NOT NULL,
    [Reviewed]           BIT             NOT NULL,
    [Uploaded]           BIT             NOT NULL,
    [Notes]              VARCHAR (1000)  NULL,
    [Perf_Rating]        NVARCHAR (2)    NULL,
    [Growth_Rating]      NVARCHAR (2)    NULL,
    [SalInc_InPercent]   BIT             NULL
);
