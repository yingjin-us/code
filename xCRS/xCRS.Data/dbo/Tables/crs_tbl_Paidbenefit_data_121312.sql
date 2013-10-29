CREATE TABLE [dbo].[crs_tbl_Paidbenefit_data_121312] (
    [EMPL_ID]          VARCHAR (50)    NOT NULL,
    [DOE]              DATETIME        NOT NULL,
    [effect_dt]        DATETIME        NOT NULL,
    [hrly_amt]         DECIMAL (18, 2) NOT NULL,
    [hrs]              DECIMAL (18)    NOT NULL,
    [pd_ben_Hrs]       DECIMAL (18, 1) NULL,
    [proration_pt]     DECIMAL (18, 2) NULL,
    [Prorated_ben_hrs] DECIMAL (18)    NULL,
    [cash_value]       DECIMAL (18, 2) NULL
);

