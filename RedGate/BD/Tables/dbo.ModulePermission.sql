CREATE TABLE [dbo].[ModulePermission]
(
[ModulePermissionID] [int] NOT NULL IDENTITY(1, 1),
[ModuleID] [int] NOT NULL,
[PermissionID] [int] NOT NULL,
[AllowAccess] [bit] NOT NULL,
[RoleID] [int] NULL,
[UserID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[PortalID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModulePermission] ADD CONSTRAINT [PK_ModulePermission] PRIMARY KEY CLUSTERED  ([ModulePermissionID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ModulePermission_Modules] ON [dbo].[ModulePermission] ([ModuleID], [PermissionID], [PortalID], [RoleID], [UserID]) INCLUDE ([AllowAccess]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModulePermission_Permission] ON [dbo].[ModulePermission] ([PermissionID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ModulePermission_Roles] ON [dbo].[ModulePermission] ([RoleID], [ModuleID], [PermissionID], [PortalID]) INCLUDE ([AllowAccess]) WHERE ([RoleID] IS NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ModulePermission_Users] ON [dbo].[ModulePermission] ([UserID], [ModuleID], [PermissionID], [PortalID]) INCLUDE ([AllowAccess]) WHERE ([UserID] IS NOT NULL) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModulePermission] WITH NOCHECK ADD CONSTRAINT [FK_ModulePermission_Modules] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Modules] ([ModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] WITH NOCHECK ADD CONSTRAINT [FK_ModulePermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ModulePermission] ADD CONSTRAINT [FK_ModulePermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[ModulePermission] ADD CONSTRAINT [FK_ModulePermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
