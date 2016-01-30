SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteRole]
    @RoleId Int -- ID of role to delete. System Roles ignored (deletion of system roles not supported)
AS
BEGIN
    IF @RoleId >= 0 BEGIN
        DELETE FROM dbo.[DesktopModulePermission] WHERE RoleID = @RoleId
        DELETE FROM dbo.[FolderPermission]        WHERE RoleID = @RoleId
        DELETE FROM dbo.[ModulePermission]        WHERE RoleID = @RoleId
        DELETE FROM dbo.[TabPermission]           WHERE RoleID = @RoleId
        DELETE FROM dbo.[Roles]                   WHERE RoleID = @RoleId
    END
END
GO
