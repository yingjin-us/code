CREATE TABLE [dbo].[CRS_lkpSupportOrgException] (
    [ID]     INT          IDENTITY (1, 1) NOT NULL,
    [ORG_ID] VARCHAR (10) NOT NULL,
    CONSTRAINT [PK_crs_lkpSupportOrgException] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

