SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[CreateUserMessage];


GO


CREATE PROCEDURE [dbo].[CreateUserMessage]
	@userId INT = 0,
	@message NVARCHAR(max) = ''
AS
BEGIN
	DECLARE @currentDate DATETIME = GETDATE();
	DECLARE @message_id INT = 0;
	--catch error
	BEGIN TRY
		INSERT INTO dbo.Message(user_id, content, created_date) VALUES (@userId, @message, @currentDate);
		select @message_id = SCOPE_IDENTITY();
		--Create response message
		--EXEC dbo.CreateMessageResponse @message_id, @message
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
RETURN @message_id
END