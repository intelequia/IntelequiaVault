SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetScheduleByScheduleID]
@ScheduleID int
AS
SELECT S.*
FROM dbo.Schedule S
WHERE S.ScheduleID = @ScheduleID
GO
