CREATE TABLE [dbo].[CRS_lkpGrade_Step] (
    [sal]   MONEY          NOT NULL,
    [grade] DECIMAL (5, 2) NULL,
    CONSTRAINT [PK_CRS_lkpGrade_Step] PRIMARY KEY CLUSTERED ([sal] ASC) WITH (FILLFACTOR = 90)
);

