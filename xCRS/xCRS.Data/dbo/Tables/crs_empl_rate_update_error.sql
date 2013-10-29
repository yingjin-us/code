CREATE TABLE [dbo].[crs_empl_rate_update_error] (
    [EMPL_ID]    VARCHAR (12)    NOT NULL,
    [EFFECT_DT]  DATETIME        NOT NULL,
    [HRLY_AMT]   NUMERIC (10, 4) NOT NULL,
    [JOB_CD]     VARCHAR (10)    NOT NULL,
    [ERROR_DESC] VARCHAR (200)   NOT NULL
);

