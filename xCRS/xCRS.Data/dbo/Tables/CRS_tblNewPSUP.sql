CREATE TABLE [dbo].[CRS_tblNewPSUP] (
    [Empl_ID]     NVARCHAR (12) NOT NULL,
    [Name]        VARCHAR (150) NOT NULL,
    [NewPSUP]     VARCHAR (150) NOT NULL,
    [NewPSUPCode] CHAR (3)      NOT NULL,
    [CreateDate]  DATETIME      NOT NULL,
    [UpdateDate]  DATETIME      NOT NULL,
    [UpdatedBy]   VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_CRS_tblNewPSUP] PRIMARY KEY CLUSTERED ([Empl_ID] ASC) WITH (FILLFACTOR = 90)
);

