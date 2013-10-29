CREATE TABLE [dbo].[crs_lkpReviewProgramType] (
    [ReviewProgram] VARCHAR (50) NOT NULL,
    [ProgramType]   VARCHAR (50) NULL,
    [ReviewType]    VARCHAR (50) NULL,
    CONSTRAINT [PK_crs_lkpReviewProgramType] PRIMARY KEY CLUSTERED ([ReviewProgram] ASC) WITH (FILLFACTOR = 90)
);

