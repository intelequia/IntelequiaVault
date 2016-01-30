SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetScheduleByEvent]
	@EventName	varchar(50),
	@Server		varchar(150)
AS
    SELECT S.*
	FROM dbo.[Schedule] S
	WHERE S.AttachToEvent = @EventName
		AND (@Server IS NULL OR ISNULL(s.Servers, '') = '' OR ',' + s.Servers + ',' LIKE '%,' + @Server + ',%')
GO
