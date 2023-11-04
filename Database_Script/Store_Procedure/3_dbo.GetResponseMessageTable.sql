SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP FUNCTION IF EXISTS [dbo].[GetResponseMessageTable];


GO

CREATE FUNCTION [dbo].[GetResponseMessageTable]
(
	@msgId int
)
RETURNS @returntable TABLE
(
	Id int,
	admin_id int, 
	message_id int,
	content nvarchar(MAX),
	created_by nvarchar (255),
	created_date datetime,
	modified_by nvarchar(255),
	modified_date datetime
)
AS
BEGIN
	 --Get Table
	INSERT @returntable
	SELECT res.Id, res.admin_id, res.message_id, res.content, ISNULL(ad.admin_display_name, 'Administrator') created_by, res.created_date, res.modified_by, res.modified_date
	FROM dbo.Response res
	LEFT JOIN Admin ad ON res.admin_id = ad.Id AND ad.is_valid = 'Y'
	WHERE res.message_id = @msgId 
	RETURN
END
