SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetScheduleItemSettings] 
@ScheduleID int
AS
SELECT *
FROM dbo.ScheduleItemSettings
WHERE ScheduleID = @ScheduleID
GO
