CREATE TABLE [dbo].[DegreeType] (
    [DegreeType]   VARCHAR (10) NOT NULL,
    [DateCreated]  DATETIME     NOT NULL,
    [DateUpdated]  DATETIME     NULL,
    [Status]       BIT          NOT NULL,
    [DisplayOrder] TINYINT      NULL,
    CONSTRAINT [PK_DegreeType] PRIMARY KEY CLUSTERED ([DegreeType] ASC) WITH (FILLFACTOR = 90)
);

