SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PurgeEventLog]

AS
	;WITH logcounts AS
	(  
	  SELECT 
		LogEventID, 
		LogConfigID, 
		ROW_NUMBER() OVER(PARTITION BY LogConfigID ORDER BY LogCreateDate DESC) AS logEventSequence
	  FROM dbo.EventLog
	)
	DELETE dbo.EventLog 
	FROM dbo.EventLog el 
		JOIN logcounts lc ON el.LogEventID = lc.LogEventID
		INNER JOIN dbo.EventLogConfig elc ON elc.ID = lc.LogConfigID
	WHERE elc.KeepMostRecent <> -1
		AND lc.logEventSequence > elc.KeepMostRecent
GO
