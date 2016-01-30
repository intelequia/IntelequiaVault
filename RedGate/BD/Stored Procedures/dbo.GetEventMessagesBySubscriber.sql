SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEventMessagesBySubscriber]
	
	@EventName nvarchar(100),
	@Subscriber nvarchar(100)

AS
	SELECT * 
	FROM dbo.EventQueue
	WHERE EventName = @EventName
		AND Subscriber = @Subscriber
		AND IsComplete = 0
	ORDER BY SentDate
GO
