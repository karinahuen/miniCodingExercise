SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP PROCEDURE IF EXISTS [dbo].[GetUsersInformation];


GO
CREATE PROCEDURE [dbo].[GetUsersInformation]
	
AS
	SELECT TOP(1) * FROM dbo.Users
	WHERE username = 'test' and is_valid = 'Y';
RETURN
