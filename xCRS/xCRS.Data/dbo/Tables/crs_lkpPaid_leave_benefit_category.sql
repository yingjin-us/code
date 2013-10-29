CREATE TABLE [dbo].[crs_lkpPaid_leave_benefit_category] (
    [category]      CHAR (1)     NOT NULL,
    [ts_pd_cd]      VARCHAR (7)  NOT NULL,
    [Decription]    VARCHAR (50) NOT NULL,
    [Max_ben_hours] NUMERIC (18) NOT NULL,
    CONSTRAINT [PK_crs_lkpPaid_leave_benefit_category] PRIMARY KEY CLUSTERED ([category] ASC, [ts_pd_cd] ASC) WITH (FILLFACTOR = 90)
);

