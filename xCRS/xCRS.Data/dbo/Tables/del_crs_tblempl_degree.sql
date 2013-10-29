CREATE TABLE [dbo].[del_crs_tblempl_degree] (
    [RecordID]      INT            IDENTITY (1, 1) NOT NULL,
    [EmployeeID]    INT            NOT NULL,
    [DegreeID]      NVARCHAR (50)  NULL,
    [DegreeType]    NVARCHAR (50)  NULL,
    [Major]         NVARCHAR (200) NULL,
    [Minor]         NVARCHAR (100) NULL,
    [School]        NVARCHAR (200) NULL,
    [Concentration] NVARCHAR (200) NULL,
    [DegreeDate]    NVARCHAR (50)  NULL,
    [DateCreate]    DATETIME       NULL,
    [DateUpdated]   DATETIME       NULL
);

