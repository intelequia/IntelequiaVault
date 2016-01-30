CREATE TABLE [dbo].[iss_IntelequiaSecure_Permission]
(
[PermissionId] [int] NOT NULL IDENTITY(1, 1),
[ResourceGroupId] [uniqueidentifier] NOT NULL,
[UserId] [int] NULL,
[RolId] [int] NULL,
[ReadPermission] [bit] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Permission_ReadPermission] DEFAULT ((0)),
[WritePermission] [bit] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Permission_WritePermission] DEFAULT ((0)),
[Cd] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Permission_Cd] DEFAULT (getdate()),
[Cu] [int] NOT NULL,
[Md] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Permission_Md] DEFAULT (getdate()),
[Mu] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Permission] ADD CONSTRAINT [PK_iss_IntelequiaSecure_Permission] PRIMARY KEY CLUSTERED  ([PermissionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Permission] ADD CONSTRAINT [FK_iss_IntelequiaSecure_Permission_iss_IntelequiaSecure_Group] FOREIGN KEY ([ResourceGroupId]) REFERENCES [dbo].[iss_IntelequiaSecure_Group] ([ResourceGroupId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Permission] ADD CONSTRAINT [FK_iss_IntelequiaSecure_Permission_Roles] FOREIGN KEY ([RolId]) REFERENCES [dbo].[Roles] ([RoleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Permission] ADD CONSTRAINT [FK_iss_IntelequiaSecure_Permission_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
