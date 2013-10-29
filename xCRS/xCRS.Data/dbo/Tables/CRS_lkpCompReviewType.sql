CREATE TABLE [dbo].[CRS_lkpCompReviewType] (
    [ID]          INT          IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (5)  NULL,
    [Description] VARCHAR (50) NULL,
    CONSTRAINT [PK_CRS_lkpCompReviewType] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

