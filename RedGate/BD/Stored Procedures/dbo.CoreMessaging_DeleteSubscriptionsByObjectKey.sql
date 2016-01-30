SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteSubscriptionsByObjectKey]
	@PortalId int,
	@ObjectKey NVARCHAR(255)
AS
BEGIN
	DELETE
	FROM dbo.CoreMessaging_Subscriptions
	WHERE PortalId = @PortalId
		AND ObjectKey = @ObjectKey
END
GO
