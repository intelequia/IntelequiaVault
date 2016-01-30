SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowUsageCount]
	@WorkflowId INT
AS
	SELECT COUNT(*)
	FROM dbo.[vw_ContentWorkflowUsage] wu 	
	WHERE wu.WorkflowID = @WorkflowId
GO
