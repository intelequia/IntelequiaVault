SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- use new FK
CREATE VIEW [dbo].[vw_DesktopModulePermissions]
AS
SELECT  PP.DesktopModulePermissionID,
        PP.PortalDesktopModuleID,
        P.PermissionID,
        PP.RoleID,
        R.RoleName,
        PP.AllowAccess,
        PP.UserID,
        U.Username,
        U.DisplayName,
        P.PermissionCode,
        P.ModuleDefID,
        P.PermissionKey,
        P.PermissionName,
        PP.CreatedByUserID,
        PP.CreatedOnDate,
        PP.LastModifiedByUserID,
        PP.LastModifiedOnDate
FROM        dbo.[DesktopModulePermission] AS PP
 INNER JOIN dbo.[Permission]              AS P  ON PP.PermissionID = P.PermissionID
 LEFT  JOIN dbo.[Roles]                   AS R  ON PP.RoleID = R.RoleID
 LEFT  JOIN dbo.[Users]                   AS U  ON PP.UserID = U.UserID
GO
