CREATE TABLE [dbo].[Roles]
(
[RoleID] [int] NOT NULL IDENTITY(0, 1),
[PortalID] [int] NULL,
[RoleName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL,
[ServiceFee] [money] NULL CONSTRAINT [DF_Roles_ServiceFee] DEFAULT ((0)),
[BillingFrequency] [char] (1) COLLATE Modern_Spanish_CI_AS NULL,
[TrialPeriod] [int] NULL,
[TrialFrequency] [char] (1) COLLATE Modern_Spanish_CI_AS NULL,
[BillingPeriod] [int] NULL,
[TrialFee] [money] NULL,
[IsPublic] [bit] NOT NULL CONSTRAINT [DF_Roles_IsPublic] DEFAULT ((0)),
[AutoAssignment] [bit] NOT NULL CONSTRAINT [DF_Roles_AutoAssignment] DEFAULT ((0)),
[RoleGroupID] [int] NULL,
[RSVPCode] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[IconFile] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[Status] [int] NOT NULL CONSTRAINT [DF_Roles_Status] DEFAULT ((1)),
[SecurityMode] [int] NOT NULL CONSTRAINT [DF_Roles_SecurityMode] DEFAULT ((0)),
[IsSystemRole] [bit] NOT NULL CONSTRAINT [DF_Roles_IsSystemRole] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED  ([RoleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [IX_RoleName] UNIQUE NONCLUSTERED  ([PortalID], [RoleName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Roles] ON [dbo].[Roles] ([BillingFrequency]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_RoleName] ON [dbo].[Roles] ([PortalID], [RoleName]) INCLUDE ([RoleID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Roles_RoleGroup] ON [dbo].[Roles] ([RoleGroupID], [RoleName]) INCLUDE ([RoleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [FK_Roles_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [FK_Roles_RoleGroups] FOREIGN KEY ([RoleGroupID]) REFERENCES [dbo].[RoleGroups] ([RoleGroupID])
GO
