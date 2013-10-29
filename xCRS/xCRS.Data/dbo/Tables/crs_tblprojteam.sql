CREATE TABLE [dbo].[crs_tblprojteam] (
    [Empl_ID]    NVARCHAR (12) NOT NULL,
    [Proj_ID]    VARCHAR (50)  NOT NULL,
    [UpdateID]   NVARCHAR (12) NOT NULL,
    [UpdateDate] DATETIME      NOT NULL,
    CONSTRAINT [PK_crs_tblprojteam] PRIMARY KEY CLUSTERED ([Empl_ID] ASC, [Proj_ID] ASC) WITH (FILLFACTOR = 90)
);

