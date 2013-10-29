CREATE TABLE [dbo].[crs_lkpTitleCodes] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [title_code] INT            NOT NULL,
    [title]      NVARCHAR (100) NULL,
    [flsa_cd]    NVARCHAR (50)  NULL
);

