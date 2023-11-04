SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Knowledage_Base];


GO
CREATE TABLE [dbo].[Knowledage_Base] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [key_word]         NVARCHAR (MAX) NOT NULL,
    [another_key_word] NVARCHAR (MAX) NULL,
    [answer]           NVARCHAR (MAX) NOT NULL,
    [is_valid]         VARCHAR (1)    NOT NULL,
    [created_date]     DATETIME       NOT NULL,
    [modified_date]    DATETIME       NULL
);


