CREATE TABLE [dbo].[temp_working_hours] (
    [WorkDays]    DATETIME NOT NULL,
    [No_Of_Hours] INT      CONSTRAINT [DF_temp_working_hours_No_Of_Hours] DEFAULT (0) NULL,
    CONSTRAINT [PK_temp_working_hours] PRIMARY KEY CLUSTERED ([WorkDays] ASC) WITH (FILLFACTOR = 90)
);

