CREATE TABLE [dbo].[CRS_lkpReportItems] (
    [Caption_Name]         NVARCHAR (150) NULL,
    [Actual_Name]          NVARCHAR (150) NULL,
    [Sort_Order]           DECIMAL (18)   NULL,
    [ShowInDownloadModule] BIT            NOT NULL,
    [AdminOnly]            BIT            NULL
);

