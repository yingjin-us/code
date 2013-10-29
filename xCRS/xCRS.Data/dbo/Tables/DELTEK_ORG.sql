﻿CREATE TABLE [dbo].[DELTEK_ORG] (
    [ORG_ID]           VARCHAR (20) NOT NULL,
    [ORG_NAME]         VARCHAR (25) NOT NULL,
    [ORG_TOP_FL]       VARCHAR (1)  NOT NULL,
    [LVL_NO]           NUMERIC (5)  NOT NULL,
    [TAXBLE_ENTITY_ID] VARCHAR (10) NOT NULL,
    [ACTIVE_FL]        VARCHAR (1)  NOT NULL,
    [FY_CD_FR]         VARCHAR (6)  NULL,
    [PD_NO_FR]         NUMERIC (5)  NULL,
    [FY_CD_TO]         VARCHAR (6)  NULL,
    [PD_NO_TO]         NUMERIC (5)  NULL,
    [IC_TRCKNG_LVL_NO] NUMERIC (5)  NOT NULL,
    [ORG_LVLS_NO]      NUMERIC (5)  NOT NULL,
    [ORG_ABBRV_CD]     VARCHAR (6)  NOT NULL,
    [MODIFIED_BY]      VARCHAR (20) NOT NULL,
    [TIME_STAMP]       DATETIME     NOT NULL,
    [COMPANY_ID]       VARCHAR (10) NOT NULL,
    [L1_ORG_NAME]      VARCHAR (25) NULL,
    [L2_ORG_NAME]      VARCHAR (25) NULL,
    [L3_ORG_NAME]      VARCHAR (25) NULL,
    [L4_ORG_NAME]      VARCHAR (25) NULL,
    [L5_ORG_NAME]      VARCHAR (25) NULL,
    [L6_ORG_NAME]      VARCHAR (25) NULL,
    [L7_ORG_NAME]      VARCHAR (25) NULL,
    [L8_ORG_NAME]      VARCHAR (25) NULL,
    [L9_ORG_NAME]      VARCHAR (25) NULL,
    [L1_ORG_SEG_ID]    VARCHAR (20) NULL,
    [L2_ORG_SEG_ID]    VARCHAR (18) NULL,
    [L3_ORG_SEG_ID]    VARCHAR (16) NULL,
    [L4_ORG_SEG_ID]    VARCHAR (14) NULL,
    [L5_ORG_SEG_ID]    VARCHAR (12) NULL,
    [L6_ORG_SEG_ID]    VARCHAR (10) NULL,
    [L7_ORG_SEG_ID]    VARCHAR (8)  NULL,
    [L8_ORG_SEG_ID]    VARCHAR (6)  NULL,
    [L9_ORG_SEG_ID]    VARCHAR (4)  NULL,
    [L10_ORG_SEG_ID]   VARCHAR (2)  NULL,
    [ICR_ACCT_ID_FR]   VARCHAR (15) NULL,
    [ICR_REF1_ID_FR]   VARCHAR (20) NULL,
    [ICR_REF2_ID_FR]   VARCHAR (20) NULL,
    [ICR_ACCT_ID_TO]   VARCHAR (15) NULL,
    [ICR_REF1_ID_TO]   VARCHAR (20) NULL,
    [ICR_REF2_ID_TO]   VARCHAR (20) NULL,
    [EC_APP_PROC_CD]   VARCHAR (8)  NULL,
    [ROWVERSION]       NUMERIC (10) NULL,
    [TC_ORG_FL]        VARCHAR (1)  NOT NULL,
    [COBRA_ORG]        VARCHAR (65) NULL
);

