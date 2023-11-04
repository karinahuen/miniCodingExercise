SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[GetUserMessageHistoryByUserId];


GO

CREATE PROCEDURE [dbo].[GetUserMessageHistoryByUserId]
	@userId INT = 0
AS
	
	SELECT msg.id message_id, msg.content message_content, msg.created_date message_date, resp.content responsed_content, ad.admin_display_name, resp.created_date responsed_date FROM Message msg
	INNER JOIN Users u ON u.Id = msg.user_id AND u.is_valid = 'Y'
	INNER JOIN Response resp ON resp.message_id = msg.Id
	INNER JOIN Admin ad ON ad.id = resp.admin_id
	Where msg.user_id = @userId
	Order by msg.created_date desc, resp.created_date desc
RETURN
