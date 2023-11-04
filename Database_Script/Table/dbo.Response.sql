SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Response];


GO
CREATE TABLE [dbo].[Response] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [message_id]    INT            NOT NULL,
    [admin_id]      INT            NOT NULL,
    [content]       NVARCHAR (MAX) NULL,
    [created_date]  DATETIME       NOT NULL,
    [created_by]    VARCHAR (100)  NOT NULL,
    [modified_date] DATETIME       NULL,
    [modified_by]   VARCHAR (100)  NULL
);


