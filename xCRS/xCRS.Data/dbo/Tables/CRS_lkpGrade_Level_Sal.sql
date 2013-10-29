CREATE TABLE [dbo].[CRS_lkpGrade_Level_Sal] (
    [Empl_Grade] CHAR (2) NOT NULL,
    [DateVal]    DATETIME NOT NULL,
    [From_Dol]   MONEY    NOT NULL,
    [To_Dol]     MONEY    NULL,
    CONSTRAINT [PK_CRS_lkpGrade_Level_Sal] PRIMARY KEY CLUSTERED ([Empl_Grade] ASC) WITH (FILLFACTOR = 90)
);

