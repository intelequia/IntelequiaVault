CREATE TABLE [dbo].[Mobile_Redirections]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Type] [int] NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_Mobile_Redirections_SortOrder] DEFAULT ((0)),
[SourceTabId] [int] NOT NULL,
[IncludeChildTabs] [bit] NOT NULL,
[TargetType] [int] NOT NULL,
[TargetValue] [nvarchar] (260) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Enabled] [bit] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_Redirections_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_Redirections_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mobile_Redirections] ADD CONSTRAINT [PK_Mobile_Redirections] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Mobile_Redirections_SortOrder] ON [dbo].[Mobile_Redirections] ([SortOrder]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mobile_Redirections] ADD CONSTRAINT [FK_Mobile_Redirections_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
