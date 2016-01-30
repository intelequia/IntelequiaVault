SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentWorkflowStatePermission]
	@WorkflowStatePermissionID	int
AS
    SELECT *
    FROM dbo.vw_ContentWorkflowStatePermissions
    WHERE WorkflowStatePermissionID = @WorkflowStatePermissionID
GO
