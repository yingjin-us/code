CREATE TABLE [dbo].[temp_fulltime_Utilization_before_year] (
    [EMPL_ID]   VARCHAR (12) NULL,
    [PercentFT] VARCHAR (50) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_temp_fulltime_Utilization_before_year]
    ON [dbo].[temp_fulltime_Utilization_before_year]([EMPL_ID] ASC) WITH (FILLFACTOR = 90);

