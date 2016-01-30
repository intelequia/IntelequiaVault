SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteUsersOnline]
	@TimeWindow int	
AS
BEGIN
    DECLARE @dt datetime
	SET @dt = DATEADD(MINUTE, -@TimeWindow, GETDATE())

	DELETE FROM dbo.AnonymousUsers WHERE LastActiveDate < @dt

	DELETE FROM dbo.UsersOnline WHERE LastActiveDate < @dt
END
GO
