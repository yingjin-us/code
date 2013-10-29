CREATE TABLE [dbo].[crs_lkpPaid_leave_benefit_eligibility] (
    [Empl_id]  VARCHAR (15) NOT NULL,
    [YOS]      VARCHAR (50) NOT NULL,
    [Category] CHAR (10)    NULL,
    CONSTRAINT [PK_crs_lkpPaid_leave_benefit_eligibility] PRIMARY KEY CLUSTERED ([Empl_id] ASC) WITH (FILLFACTOR = 90)
);

