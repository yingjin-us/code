CREATE TABLE [dbo].[del_crs_tblempl_certification] (
    [RecordID]          INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeID]        INT           NOT NULL,
    [CertificationName] VARCHAR (100) NULL,
    [CertificationDate] VARCHAR (10)  NULL,
    [IssuedBy]          VARCHAR (100) NULL,
    [DateCreated]       DATETIME      NULL,
    [DateUpdated]       DATETIME      NULL
);

