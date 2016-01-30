SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetUserPreference]
	@PortalId INT ,	
	@UserId INT
AS 
BEGIN
	SELECT PortalId, UserId, MessagesEmailFrequency, NotificationsEmailFrequency
	FROM dbo.CoreMessaging_UserPreferences UP
	WHERE	UP.PortalId = @PortalId
		AND
			UP.UserId = @UserId	
END
GO
