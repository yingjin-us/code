CREATE TABLE [dbo].[wisdom_EmployeeDegree] (
    [RecordID]      INT           NOT NULL,
    [EmployeeID]    INT           NOT NULL,
    [DegreeID]      VARCHAR (10)  NOT NULL,
    [DegreeType]    VARCHAR (10)  NOT NULL,
    [Major]         VARCHAR (100) NOT NULL,
    [Minor]         VARCHAR (100) NULL,
    [School]        VARCHAR (100) NOT NULL,
    [Concentration] VARCHAR (100) NULL,
    [DegreeDate]    DATETIME      NOT NULL,
    [DateCreated]   DATETIME      NULL,
    [DateUpdated]   DATETIME      NULL
);

