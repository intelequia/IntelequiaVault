SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteContentWorkflowLogs]
	@ContentItemID int,
	@WorkflowID int
AS
    DELETE FROM dbo.[ContentWorkflowLogs]
	WHERE ContentItemID = @ContentItemID AND WorkflowID = @WorkflowID

	SELECT @@ROWCOUNT
GO
