SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetEventLogType]
AS
SELECT *
FROM dbo.EventLogTypes
GO