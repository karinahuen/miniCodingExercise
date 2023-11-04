
/****** Object: Table [dbo].[Admin] Script Date: 2/11/2023 11:24:37 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Admin];


GO
CREATE TABLE [dbo].[Admin] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [admin_name]         VARCHAR (100)  NOT NULL,
    [admin_display_name] NVARCHAR (255) NOT NULL,
    [level]              INT            NOT NULL,
    [is_valid]           VARCHAR (1)    NOT NULL,
    [created_date]       DATETIME       NOT NULL,
    [modified_date]      DATETIME       NULL
);


