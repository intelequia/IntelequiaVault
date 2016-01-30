SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUsersByRolename]
	@PortalID	INT,
	@Rolename	NVARCHAR(50)
AS
	DECLARE @UserPortalId INT
	DECLARE @PortalGroupId INT
	SELECT @PortalGroupId = PortalGroupId FROM dbo.[Portals] WHERE PortalID = @PortalID
	IF EXISTS(SELECT PortalGroupID FROM dbo.[PortalGroups] WHERE PortalGroupID = @PortalGroupId)
	BEGIN
		SELECT @UserPortalId = MasterPortalID FROM dbo.[PortalGroups] WHERE PortalGroupID = @PortalGroupId
	END
	ELSE
	BEGIN
		SELECT @UserPortalId = @PortalID
	END
	SELECT     
		U.*, 
		UP.PortalId, 
		UP.Authorised, 
		UP.IsDeleted,
		UP.RefreshRoles,
		UP.VanityUrl
	FROM dbo.UserPortals AS UP 
			RIGHT OUTER JOIN dbo.UserRoles  UR 
			INNER JOIN dbo.Roles R ON UR.RoleID = R.RoleID 
			RIGHT OUTER JOIN dbo.Users AS U ON UR.UserID = U.UserID 
		ON UP.UserId = U.UserID	
	WHERE ( UP.PortalId = @UserPortalId OR @UserPortalId IS Null )
		AND (UP.IsDeleted = 0 OR UP.IsDeleted Is NULL)
		AND (R.RoleName = @Rolename)
		AND (R.PortalId = @PortalID OR @PortalID IS Null )
	ORDER BY U.FirstName + ' ' + U.LastName
GO
