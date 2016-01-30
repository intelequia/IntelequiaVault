SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_UpdateSubscriptionDescription]
	@ObjectKey NVARCHAR(255), 
    @PortalId INT,
    @Description NVARCHAR(255)	
AS 
	BEGIN
		UPDATE dbo.CoreMessaging_Subscriptions
		SET [Description] = @Description
		WHERE PortalId = @PortalId 
		AND ObjectKey LIKE @ObjectKey		
		SELECT @@ROWCOUNT AS [ResultStatus]      
	END
GO
