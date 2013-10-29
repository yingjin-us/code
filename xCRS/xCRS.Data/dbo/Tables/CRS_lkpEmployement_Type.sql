CREATE TABLE [dbo].[CRS_lkpEmployement_Type] (
    [Employement_code]       VARCHAR (15)  NOT NULL,
    [Employment_Description] VARCHAR (100) NULL,
    CONSTRAINT [PK_CRS_lkpEmployement_Type] PRIMARY KEY CLUSTERED ([Employement_code] ASC) WITH (FILLFACTOR = 90)
);

