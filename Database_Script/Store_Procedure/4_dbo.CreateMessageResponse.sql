SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[CreateMessageResponse];


GO

CREATE PROCEDURE [dbo].[CreateMessageResponse]
	@msgId int,
	@msg nvarchar(MAX)
AS
BEGIN
	DECLARE @responseMsg NVARCHAR(MAX) = '';
	DECLARE @currentDate DATETIME = GETDATE();
	DECLARE @adminName VARCHAR(100) = '';
	DECLARE @adminNameType VARCHAR(100) = '';
	DECLARE @adminID  INT = 0;
	--catch error
	BEGIN TRY
		--Create Response From Respondent
		IF @msg IS NOT NULL AND @msg != ''
		BEGIN
			 SELECT Top(1) @responseMsg = answer FROM dbo.Knowledage_Base
			 WHERE (key_word like '%' + @msg + '%' OR another_key_word like '%' + @msg + '%') AND is_valid = 'Y';

			 IF @responseMsg IS NOT NULL AND @responseMsg != ''
			 BEGIN
				SET @adminNameType = 'ai_admin';
			 END
			 ELSE
			 BEGIN
				SET @adminNameType = 'admin';
				--if the message from client doesn't match the key word, then return to original msg
				SET @responseMsg = @msg;
			 END

		END
		ELSE
		BEGIN
			--if no message input
			SET @adminNameType = 'ai_admin';
			SET @responseMsg = 'Please input correct text.';

		END

		SELECT @adminName = admin_name, @adminID = Id FROM dbo.Admin
				WHERE admin_name = @adminNameType AND is_valid = 'Y';

		INSERT INTO Response (message_id, admin_id, content, created_date, created_by)
		--OUTPUT Inserted.ID
		VALUES
		(
			@msgId,
			@adminID,
			@responseMsg,
			@currentDate,
			@adminName
		)

	END TRY
	BEGIN CATCH
	 INSERT INTO dbo.DB_Error
	 (
		error_type_name,
		error_path,
		error_content,
		created_date
	 )
	 VALUES
	 ('StoreProcedure',
	   ERROR_PROCEDURE(),
	   ERROR_MESSAGE(),
	   @currentDate
	  )

	END CATCH

RETURN 
END
