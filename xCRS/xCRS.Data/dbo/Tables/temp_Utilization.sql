CREATE TABLE [dbo].[temp_Utilization] (
    [EMPL_ID] VARCHAR (12) NULL,
    [UTIL]    VARCHAR (50) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_temp_Utilization]
    ON [dbo].[temp_Utilization]([EMPL_ID] ASC) WITH (FILLFACTOR = 90);

