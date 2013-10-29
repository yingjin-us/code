﻿CREATE TABLE [dbo].[DELTEK_TMP_LAB_REMOTE] (
    [EMPL_ID]      VARCHAR (12)    NOT NULL,
    [HRLY_AMT]     DECIMAL (10, 4) NULL,
    [SAL_AMT]      DECIMAL (10, 2) NULL,
    [ANNL_AMT]     DECIMAL (10, 2) NULL,
    [ORG_ID]       VARCHAR (20)    NULL,
    [SAL_GRADE_CD] VARCHAR (10)    NULL,
    [END_DT]       DATETIME        NULL
);
