CREATE TABLE [dbo].[CRS_lkpExportData] (
    [CaptionName] VARCHAR (50) NULL,
    [TableName]   VARCHAR (50) NOT NULL,
    [IsActive]    BIT          NULL,
    CONSTRAINT [PK_CRS_lkpExportData] PRIMARY KEY CLUSTERED ([TableName] ASC) WITH (FILLFACTOR = 90)
);

