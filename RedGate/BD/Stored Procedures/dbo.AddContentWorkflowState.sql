SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddContentWorkflowState]
	@WorkflowID	int,
	@StateName nvarchar(40),
	@Order int,
	@IsActive bit,
	@SendEmail bit,
	@SendMessage bit,
	@IsDisposalState bit,
	@OnCompleteMessageSubject nvarchar(256),
	@OnCompleteMessageBody nvarchar(1024),
	@OnDiscardMessageSubject nvarchar(256),
	@OnDiscardMessageBody nvarchar(1024)
AS

INSERT INTO dbo.ContentWorkflowStates (
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
)
VALUES (
	@WorkflowID,
	@StateName,
	@Order,
	@IsActive,
	@SendEmail,
	@SendMessage,
	@IsDisposalState,
	@OnCompleteMessageSubject,
	@OnCompleteMessageBody,
	@OnDiscardMessageSubject,
	@OnDiscardMessageBody
)

SELECT SCOPE_IDENTITY()
GO
