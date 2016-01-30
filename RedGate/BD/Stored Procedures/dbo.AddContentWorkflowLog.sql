SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddContentWorkflowLog]
	@Action nvarchar(40),
	@Comment nvarchar(256),
	@User int,
	@WorkflowID int,
	@ContentItemID int
AS
    INSERT INTO dbo.[ContentWorkflowLogs] (
		[Action],
		[Comment],
		[Date],
		[User],
		[WorkflowID],
		[ContentItemID]
	) VALUES (
		@Action,
		@Comment,
		getdate(),
		@User,
		@WorkflowID,
		@ContentItemID
	)

	SELECT SCOPE_IDENTITY()
GO
