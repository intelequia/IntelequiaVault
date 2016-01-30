SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddContentWorkflowStatePermission]
	@StateID int,
	@PermissionID int,
	@RoleID int,
	@AllowAccess bit,
	@UserID int,
	@CreatedByUserID int
AS

	INSERT INTO dbo.ContentWorkflowStatePermission (
		[StateID],
		[PermissionID],
		[RoleID],
		[AllowAccess],
		[UserID],
		[CreatedByUserID],
		[CreatedOnDate],
		[LastModifiedByUserID],
		[LastModifiedOnDate]
	) VALUES (
		@StateID,
		@PermissionID,
		@RoleID,
		@AllowAccess,
		@UserID,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	)

	SELECT SCOPE_IDENTITY()
GO
