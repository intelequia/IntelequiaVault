SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PurgeScheduleHistory]
AS
BEGIN
DELETE FROM dbo.[schedulehistory] WHERE schedulehistoryid IN (
	SELECT TOP 50000 ScheduleHistoryID FROM dbo.[ScheduleHistory] sh 
		INNER JOIN dbo.[Schedule] s ON s.ScheduleID = sh.ScheduleID AND s.Enabled = 1
	WHERE (
  SELECT COUNT(*) 
  FROM dbo.[ScheduleHistory] sh
  WHERE sh.ScheduleID = dbo.[ScheduleHistory].ScheduleID
  AND sh.StartDate >= dbo.[ScheduleHistory].StartDate
) > s.RetainHistoryNum
		AND s.RetainHistoryNum <> -1
		AND s.ScheduleID = sh.ScheduleID
	ORDER BY ScheduleHistoryID
)
END
GO
