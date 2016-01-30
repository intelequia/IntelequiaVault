SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- use new FK
CREATE VIEW [dbo].[vw_ModulePermissions]
AS
SELECT  MP.ModulePermissionID,
        MP.ModuleID,
        MP.PortalID,
        P.PermissionID,
        MP.RoleID,
        R.RoleName,
        MP.AllowAccess,
        MP.UserID,
        U.Username,
        U.DisplayName,
        P.PermissionCode,
        P.ModuleDefID,
        P.PermissionKey,
        P.PermissionName,
        MP.CreatedByUserID,
        MP.CreatedOnDate,
        MP.LastModifiedByUserID,
        MP.LastModifiedOnDate
FROM        dbo.[ModulePermission] AS MP
 INNER JOIN dbo.[Permission]       AS P  ON MP.PermissionID = P.PermissionID
 LEFT  JOIN dbo.[Roles]            AS R  ON MP.RoleID       = R.RoleID
 LEFT  JOIN dbo.[Users]            AS U  ON MP.UserID       = U.UserID
GO
