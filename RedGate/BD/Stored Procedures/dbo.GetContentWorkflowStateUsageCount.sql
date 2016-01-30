SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowStateUsageCount]
	@StateId INT
AS
	SELECT COUNT(ci.ContentItemID)
	FROM dbo.[ContentItems] ci 
	WHERE ci.StateId = @StateId
GO
