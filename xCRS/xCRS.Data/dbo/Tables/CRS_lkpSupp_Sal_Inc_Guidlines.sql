CREATE TABLE [dbo].[CRS_lkpSupp_Sal_Inc_Guidlines] (
    [Program]    VARCHAR (50)   NOT NULL,
    [Grade]      NVARCHAR (255) NOT NULL,
    [Sal_From]   FLOAT (53)     NOT NULL,
    [Sal_To]     FLOAT (53)     NOT NULL,
    [SI_Base]    FLOAT (53)     NULL,
    [SI_Perf]    FLOAT (53)     NULL,
    [Reviewyear] VARCHAR (4)    NOT NULL,
    CONSTRAINT [PK_CRS_lkpSupp_Sal_Inc_Guidlines] PRIMARY KEY CLUSTERED ([Program] ASC, [Sal_From] ASC, [Sal_To] ASC) WITH (FILLFACTOR = 90)
);

