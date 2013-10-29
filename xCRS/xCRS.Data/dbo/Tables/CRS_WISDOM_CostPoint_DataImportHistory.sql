CREATE TABLE [dbo].[CRS_WISDOM_CostPoint_DataImportHistory] (
    [HistoryID]      INT          IDENTITY (1, 1) NOT NULL,
    [ImportDataTime] DATETIME     NOT NULL,
    [ImportUser]     VARCHAR (50) NOT NULL,
    [IDMaster]       BIT          NOT NULL,
    [EMPL]           BIT          NOT NULL,
    [EMPL_LAB_INFO]  BIT          NOT NULL,
    [GENL_UDEF]      BIT          NOT NULL,
    CONSTRAINT [PK_CRS_WISDOM_CostPoint_DataImportHistory] PRIMARY KEY CLUSTERED ([HistoryID] ASC) WITH (FILLFACTOR = 90)
);

