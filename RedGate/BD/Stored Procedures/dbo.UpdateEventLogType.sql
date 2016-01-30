SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateEventLogType]
	@LogTypeKey nvarchar(35),
	@LogTypeFriendlyName nvarchar(50),
	@LogTypeDescription nvarchar(128),
	@LogTypeOwner nvarchar(100),
	@LogTypeCSSClass nvarchar(40)
AS
UPDATE dbo.EventLogTypes
	SET LogTypeFriendlyName = @LogTypeFriendlyName,
	LogTypeDescription = @LogTypeDescription,
	LogTypeOwner = @LogTypeOwner,
	LogTypeCSSClass = @LogTypeCSSClass
WHERE	LogTypeKey = @LogTypeKey
GO
