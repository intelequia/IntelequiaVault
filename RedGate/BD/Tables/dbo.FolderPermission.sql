CREATE TABLE [dbo].[FolderPermission]
(
[FolderPermissionID] [int] NOT NULL IDENTITY(1, 1),
[FolderID] [int] NOT NULL,
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
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [PK_FolderPermission] PRIMARY KEY CLUSTERED  ([FolderPermissionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FolderPermission_Modules] ON [dbo].[FolderPermission] ([FolderID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FolderPermission_Folders] ON [dbo].[FolderPermission] ([FolderID], [PermissionID], [RoleID], [UserID]) INCLUDE ([AllowAccess]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FolderPermission_Permission] ON [dbo].[FolderPermission] ([PermissionID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FolderPermission_Roles] ON [dbo].[FolderPermission] ([RoleID], [FolderID], [PermissionID]) INCLUDE ([AllowAccess]) WHERE ([RoleID] IS NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FolderPermission_Users] ON [dbo].[FolderPermission] ([UserID], [FolderID], [PermissionID]) INCLUDE ([AllowAccess]) WHERE ([UserID] IS NOT NULL) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [FK_FolderPermission_Folders] FOREIGN KEY ([FolderID]) REFERENCES [dbo].[Folders] ([FolderID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] WITH NOCHECK ADD CONSTRAINT [FK_FolderPermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [FK_FolderPermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[FolderPermission] ADD CONSTRAINT [FK_FolderPermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
