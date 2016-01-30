SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddScheduleHistory]
@ScheduleID int,
@StartDate datetime,
@Server varchar(150)
AS
INSERT INTO dbo.ScheduleHistory
(ScheduleID,
StartDate,
Server)
VALUES
(@ScheduleID,
@StartDate,
@Server)

select SCOPE_IDENTITY()
GO
