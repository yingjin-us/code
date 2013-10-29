CREATE TABLE [dbo].[HRTransCaseDetail] (
    [id]                            INT            IDENTITY (1, 1) NOT NULL,
    [linkBetweenTransAndQuestionId] INT            NOT NULL,
    [HRTransCaseId]                 INT            NOT NULL,
    [FreeFormAnswer]                NVARCHAR (200) NULL,
    [FixFormAnswerId]               INT            NULL,
    [nextQuestionId]                INT            NULL,
    [createdBy]                     NVARCHAR (12)  NULL,
    [createdOn]                     DATETIME       NULL,
    [updatedBy]                     NVARCHAR (12)  NULL,
    [updatedOn]                     DATETIME       NULL,
    CONSTRAINT [PK_HRTransCaseDetail] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_HRTransCaseDetail_crs_tblempl_info] FOREIGN KEY ([createdBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransCaseDetail_crs_tblempl_info1] FOREIGN KEY ([updatedBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransCaseDetail_HRTransCase] FOREIGN KEY ([HRTransCaseId]) REFERENCES [dbo].[HRTransCase] ([id]),
    CONSTRAINT [FK_HRTransCaseDetail_HRTransCaseDetail] FOREIGN KEY ([nextQuestionId]) REFERENCES [dbo].[HRTransCaseDetail] ([id]),
    CONSTRAINT [FK_HRTransCaseDetail_HRTransQuestionAnswer] FOREIGN KEY ([FixFormAnswerId]) REFERENCES [dbo].[HRTransQuestionAnswer] ([id]),
    CONSTRAINT [FK_HRTransCaseDetail_LinkBetweenTransAndQuestion] FOREIGN KEY ([linkBetweenTransAndQuestionId]) REFERENCES [dbo].[LinkBetweenTransAndQuestion] ([id])
);

