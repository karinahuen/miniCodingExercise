SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[DB_Error];


GO
CREATE TABLE [dbo].[DB_Error] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [error_type_name] VARCHAR (100) NULL,
    [error_path]      VARCHAR (255) NULL,
    [error_content]   VARCHAR (MAX) NULL,
    [created_date]    DATETIME      NULL,
    [modified_date]   DATETIME      NULL
);


