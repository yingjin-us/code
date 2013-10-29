CREATE TABLE [dbo].[crs_tblempl_info] (
    [Empl_ID]            NVARCHAR (12)   NOT NULL,
    [Rev_Code]           NVARCHAR (9)    NULL,
    [DOG]                DATETIME        NULL,
    [Review_Program]     NVARCHAR (10)   NULL,
    [Util_Percent]       NUMERIC (18, 2) NULL,
    [ACTIVE]             BIT             NOT NULL,
    [Archived]           BIT             NOT NULL,
    [FullTime_Percent]   NUMERIC (18)    NULL,
    [Refresh_Run_MMYY]   VARCHAR (10)    NULL,
    [Years_of_Exp]       INT             NULL,
    [High_Edu]           VARCHAR (50)    NULL,
    [Hiring_commitement] VARCHAR (5000)  NULL,
    [Sub_unit]           VARCHAR (50)    NULL,
    [Family_code]        VARCHAR (50)    NULL,
    [TobeReviewed]       BIT             NULL,
    [fldReviewProcess]   VARCHAR (50)    NULL,
    [CompReviewType]     INT             NULL,
    [Perf_Review]        INT             NULL,
    [Grade_Category]     VARCHAR (1)     NULL,
    [isbrowse_only]      INT             CONSTRAINT [DF_crs_tblempl_info_isbrowse_only] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_crs_tblempl_info_1] PRIMARY KEY CLUSTERED ([Empl_ID] ASC) WITH (FILLFACTOR = 90)
);

