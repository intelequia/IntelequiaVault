SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEventMessages]
	
	@EventName nvarchar(100)

AS
	SELECT * 
	FROM dbo.EventQueue
	WHERE EventName = @EventName
		AND IsComplete = 0
	ORDER BY SentDate
GO
