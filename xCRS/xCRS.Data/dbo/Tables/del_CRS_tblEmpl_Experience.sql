CREATE TABLE [dbo].[del_CRS_tblEmpl_Experience] (
    [RecordID]         INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeID]       INT           NOT NULL,
    [OrganizationName] VARCHAR (100) NOT NULL,
    [Title]            VARCHAR (50)  NOT NULL,
    [StartDate]        VARCHAR (10)  NULL,
    [EndDate]          VARCHAR (10)  NULL,
    [Notes]            TEXT          NULL,
    [DateCreated]      DATETIME      NULL,
    [DateUpdated]      DATETIME      NULL
);

