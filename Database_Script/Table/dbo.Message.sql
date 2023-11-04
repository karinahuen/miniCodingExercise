SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Message];


GO
CREATE TABLE [dbo].[Message] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [user_id]       INT            NOT NULL,
    [content]       NVARCHAR (MAX) NULL,
    [created_date]  DATETIME       NOT NULL,
    [modified_date] DATETIME       NULL
);


