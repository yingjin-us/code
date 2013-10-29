CREATE TABLE [dbo].[CRS_lkpSal_Inc_Guidlines_excel] (
    [Grade]              FLOAT (53)     NULL,
    [Sal_From]           MONEY          NULL,
    [Sal_To]             MONEY          NULL,
    [Review_Performance] NVARCHAR (255) NULL,
    [Review_Cat]         NVARCHAR (255) NULL,
    [Sal_Inc_Lo]         MONEY          NULL,
    [Sal_Inc_Mi]         NVARCHAR (255) NULL,
    [Sal_Inc_Hi]         MONEY          NULL,
    [PER_MIN]            FLOAT (53)     NULL,
    [PER_MAX]            FLOAT (53)     NULL,
    [IsSupportExempt]    BIT            NOT NULL
);

