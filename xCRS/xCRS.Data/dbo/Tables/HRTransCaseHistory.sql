CREATE TABLE [dbo].[HRTransCaseHistory] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [HRTransCaseId] INT            NULL,
    [reviewedBy]    NVARCHAR (12)  NULL,
    [reviewedOn]    DATETIME       NULL,
    [reviewNote]    NVARCHAR (MAX) NULL,
    [Approved]      BIT            NULL,
    CONSTRAINT [PK_HRTransCaseHistory] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_HRTransCaseHistory_crs_tblempl_info] FOREIGN KEY ([reviewedBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransCaseHistory_HRTransCase] FOREIGN KEY ([HRTransCaseId]) REFERENCES [dbo].[HRTransCase] ([id])
);

