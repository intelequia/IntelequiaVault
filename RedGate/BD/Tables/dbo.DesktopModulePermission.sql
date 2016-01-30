CREATE TABLE [dbo].[DesktopModulePermission]
(
[DesktopModulePermissionID] [int] NOT NULL IDENTITY(1, 1),
[PortalDesktopModuleID] [int] NOT NULL,
[PermissionID] [int] NOT NULL,
[AllowAccess] [bit] NOT NULL,
[RoleID] [int] NULL,
[UserID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [PK_DesktopModulePermission] PRIMARY KEY CLUSTERED  ([DesktopModulePermissionID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DesktopModulePermission_DesktopModules] ON [dbo].[DesktopModulePermission] ([PortalDesktopModuleID], [PermissionID], [RoleID], [UserID]) INCLUDE ([AllowAccess]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DesktopModulePermission_Roles] ON [dbo].[DesktopModulePermission] ([RoleID], [PortalDesktopModuleID], [PermissionID]) INCLUDE ([AllowAccess]) WHERE ([RoleID] IS NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DesktopModulePermission_Users] ON [dbo].[DesktopModulePermission] ([UserID], [PortalDesktopModuleID], [PermissionID]) INCLUDE ([AllowAccess]) WHERE ([UserID] IS NOT NULL) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DesktopModulePermission] WITH NOCHECK ADD CONSTRAINT [FK_DesktopModulePermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [FK_DesktopModulePermission_PortalDesktopModules] FOREIGN KEY ([PortalDesktopModuleID]) REFERENCES [dbo].[PortalDesktopModules] ([PortalDesktopModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [FK_DesktopModulePermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[DesktopModulePermission] ADD CONSTRAINT [FK_DesktopModulePermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
