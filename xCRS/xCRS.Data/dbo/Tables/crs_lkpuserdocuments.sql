CREATE TABLE [dbo].[crs_lkpuserdocuments] (
    [Caption]        VARCHAR (100) NULL,
    [Path]           VARCHAR (255) NULL,
    [ALL]            BIT           NULL,
    [AVP]            BIT           NULL,
    [SAH]            BIT           NULL,
    [PVP]            BIT           NULL,
    [PAD]            BIT           NULL,
    [SVP]            BIT           NULL,
    [SAD]            BIT           NULL,
    [P17]            BIT           NULL,
    [S17]            BIT           NULL,
    [S16]            BIT           NULL,
    [S15]            BIT           NULL,
    [S14]            BIT           NULL,
    [ColumnOrder]    FLOAT (53)    NULL,
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [GuidelinesType] NVARCHAR (20) NULL
);

