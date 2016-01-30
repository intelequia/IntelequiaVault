SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetSubscriptionsByContent]
	@PortalId int,
	@SubscriptionTypeID int,
	@ObjectKey NVARCHAR(255)
AS
BEGIN
	SELECT *
	FROM dbo.[CoreMessaging_Subscriptions]
	WHERE 
		(( @PortalId is null and PortalId is null) or (PortalId = @PortalId))
		AND SubscriptionTypeID = @SubscriptionTypeID
		AND ObjectKey = @ObjectKey
END
GO
