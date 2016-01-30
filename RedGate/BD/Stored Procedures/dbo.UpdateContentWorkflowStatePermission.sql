SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateContentWorkflowStatePermission]
	@WorkflowStatePermissionID int, 
	@StateID int, 
	@PermissionID int, 
	@RoleID int ,
	@AllowAccess bit,
    @UserID int,
	@LastModifiedByUserID	int
AS
    UPDATE dbo.ContentWorkflowStatePermission 
    SET     
	    [StateID] = @StateID,
	    [PermissionID] = @PermissionID,
	    [RoleID] = @RoleID,
	    [AllowAccess] = @AllowAccess,
        [UserID] = @UserID,
        [LastModifiedByUserID] = @LastModifiedByUserID,
	    [LastModifiedOnDate] = getdate()
    WHERE
		[WorkflowStatePermissionID] = @WorkflowStatePermissionID
GO
