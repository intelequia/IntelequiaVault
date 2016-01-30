SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CreateNotificationType]
	@Name nvarchar(100),
	@Description nvarchar(2000),
	@TTL int,
	@DesktopModuleId int,
	@CreatedUpdatedUserID int,
	@IsTask bit
AS
BEGIN
	INSERT INTO dbo.[CoreMessaging_NotificationTypes] (
		[Name],
		[Description],
		[TTL],
		[DesktopModuleId],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate],
		[IsTask]
	) VALUES (
		@Name,
		@Description,
		@TTL,
		@DesktopModuleId,
		@CreatedUpdatedUserID,
		GETDATE(),
		@CreatedUpdatedUserID,
		GETDATE(),
		@IsTask
	)
		
	SELECT SCOPE_IDENTITY()	
END
GO
