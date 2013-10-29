CREATE TABLE [dbo].[CRS_lkpUserAccessLevel] (
    [CodeID] INT          IDENTITY (1, 1) NOT NULL,
    [Code]   CHAR (3)     NOT NULL,
    [Filter] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_CRS_lkpUserAccessLevel] PRIMARY KEY CLUSTERED ([CodeID] ASC) WITH (FILLFACTOR = 90)
);

