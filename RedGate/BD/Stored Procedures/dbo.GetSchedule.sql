SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSchedule]
 @Server varchar(150)
AS
BEGIN
SELECT
  S.*
  , (SELECT max(S1.NextStart)
   FROM dbo.ScheduleHistory S1
   WHERE S1.ScheduleID = S.ScheduleID) as NextStart
 FROM dbo.Schedule S
 WHERE
	(
		@Server IS NULL OR 
		S.Servers LIKE '%,' + @Server + ',%' OR
		S.Servers LIKE @Server + ',%' OR
		S.Servers LIKE '%,' + @Server OR
		S.Servers = @Server OR
		S.Servers IS NULL)
	ORDER BY FriendlyName ASC
END
GO
