CREATE TABLE [dbo].[DELTEK_CLOSEREVIEW_REPORT] (
    [Empl_ID]         VARCHAR (12)    NOT NULL,
    [effect_DT]       DATETIME        NOT NULL,
    [Last_Name]       VARCHAR (50)    NULL,
    [First_Name]      VARCHAR (50)    NULL,
    [LAST_FIRST_NAME] VARCHAR (50)    NULL,
    [GRADE]           VARCHAR (2)     NULL,
    [HRLY_AMT]        NUMERIC (10, 4) NULL,
    [ANNL_AMT]        NUMERIC (10, 4) NULL,
    [DETL_JOB_CD]     VARCHAR (50)    NULL,
    [Term_Dt]         DATETIME        NULL
);

