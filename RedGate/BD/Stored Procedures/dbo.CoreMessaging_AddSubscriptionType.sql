SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_AddSubscriptionType]
	@SubscriptionName NVARCHAR(50) ,
	@FriendlyName NVARCHAR(50) ,
	@DesktopModuleId INT
AS 
	INSERT  dbo.CoreMessaging_SubscriptionTypes
			( SubscriptionName ,
			  FriendlyName ,
			  DesktopModuleId
			)
	VALUES  ( @SubscriptionName ,
			  @FriendlyName ,
			  @DesktopModuleId 
			)
	SELECT  SCOPE_IDENTITY()
GO
