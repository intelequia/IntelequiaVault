SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowLogs]
	@ContentItemID int,
	@WorkflowID int
AS
    SELECT *
	FROM dbo.[ContentWorkflowLogs]
	WHERE ContentItemID = @ContentItemID AND WorkflowID = @WorkflowID
GO
