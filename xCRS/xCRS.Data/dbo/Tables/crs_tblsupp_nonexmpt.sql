CREATE TABLE [dbo].[crs_tblsupp_nonexmpt] (
    [empl_id]    NVARCHAR (12) NOT NULL,
    [base]       MONEY         NULL,
    [perf]       MONEY         NULL,
    [ReviewYear] NCHAR (4)     NOT NULL,
    CONSTRAINT [PK_crs_tblsupp_nonexmpt] PRIMARY KEY CLUSTERED ([empl_id] ASC, [ReviewYear] ASC) WITH (FILLFACTOR = 90)
);

