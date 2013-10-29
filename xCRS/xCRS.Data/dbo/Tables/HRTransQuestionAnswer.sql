CREATE TABLE [dbo].[HRTransQuestionAnswer] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [HRTransQuestionId] INT            NOT NULL,
    [AnswerText]        NVARCHAR (MAX) NULL,
    [IsCorrectAnswer]   BIT            NULL,
    [createdBy]         NVARCHAR (12)  NULL,
    [createdOn]         DATETIME       NULL,
    [updatedBy]         NVARCHAR (12)  NULL,
    [updatedOn]         DATETIME       NULL,
    CONSTRAINT [PK_HRTransQuestionAnswer] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_HRTransQuestionAnswer_crs_tblempl_info] FOREIGN KEY ([createdBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransQuestionAnswer_crs_tblempl_info1] FOREIGN KEY ([updatedBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransQuestionAnswer_HRTransQuestion] FOREIGN KEY ([HRTransQuestionId]) REFERENCES [dbo].[HRTransQuestion] ([id])
);

