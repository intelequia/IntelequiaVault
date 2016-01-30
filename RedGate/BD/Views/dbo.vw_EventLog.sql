SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_EventLog]
AS
SELECT
 el.*,
 ee.AssemblyVersion,
 ee.PortalId,
 ee.UserId,
 ee.TabId,
 ee.RawUrl,
 ee.Referrer,
 ee.UserAgent,
 e.Message,
 e.StackTrace,
 e.InnerMessage,
 e.InnerStackTrace,
 e.Source
FROM dbo.EventLog el
 LEFT JOIN dbo.ExceptionEvents ee ON el.LogEventID = ee.LogEventID
 LEFT JOIN dbo.Exceptions e ON el.ExceptionHash = e.ExceptionHash
GO
