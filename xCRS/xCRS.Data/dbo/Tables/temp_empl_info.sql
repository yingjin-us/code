CREATE TABLE [dbo].[temp_empl_info] (
    [Empl_ID]            NVARCHAR (12)   NOT NULL,
    [Rev_Code]           NVARCHAR (9)    NULL,
    [DOG]                SMALLDATETIME   NULL,
    [Review_Program]     NVARCHAR (10)   NULL,
    [Util_Percent]       DECIMAL (18, 2) NULL,
    [ACTIVE]             BIT             NOT NULL,
    [Archived]           BIT             NOT NULL,
    [FullTime_Percent]   DECIMAL (18)    NULL,
    [Refresh_Run_MMYY]   VARCHAR (10)    NULL,
    [Years_of_Exp]       INT             NULL,
    [High_Edu]           VARCHAR (50)    NULL,
    [Hiring_Commitement] VARCHAR (5000)  NULL,
    [Sub_unit]           VARCHAR (50)    NULL,
    [Family_code]        VARCHAR (50)    NULL
);

