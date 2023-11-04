SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS usp_name [dbo].[Users];


GO
CREATE TABLE [dbo].[Users] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [username]      NVARCHAR (50)  NOT NULL,
    [displayname]   NVARCHAR (100) NULL,
    [created_date]  DATETIME       NOT NULL,
    [modified_date] DATETIME       NULL,
    [is_valid]      VARCHAR (1)    NOT NULL
);


