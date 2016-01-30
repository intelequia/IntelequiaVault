SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowStates]
	@WorkflowID int
AS
    SELECT 
		[StateID],
		[WorkflowID],
		[StateName],
		[Order],
		[IsActive],
		[SendEmail],
		[SendMessage],
		[IsDisposalState],
		[OnCompleteMessageSubject],
		[OnCompleteMessageBody],
		[OnDiscardMessageSubject],
		[OnDiscardMessageBody]
	FROM dbo.ContentWorkflowStates
    WHERE WorkflowID = @WorkflowID
GO
