CREATE TABLE [dbo].[CRS_lkpSal_Inc_Guidlines] (
    [Grade]              NVARCHAR (3) NOT NULL,
    [Sal_From]           MONEY        NOT NULL,
    [Sal_To]             MONEY        NOT NULL,
    [Review_Performance] CHAR (10)    NOT NULL,
    [Review_Cat]         CHAR (10)    NOT NULL,
    [Sal_Inc_Lo]         MONEY        NULL,
    [Sal_Inc_Mi]         MONEY        NULL,
    [Sal_Inc_Hi]         MONEY        NULL,
    [PER_MIN]            FLOAT (53)   NULL,
    [PER_MAX]            FLOAT (53)   NULL,
    [IsSupportExempt]    BIT          NOT NULL,
    CONSTRAINT [PK_CRS_lkpSal_Inc_Guidlines] PRIMARY KEY CLUSTERED ([Grade] ASC, [Sal_From] ASC, [Sal_To] ASC, [Review_Performance] ASC, [Review_Cat] ASC, [IsSupportExempt] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_CRS_lkpSal_Inc_Guidlines]
    ON [dbo].[CRS_lkpSal_Inc_Guidlines]([Grade] ASC, [Sal_From] ASC, [Sal_To] ASC) WITH (FILLFACTOR = 90);

