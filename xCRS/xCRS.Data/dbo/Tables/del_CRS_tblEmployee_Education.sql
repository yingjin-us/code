CREATE TABLE [dbo].[del_CRS_tblEmployee_Education] (
    [ID]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [Empl_ID]        VARCHAR (15)  NULL,
    [Degree_ID]      INT           NULL,
    [Degree_Desc]    VARCHAR (255) NULL,
    [School]         VARCHAR (255) NULL,
    [Major]          VARCHAR (255) NULL,
    [Minor]          VARCHAR (255) NULL,
    [Date_Completed] VARCHAR (255) NULL,
    [Degree_Code]    VARCHAR (10)  NULL,
    CONSTRAINT [PK_Employee_Education] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_CRS_tblEmployee_Education]
    ON [dbo].[del_CRS_tblEmployee_Education]([Empl_ID] ASC) WITH (FILLFACTOR = 90);

