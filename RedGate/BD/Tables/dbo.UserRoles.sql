CREATE TABLE [dbo].[UserRoles]
(
[UserRoleID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[RoleID] [int] NOT NULL,
[ExpiryDate] [datetime] NULL,
[IsTrialUsed] [bit] NULL,
[EffectiveDate] [datetime] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[Status] [int] NOT NULL CONSTRAINT [DF_UserRoles_Status] DEFAULT ((1)),
[IsOwner] [bit] NOT NULL CONSTRAINT [DF_UserRoles_IsOwner] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRoles] WITH NOCHECK ADD CONSTRAINT [CK_UserRoles_RoleId] CHECK (([RoleId]>=(0)))
GO
ALTER TABLE [dbo].[UserRoles] ADD CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED  ([UserRoleID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRoles_RoleUser] ON [dbo].[UserRoles] ([RoleID], [UserID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRoles_UserRole] ON [dbo].[UserRoles] ([UserID], [RoleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRoles] ADD CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] ADD CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
