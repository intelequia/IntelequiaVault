SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetScheduleHistory] @ScheduleID INT
AS 
    SELECT  S.* ,
            SH.*
    FROM    dbo.Schedule S
            INNER JOIN dbo.ScheduleHistory SH ON S.ScheduleID = SH.ScheduleID
    WHERE   S.ScheduleID = @ScheduleID
            OR @ScheduleID = -1
    ORDER BY SH.StartDate DESC
GO
