SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteContentWorkflowStatePermission]
	@WorkflowStatePermissionID int
AS
    DELETE FROM dbo.ContentWorkflowStatePermission
    WHERE WorkflowStatePermissionID = @WorkflowStatePermissionID
GO
