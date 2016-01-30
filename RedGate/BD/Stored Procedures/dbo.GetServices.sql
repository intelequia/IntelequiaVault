SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetServices]
    @PortalId  Int, -- pass Null for roles of all sites
    @UserId    Int  -- not null!
AS
BEGIN
    SELECT
        R.*,
        UR.IsOwner,
        UR.UserRoleID,
        UR.UserID,
        UR.ExpiryDate,
        UR.IsTrialUsed,
        UR.EffectiveDate,
        U.DisplayName,
        U.Email
    FROM         dbo.[Users]      U
     INNER JOIN  dbo.[UserRoles] UR ON UR.UserID = U.UserID
     RIGHT JOIN  dbo.[Roles]      R ON UR.RoleID = R.RoleID  AND UR.UserID = @UserId
    WHERE (R.PortalId = @PortalId OR IsNull(@PortalId, -1) = -1)
      AND  R.IsPublic = 1
      AND  R.RoleId  >= 0
	  AND U.UserID = @UserId
    ORDER BY R.RoleName
	OPTION (OPTIMIZE FOR (@PortalId UNKNOWN))
END
GO
