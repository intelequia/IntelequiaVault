SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_SetUserPreference]
	@PortalId INT ,	
	@UserId INT,
	@MessagesEmailFrequency INT,
	@NotificationsEmailFrequency INT
AS 
BEGIN	
	UPDATE dbo.CoreMessaging_UserPreferences
	SET MessagesEmailFrequency = @MessagesEmailFrequency
		,NotificationsEmailFrequency = @NotificationsEmailFrequency
	WHERE PortalId = @PortalId
	AND UserId = @UserId

	IF @@ROWCOUNT = 0 BEGIN
		INSERT INTO dbo.CoreMessaging_UserPreferences (PortalId, UserId, MessagesEmailFrequency, NotificationsEmailFrequency)
		VALUES (@PortalId, @UserId, @MessagesEmailFrequency, @NotificationsEmailFrequency)
	END	
END
GO
