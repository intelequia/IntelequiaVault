SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- use new FK
CREATE VIEW [dbo].[vw_TabPermissions]
AS
SELECT  TP.TabPermissionID,
        T.TabID,
        T.PortalId,
        P.PermissionID,
        TP.RoleID,
        R.RoleName,
        TP.AllowAccess,
        TP.UserID,
        U.Username,
        U.DisplayName,
        P.PermissionCode,
        P.ModuleDefID,
        P.PermissionKey,
        P.PermissionName,
        TP.CreatedByUserID,
        TP.CreatedOnDate,
        TP.LastModifiedByUserID,
        TP.LastModifiedOnDate
FROM        dbo.[TabPermission]    AS TP
 INNER JOIN dbo.[Tabs]             AS T  ON TP.TabId        = T.TabId
 INNER JOIN dbo.[Permission]       AS P  ON TP.PermissionID = P.PermissionID
 LEFT  JOIN dbo.[Roles]            AS R  ON TP.RoleID       = R.RoleID
 LEFT  JOIN dbo.[Users]            AS U  ON TP.UserID       = U.UserID
GO
