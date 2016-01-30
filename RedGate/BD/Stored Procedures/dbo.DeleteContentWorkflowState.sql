SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteContentWorkflowState]
	@StateID int
AS
    DELETE FROM dbo.ContentWorkflowStates
    WHERE StateID = @StateID
GO
