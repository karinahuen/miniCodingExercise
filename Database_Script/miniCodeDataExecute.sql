INSERT INTO [Admin]([admin_name], [admin_display_name], [level], [is_valid], [created_date])
VALUES('admin', 'Hotel Customer Service', 1, 'Y', GETDATE());
GO

INSERT INTO [Admin]([admin_name], [admin_display_name], [level], [is_valid], [created_date])
VALUES('control', 'Hotel Controller', 2, 'Y', GETDATE());
GO


INSERT INTO [Admin]([admin_name], [admin_display_name], [level], [is_valid], [created_date])
VALUES('admin1', 'Hotel Internal', 3, 'Y', GETDATE());
GO


INSERT INTO [Admin]([admin_name], [admin_display_name], [level], [is_valid], [created_date])
VALUES('test', 'tester', 1, 'N', GETDATE());
GO

INSERT INTO [Admin]([admin_name], [admin_display_name], [level], [is_valid], [created_date])
VALUES('ai_admin', 'Ai Customer Service', 4, 'Y', GETDATE());
GO





INSERT INTO [Admin_Level]([admin_level], [admin_type], [can_read], [can_response], [is_valid], [created_date])
VALUES(1, 'Administrator', 'Y', 'Y','Y', GETDATE());
GO

INSERT INTO [Admin_Level]([admin_level], [admin_type], [can_read], [can_response], [is_valid], [created_date])
VALUES(2, 'Controller', 'Y', 'Y','Y', GETDATE());
GO


INSERT INTO [Admin_Level]([admin_level], [admin_type], [can_read], [can_response], [is_valid], [created_date])
VALUES(3, 'Internal User', 'Y', 'N','Y', GETDATE());
GO

INSERT INTO [Admin_Level]([admin_level], [admin_type], [can_read], [can_response], [is_valid], [created_date])
VALUES(4, 'AI', 'Y', 'Y','Y', GETDATE());
GO





INSERT INTO [Knowledage_Base]([key_word], [another_key_word], [answer], [is_valid], [created_date])
VALUES('Wi-Fi', 'wifi', 'The Wi-Fi code is 5k8fs.','Y', GETDATE());
GO

INSERT INTO [Knowledage_Base]([key_word], [another_key_word], [answer], [is_valid], [created_date])
VALUES('service', 'customer service', 'May I help you?','Y', GETDATE());
GO


INSERT INTO [Knowledage_Base]([key_word], [another_key_word], [answer], [is_valid], [created_date])
VALUES('contact', 'help', 'If you have any query, please contact our customer service. The number is 016-xxxxx-xxxx. Thank you.','Y', GETDATE());
GO



INSERT INTO [Users]([username], [displayname], [created_date], [is_valid])
VALUES('test', 'test user', GETDATE(), 'Y');
GO

INSERT INTO [Users]([username], [displayname], [created_date], [is_valid])
VALUES('test1', 'admin test', GETDATE(), 'Y');
GO

