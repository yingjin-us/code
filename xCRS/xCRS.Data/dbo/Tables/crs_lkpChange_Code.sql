CREATE TABLE [dbo].[crs_lkpChange_Code] (
    [change_cd]   VARCHAR (5)  NOT NULL,
    [description] VARCHAR (50) NULL,
    CONSTRAINT [PK_crs_lkpChange_Code] PRIMARY KEY CLUSTERED ([change_cd] ASC) WITH (FILLFACTOR = 90)
);

