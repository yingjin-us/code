CREATE TABLE [dbo].[DegreeAbbreviation] (
    [DegreeID]    VARCHAR (10) NOT NULL,
    [DegreeType]  VARCHAR (10) NOT NULL,
    [DateCreated] DATETIME     NOT NULL,
    [DateUpdated] DATETIME     NULL,
    [Status]      BIT          NOT NULL,
    CONSTRAINT [FK_DegreeAbbreviation_DegreeType] FOREIGN KEY ([DegreeType]) REFERENCES [dbo].[DegreeType] ([DegreeType])
);

