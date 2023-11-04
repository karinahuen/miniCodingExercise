/****** Object: Table [dbo].[Admin_Level] Script Date: 2/11/2023 10:53:04 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Admin_Level];


GO
CREATE TABLE [dbo].[Admin_Level] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [admin_level]   INT           NOT NULL,
    [admin_type]    VARCHAR (100) NOT NULL,
    [can_read]      VARCHAR (1)   NOT NULL,
    [can_response]  VARCHAR (1)   NOT NULL,
    [is_valid]      VARCHAR (1)   NOT NULL,
    [created_date]  DATETIME      NOT NULL,
    [modified_date] DATETIME      NULL
);


