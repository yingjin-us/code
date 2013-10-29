CREATE TABLE [dbo].[CRS_Users] (
    [Username]                    VARCHAR (50)  NOT NULL,
    [Empl_ID]                     NVARCHAR (12) NOT NULL,
    [AllowDownload]               BIT           NOT NULL,
    [AllowUpload]                 BIT           NOT NULL,
    [AllowUpdate]                 BIT           NOT NULL,
    [ManagerWestatID]             NVARCHAR (12) NULL,
    [DownloadTimeStamp]           DATETIME      NULL,
    [UploadTimeStamp]             DATETIME      NULL,
    [IsAdmin]                     BIT           NULL,
    [Comments]                    VARCHAR (255) NULL,
    [Status]                      CHAR (1)      NULL,
    [ResetPassword]               BIT           NULL,
    [AllowReviewProcessSelection] BIT           CONSTRAINT [DF_CRS_Users_AllowReviewProcessSelection] DEFAULT (0) NULL,
    [AllowCompanyWideReport]      BIT           NULL,
    [UserAccessLevel]             INT           NULL,
    [AllowFullBrowse]             BIT           NULL,
    [AllowRvwApprover]            BIT           NULL,
    [IsActive]                    BIT           CONSTRAINT [DF_CRS_Users_IsActive] DEFAULT (1) NULL,
    CONSTRAINT [PK_CRS_Users] PRIMARY KEY CLUSTERED ([Username] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CRS_Users_CRS_lkpUserAccessLevel] FOREIGN KEY ([UserAccessLevel]) REFERENCES [dbo].[CRS_lkpUserAccessLevel] ([CodeID])
);

