SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteSubscription]
	@SubscriptionId int
AS 
BEGIN
	DELETE FROM dbo.[CoreMessaging_Subscriptions] WHERE [SubscriptionId] = @SubscriptionId

	IF @@ROWCOUNT <> 0
		SELECT 0 AS [ResultStatus]
	ELSE
		SELECT -1 AS [ResultStatus]
END
GO
