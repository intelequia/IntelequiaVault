SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- use new FK
CREATE VIEW [dbo].[vw_FolderPermissions]
AS
SELECT  FP.FolderPermissionID,
        F.FolderID,
        F.FolderPath,
        F.PortalID,
        P.PermissionID,
        FP.RoleID,
        R.RoleName,
        FP.AllowAccess,
        FP.UserID,
        U.Username,
        U.DisplayName,
        P.PermissionCode,
        P.ModuleDefID,
        P.PermissionKey,
        P.PermissionName,
        FP.CreatedByUserID,
        FP.CreatedOnDate,
        FP.LastModifiedByUserID,
        FP.LastModifiedOnDate
FROM         dbo.[FolderPermission] AS FP
 INNER JOIN  dbo.[Folders]          AS F ON FP.FolderID     = F.FolderID
 INNER JOIN  dbo.[Permission]       AS P ON FP.PermissionID = P.PermissionID
 LEFT  JOIN  dbo.[Roles]            AS R ON FP.RoleID       = R.RoleID
 LEFT  JOIN  dbo.[Users]            AS U ON FP.UserID       = U.UserID
GO
