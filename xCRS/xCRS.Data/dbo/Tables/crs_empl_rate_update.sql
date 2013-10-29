CREATE TABLE [dbo].[crs_empl_rate_update] (
    [EMPL_ID]     VARCHAR (12)    NOT NULL,
    [EFFECT_DT]   DATETIME        NOT NULL,
    [HRLY_AMT]    NUMERIC (10, 4) NOT NULL,
    [JOB_CD_OLD]  VARCHAR (10)    NOT NULL,
    [JOB_CD_NEW]  VARCHAR (10)    NULL,
    [MODIFIED_BY] VARCHAR (20)    NOT NULL,
    [TIME_STAMP]  DATETIME        NOT NULL,
    [OLDGRADE]    VARCHAR (2)     NULL,
    [NEWGRADE]    VARCHAR (2)     NULL,
    [ORG]         VARCHAR (50)    NULL
);

