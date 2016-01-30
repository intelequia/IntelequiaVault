SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEventLogConfig]
	@ID int
AS
SELECT c.*, t.LogTypeFriendlyName
FROM dbo.EventLogConfig AS c
	INNER JOIN dbo.EventLogTypes AS t ON t.LogTypeKey = c.LogTypeKey
WHERE (ID = @ID or @ID IS NULL)
ORDER BY t.LogTypeFriendlyName ASC
GO
