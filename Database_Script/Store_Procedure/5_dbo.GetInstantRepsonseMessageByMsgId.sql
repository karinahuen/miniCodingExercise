SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[GetInstantRepsonseMessageByMsgId];


GO
CREATE PROCEDURE [dbo].[GetInstantRepsonseMessageByMsgId]
	@msgId INT = 0
AS
	SELECT * FROM dbo.GetResponseMessageTable(@msgId);
RETURN
