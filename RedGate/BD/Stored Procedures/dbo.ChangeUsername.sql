SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ChangeUsername]
	@UserId         int,
	@NewUsername	nvarchar(256)
AS
BEGIN
	DECLARE @OldUsername NVARCHAR(256)
	SET @OldUsername = (SELECT UserName FROM dbo.Users WHERE UserId = @UserId)

	UPDATE dbo.Users
		SET		Username=@NewUsername
		WHERE	UserId=@UserId

	UPDATE dbo.aspnet_Users
		SET		UserName=@NewUsername,
				LoweredUserName=LOWER(@NewUsername) 
		WHERE	UserName=@OldUsername

END
GO
