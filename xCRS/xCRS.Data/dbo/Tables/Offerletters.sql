CREATE TABLE [dbo].[Offerletters] (
    [ReviewYear]    CHAR (4)      NOT NULL,
    [Empl_id]       VARCHAR (15)  NOT NULL,
    [hiring_commit] VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_Offerletters] PRIMARY KEY CLUSTERED ([ReviewYear] ASC, [Empl_id] ASC) WITH (FILLFACTOR = 90)
);

