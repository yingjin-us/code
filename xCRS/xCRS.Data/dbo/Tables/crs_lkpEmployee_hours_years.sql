CREATE TABLE [dbo].[crs_lkpEmployee_hours_years] (
    [Empl_id]      VARCHAR (15)    NOT NULL,
    [hours]        DECIMAL (18, 2) NOT NULL,
    [service_year] CHAR (4)        NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_crs_lkp_Employee_hours_years]
    ON [dbo].[crs_lkpEmployee_hours_years]([Empl_id] ASC, [service_year] ASC) WITH (FILLFACTOR = 90);

