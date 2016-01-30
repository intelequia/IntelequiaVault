CREATE TABLE [dbo].[TabPermission]
(
[TabPermissionID] [int] NOT NULL IDENTITY(1, 1),
[TabID] [int] NOT NULL,
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
ALTER TABLE [dbo].[TabPermission] ADD CONSTRAINT [PK_TabPermission] PRIMARY KEY CLUSTERED  ([TabPermissionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TabPermission_Permission] ON [dbo].[TabPermission] ([PermissionID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TabPermission_Roles] ON [dbo].[TabPermission] ([RoleID], [TabID], [PermissionID]) INCLUDE ([AllowAccess]) WHERE ([RoleID] IS NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TabPermission_Tabs] ON [dbo].[TabPermission] ([TabID], [PermissionID], [RoleID], [UserID]) INCLUDE ([AllowAccess]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TabPermission_Users] ON [dbo].[TabPermission] ([UserID], [TabID], [PermissionID]) INCLUDE ([AllowAccess]) WHERE ([UserID] IS NOT NULL) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabPermission] WITH NOCHECK ADD CONSTRAINT [FK_TabPermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPermission] ADD CONSTRAINT [FK_TabPermission_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[TabPermission] WITH NOCHECK ADD CONSTRAINT [FK_TabPermission_Tabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPermission] ADD CONSTRAINT [FK_TabPermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
