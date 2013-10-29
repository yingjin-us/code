CREATE TABLE [dbo].[CRS_tblBon_Info] (
    [Empl_ID]    NVARCHAR (12) NOT NULL,
    [Effect_DT]  DATETIME      NOT NULL,
    [Bon_Type]   CHAR (3)      NOT NULL,
    [Bon_Amt]    MONEY         NULL,
    [ReviewYear] SMALLINT      NULL,
    CONSTRAINT [PK_CRS_tblBon_Info] PRIMARY KEY CLUSTERED ([Empl_ID] ASC, [Effect_DT] ASC, [Bon_Type] ASC) WITH (FILLFACTOR = 90)
);

