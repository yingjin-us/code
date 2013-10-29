﻿CREATE TABLE [dbo].[crs_tmpreport_downloaded] (
    [User_ID]                     CHAR (10)       NULL,
    [Empl_ID]                     NVARCHAR (12)   NOT NULL,
    [LName]                       NVARCHAR (25)   NULL,
    [FName]                       NVARCHAR (20)   NULL,
    [MIName]                      NVARCHAR (20)   NULL,
    [DOSE]                        DATETIME        NULL,
    [DOPE]                        DATETIME        NULL,
    [DOT]                         DATETIME        NULL,
    [Active]                      BIT             NULL,
    [ORG]                         VARCHAR (20)    NULL,
    [Rev_Code]                    NVARCHAR (9)    NULL,
    [Grade_Category]              CHAR (2)        NULL,
    [SU1]                         NVARCHAR (12)   NULL,
    [SU1_Name]                    NVARCHAR (50)   NULL,
    [SU2]                         NVARCHAR (12)   NULL,
    [SU2_Name]                    NVARCHAR (50)   NULL,
    [SU3]                         NVARCHAR (12)   NULL,
    [SU3_Name]                    NVARCHAR (50)   NULL,
    [SU4]                         NVARCHAR (12)   NULL,
    [SU4_Name]                    NVARCHAR (50)   NULL,
    [SI1]                         MONEY           NULL,
    [PI1]                         DECIMAL (18, 4) NULL,
    [GR1]                         NVARCHAR (3)    NULL,
    [RCol1]                       NVARCHAR (3)    NULL,
    [Row1]                        CHAR (10)       NULL,
    [Bon1]                        MONEY           NULL,
    [BonType1]                    CHAR (3)        NULL,
    [SI2]                         MONEY           NULL,
    [PI2]                         DECIMAL (18, 4) NULL,
    [GR2]                         NVARCHAR (3)    NULL,
    [RCol2]                       NVARCHAR (3)    NULL,
    [Row2]                        CHAR (2)        NULL,
    [Bon2]                        MONEY           NULL,
    [BonType2]                    CHAR (3)        NULL,
    [SI3]                         MONEY           NULL,
    [PI3]                         DECIMAL (18, 4) NULL,
    [GR3]                         NVARCHAR (3)    NULL,
    [RCol3]                       NVARCHAR (3)    NULL,
    [Row3]                        CHAR (2)        NULL,
    [Bon3]                        MONEY           NULL,
    [BonType3]                    CHAR (3)        NULL,
    [SI4]                         MONEY           NULL,
    [PI4]                         DECIMAL (18, 4) NULL,
    [RCol4]                       NVARCHAR (3)    NULL,
    [Row4]                        CHAR (2)        NULL,
    [Bon4]                        MONEY           NULL,
    [BonType4]                    CHAR (2)        NULL,
    [Cur_Sal]                     MONEY           NULL,
    [New_Sal]                     MONEY           NULL,
    [Cur_Grade]                   NVARCHAR (3)    NULL,
    [Cur_GR_Step]                 DECIMAL (18, 2) NULL,
    [New_Grade]                   NVARCHAR (3)    NULL,
    [New_GR_Step]                 DECIMAL (18, 2) NULL,
    [Cur_Bon]                     MONEY           NULL,
    [Cur_Rate]                    MONEY           NULL,
    [TimeStamp]                   DATETIME        NULL,
    [YearVal]                     NVARCHAR (4)    NULL,
    [Util_Percent]                NUMERIC (18)    NULL,
    [FullTime_Percent]            NUMERIC (18)    NULL,
    [Sal2]                        MONEY           NULL,
    [Sal3]                        MONEY           NULL,
    [Sal_Inc_Tot]                 MONEY           NULL,
    [GR_Step1]                    DECIMAL (18, 2) NULL,
    [GR_Step2]                    DECIMAL (18, 2) NULL,
    [Grade_Step_Min3]             DECIMAL (18, 2) NULL,
    [Notes]                       VARCHAR (1000)  NULL,
    [Perf_Rating]                 NVARCHAR (2)    NULL,
    [Growth_Rating]               NVARCHAR (2)    NULL,
    [Directory_Title]             VARCHAR (100)   NULL,
    [Sub_Unit]                    VARCHAR (100)   NULL,
    [Family_code]                 VARCHAR (100)   NULL,
    [Hiring_commitement]          VARCHAR (1000)  NULL,
    [PTS]                         VARCHAR (50)    NULL,
    [OrgName]                     VARCHAR (50)    NULL,
    [Total_BonusForPreviousYears] DECIMAL (18, 3) NULL,
    [BudgetGrade]                 VARCHAR (50)    NULL,
    [BudgetSalary]                DECIMAL (18, 3) NULL,
    [BudgetBonus]                 DECIMAL (18, 3) NULL,
    [CompReviewStatus]            BIT             NULL,
    [InitialCompReviewStatus]     BIT             NULL,
    [AllStaffBon]                 BIT             NULL,
    [Years_Of_Experience]         NVARCHAR (5)    NULL,
    CONSTRAINT [PK_crs_tmpreport_downloaded_1] PRIMARY KEY CLUSTERED ([Empl_ID] ASC) WITH (FILLFACTOR = 90)
);

