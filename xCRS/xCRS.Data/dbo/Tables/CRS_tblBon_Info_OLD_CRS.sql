﻿CREATE TABLE [dbo].[CRS_tblBon_Info_OLD_CRS] (
    [Empl_ID]    NVARCHAR (12) NOT NULL,
    [Effect_DT]  DATETIME      NOT NULL,
    [Bon_Type]   CHAR (3)      NOT NULL,
    [Bon_Amt]    MONEY         NULL,
    [ReviewYear] SMALLINT      NULL
);

