SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetSubscriptionTypes]
AS 
	SELECT  *
	FROM    dbo.CoreMessaging_SubscriptionTypes
GO
