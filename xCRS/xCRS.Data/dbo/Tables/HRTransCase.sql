CREATE TABLE [dbo].[HRTransCase] (
    [id]                  INT            IDENTITY (1, 1) NOT NULL,
    [HRTransactionTypeId] INT            NOT NULL,
    [createdBy]           NVARCHAR (12)  NULL,
    [createdOn]           DATETIME       NULL,
    [updatedBy]           NVARCHAR (12)  NULL,
    [updatedOn]           DATETIME       NULL,
    [description]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_HRTransCase] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_HRTransCase_crs_tblempl_info] FOREIGN KEY ([createdBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransCase_crs_tblempl_info1] FOREIGN KEY ([updatedBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransCase_HRTransactionType] FOREIGN KEY ([HRTransactionTypeId]) REFERENCES [dbo].[HRTransactionType] ([id])
);

