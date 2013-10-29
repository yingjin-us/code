CREATE TABLE [dbo].[crs_lkpallstaffbonus_posttoCP] (
    [empl_id]           NVARCHAR (24) NOT NULL,
    [lastname]          VARCHAR (100) NULL,
    [firstname]         VARCHAR (50)  NULL,
    [SU4]               CHAR (3)      NULL,
    [DOSE]              DATETIME      NULL,
    [cur_sal]           MONEY         NULL,
    [cur_grade]         CHAR (2)      NULL,
    [charged_hrs]       NUMERIC (18)  NULL,
    [fulltime_hours]    NUMERIC (18)  NULL,
    [bonamt]            MONEY         NULL,
    [is_percent]        BIT           NULL,
    [bon_rate]          MONEY         NULL,
    [min_percent]       BIT           NULL,
    [Denominator]       NUMERIC (18)  NULL,
    [AllStaffBonus]     MONEY         NULL,
    [FloatHolidayBonus] MONEY         NULL
);

