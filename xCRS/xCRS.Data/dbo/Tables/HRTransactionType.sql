CREATE TABLE [dbo].[HRTransactionType] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [name]        NVARCHAR (200) NOT NULL,
    [description] NVARCHAR (MAX) NULL,
    [createdBy]   NVARCHAR (12)  NULL,
    [createdOn]   DATETIME       NULL,
    [updatedBy]   NVARCHAR (12)  NULL,
    [updatedOn]   DATETIME       NULL,
    CONSTRAINT [PK_HRTransactionType] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_HRTransactionType_crs_tblempl_info] FOREIGN KEY ([createdBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransactionType_crs_tblempl_info1] FOREIGN KEY ([updatedBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID])
);

