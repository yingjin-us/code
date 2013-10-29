CREATE TABLE [dbo].[crs_lkpBonusGuidelines] (
    [Grade]         VARCHAR (3)  NULL,
    [Salary]        VARCHAR (10) NULL,
    [Participation] FLOAT (53)   NULL,
    [Expected]      FLOAT (53)   NULL,
    [Maximum]       FLOAT (53)   NULL,
    [ID]            INT          IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_crs_lkpBonusGuidelines] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [UK_crs_lkpBonusGuidelines] UNIQUE NONCLUSTERED ([Grade] ASC) WITH (FILLFACTOR = 90)
);

