CREATE TABLE [dbo].[crs_tblAreaHeadApprovalList] (
    [Empl_id]    VARCHAR (50) NOT NULL,
    [ApprovedBy] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_crs_tblAreaHeadApprovalList] PRIMARY KEY CLUSTERED ([Empl_id] ASC) WITH (FILLFACTOR = 90)
);

