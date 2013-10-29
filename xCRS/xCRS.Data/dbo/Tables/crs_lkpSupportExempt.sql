CREATE TABLE [dbo].[crs_lkpSupportExempt] (
    [Empl_ID]     VARCHAR (15)   NOT NULL,
    [Description] NVARCHAR (255) NULL,
    [IsExempt]    BIT            NULL,
    CONSTRAINT [PK_Support_Exempt] PRIMARY KEY CLUSTERED ([Empl_ID] ASC) WITH (FILLFACTOR = 90)
);

