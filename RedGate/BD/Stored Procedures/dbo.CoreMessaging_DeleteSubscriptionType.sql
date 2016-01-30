SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteSubscriptionType]
	@SubscriptionTypeId int
AS
BEGIN
	DELETE FROM dbo.[CoreMessaging_SubscriptionTypes] WHERE [SubscriptionTypeId] = @SubscriptionTypeId

	IF @@ROWCOUNT <> 0
		SELECT 0 AS [ResultStatus]
	ELSE
		SELECT -1 AS [ResultStatus]
END
GO
