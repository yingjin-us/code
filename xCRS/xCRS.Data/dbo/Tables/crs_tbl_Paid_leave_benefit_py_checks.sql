CREATE TABLE [dbo].[crs_tbl_Paid_leave_benefit_py_checks] (
    [EMPL_ID]    VARCHAR (50)    NOT NULL,
    [FY_CD]      VARCHAR (4)     NOT NULL,
    [Hours]      DECIMAL (18, 2) NULL,
    [IsEligible] BIT             CONSTRAINT [DF_crs_tbl_Paid_leave_benefit_py_checks_IsEligible] DEFAULT (0) NULL,
    CONSTRAINT [PK_crs_tbl_Paid_leave_benefit_py_checks] PRIMARY KEY CLUSTERED ([EMPL_ID] ASC, [FY_CD] ASC) WITH (FILLFACTOR = 90)
);

