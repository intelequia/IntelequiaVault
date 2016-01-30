SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteEventLogType]
	@LogTypeKey nvarchar(35)
AS
DELETE FROM dbo.EventLogTypes
WHERE	LogTypeKey = @LogTypeKey
GO
