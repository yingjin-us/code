CREATE TABLE [dbo].[HRTransQuestion] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [QuestionText] NVARCHAR (MAX) NOT NULL,
    [createdBy]    NVARCHAR (12)  NULL,
    [createdOn]    DATETIME       NULL,
    [updatedBy]    NVARCHAR (12)  NULL,
    [updatedOn]    DATETIME       NULL,
    CONSTRAINT [PK_HRTransQuestion] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_HRTransQuestion_crs_tblempl_info] FOREIGN KEY ([createdBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID]),
    CONSTRAINT [FK_HRTransQuestion_crs_tblempl_info1] FOREIGN KEY ([updatedBy]) REFERENCES [dbo].[crs_tblempl_info] ([Empl_ID])
);

