CREATE TABLE [dbo].[LinkBetweenTransAndQuestion] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [HRTransTypeId]     INT            NOT NULL,
    [HRTransQuestionId] INT            NOT NULL,
    [Description]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_LinkBetweenTransAndQuestion] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_LinkBetweenTransAndQuestion_HRTransactionType] FOREIGN KEY ([HRTransTypeId]) REFERENCES [dbo].[HRTransactionType] ([id]),
    CONSTRAINT [FK_LinkBetweenTransAndQuestion_HRTransQuestion] FOREIGN KEY ([HRTransQuestionId]) REFERENCES [dbo].[HRTransQuestion] ([id])
);

