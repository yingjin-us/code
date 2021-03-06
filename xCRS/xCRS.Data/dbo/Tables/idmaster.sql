﻿CREATE TABLE [dbo].[idmaster] (
    [IDMaster_WestatID]             INT           NOT NULL,
    [SysInsertDate]                 DATETIME      NULL,
    [SysInsertUid]                  SMALLINT      NULL,
    [SysUpdateDate]                 DATETIME      NULL,
    [SysUpdateUid]                  SMALLINT      NULL,
    [IDMaster_SSN]                  CHAR (9)      NULL,
    [IDMaster_LastName]             VARCHAR (30)  NOT NULL,
    [IDMaster_FirstName]            VARCHAR (30)  NOT NULL,
    [IDMaster_MiddleInitial]        VARCHAR (10)  NULL,
    [IDMaster_PreferredLastName]    VARCHAR (30)  NULL,
    [IDMaster_PreferredFirstName]   VARCHAR (30)  NULL,
    [IDMaster_NameSuffix]           VARCHAR (10)  NULL,
    [IDMaster_DOE]                  DATETIME      NOT NULL,
    [IDMaster_DOPE]                 DATETIME      NULL,
    [IDMaster_DOR]                  DATETIME      NULL,
    [IDMaster_DOT]                  DATETIME      NULL,
    [StaffType_Code]                CHAR (2)      NOT NULL,
    [PayType_Code]                  CHAR (5)      NULL,
    [Grade_Code]                    CHAR (2)      NULL,
    [Title_Code]                    VARCHAR (10)  NULL,
    [IDMasterStatus_Code]           CHAR (2)      NOT NULL,
    [Company_Code]                  CHAR (1)      NOT NULL,
    [OrgType_Code]                  CHAR (2)      NOT NULL,
    [OrgUnit_Code]                  CHAR (2)      NOT NULL,
    [OrgUnitGLC_Code]               CHAR (6)      NOT NULL,
    [IDMaster_SupervisorFlag]       BIT           NOT NULL,
    [IDMaster_WestatID_Supervisor]  INT           NULL,
    [Location_Code]                 CHAR (3)      NOT NULL,
    [IDMaster_NewHireNotification]  BIT           NOT NULL,
    [IDMaster_TermNotification]     BIT           NOT NULL,
    [IDMaster_WINSCardIssued]       BIT           NOT NULL,
    [ECC_Code]                      CHAR (3)      NULL,
    [IDMaster_ExistsInCostPoint]    BIT           NOT NULL,
    [IDMaster_NextHistoryID]        INT           NULL,
    [IDMaster_Archived]             BIT           NOT NULL,
    [IDMaster_PriorLastName]        VARCHAR (30)  NULL,
    [IDMaster_CostPointExportDate]  DATETIME      NULL,
    [IDMaster_WestatID_Supervisor2] INT           NULL,
    [IDMaster_WestatID_Supervisor3] INT           NULL,
    [IDMaster_WestatID_Supervisor4] INT           NULL,
    [SupervisorCode]                CHAR (3)      NULL,
    [Util_Code]                     CHAR (3)      NULL,
    [EmailAddress]                  VARCHAR (50)  NULL,
    [EffectiveDate]                 DATETIME      NULL,
    [MsgGroupCode]                  INT           NULL,
    [IDMaster_WestatID_ASup]        INT           NULL,
    [IDMaster_Level]                TINYINT       NULL,
    [IDMaster_ASupFlag]             BIT           NULL,
    [ASupCode]                      CHAR (3)      NULL,
    [Directory_Sup]                 INT           NULL,
    [Directory_Title]               VARCHAR (100) NULL,
    [Directory_Sup_Flag]            BIT           NULL,
    [POB_City]                      VARCHAR (50)  NULL,
    [POB_State]                     VARCHAR (50)  NULL,
    [POB_County]                    VARCHAR (50)  NULL,
    [POB_Country]                   VARCHAR (50)  NULL,
    [DOB]                           DATETIME      NULL,
    [ADDR_1]                        VARCHAR (30)  NULL,
    [ADDR_2]                        VARCHAR (30)  NULL,
    [ADDR_3]                        VARCHAR (30)  NULL,
    [ADDR_City]                     VARCHAR (25)  NULL,
    [ADDR_State]                    VARCHAR (15)  NULL,
    [ADDR_Country]                  VARCHAR (8)   NULL,
    [ADDR_Zip]                      VARCHAR (10)  NULL,
    [Phone_Number]                  VARCHAR (20)  NULL,
    [Gender]                        CHAR (1)      NULL,
    [Race]                          CHAR (1)      NULL,
    [BestGuess]                     BIT           NULL,
    [TermType]                      VARCHAR (50)  NULL,
    [CandidateID]                   VARCHAR (25)  NULL,
    [COC_date]                      DATETIME      NULL,
    [Alt_Loc_CD]                    INT           NULL,
    [No_degree]                     BIT           NULL,
    [No_WorkExperience]             BIT           NULL,
    [No_Certification]              BIT           NULL,
    [Alt_Phone_Number]              VARCHAR (20)  NULL,
    [Marital_CD]                    CHAR (1)      NULL,
    [No_Language]                   BIT           NULL,
    [Grade_cat_cd]                  CHAR (1)      NULL,
    [PTS_percent]                   INT           NULL,
    [AWAType_cd]                    VARCHAR (10)  NULL,
    [AWA_date]                      DATETIME      NULL,
    [AWA_enddate]                   DATETIME      NULL,
    [Alt_Loc_CD2]                   VARCHAR (50)  NULL,
    CONSTRAINT [PK_idmaster] PRIMARY KEY CLUSTERED ([IDMaster_WestatID] ASC) WITH (FILLFACTOR = 90)
);

