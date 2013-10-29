CREATE TABLE [dbo].[del_CRS_tblEmployee_Experience] (
    [ID]                        BIGINT        IDENTITY (1, 1) NOT NULL,
    [Empl_ID]                   VARCHAR (50)  NOT NULL,
    [Prior_Employer]            VARCHAR (100) NOT NULL,
    [Prior_Position]            VARCHAR (100) NOT NULL,
    [Start_Date_of_Employement] VARCHAR (100) NULL,
    [End_Date_of_Employement]   VARCHAR (100) NULL,
    [Employement_code]          VARCHAR (15)  NULL,
    [Experience_code]           VARCHAR (10)  NULL,
    [Yearsof_Exp]               VARCHAR (5)   NULL,
    CONSTRAINT [PK_CRS_tblEmployee_Experience] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_CRS_tblEmployee_Experience]
    ON [dbo].[del_CRS_tblEmployee_Experience]([Empl_ID] ASC) WITH (FILLFACTOR = 90);

