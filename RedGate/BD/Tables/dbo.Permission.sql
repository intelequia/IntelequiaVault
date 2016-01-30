CREATE TABLE [dbo].[Permission]
(
[PermissionID] [int] NOT NULL IDENTITY(1, 1),
[PermissionCode] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ModuleDefID] [int] NOT NULL,
[PermissionKey] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PermissionName] [varchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ViewOrder] [int] NOT NULL CONSTRAINT [DF_Permission_ViewOrder] DEFAULT ((9999)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permission] ADD CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED  ([PermissionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permission] ADD CONSTRAINT [IX_Permission] UNIQUE NONCLUSTERED  ([PermissionCode], [ModuleDefID], [PermissionKey]) ON [PRIMARY]
GO
