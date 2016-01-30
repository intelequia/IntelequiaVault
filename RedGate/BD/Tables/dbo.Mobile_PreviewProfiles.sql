CREATE TABLE [dbo].[Mobile_PreviewProfiles]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Width] [int] NOT NULL,
[Height] [int] NOT NULL,
[UserAgent] [nvarchar] (260) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_Mobile_PreviewProfiles_SortOrder] DEFAULT ((0)),
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_PreviewProfiles_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Mobile_PreviewProfiles_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mobile_PreviewProfiles] ADD CONSTRAINT [PK_Mobile_PreviewProfiles] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Mobile_PreviewProfiles_SortOrder] ON [dbo].[Mobile_PreviewProfiles] ([SortOrder]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mobile_PreviewProfiles] ADD CONSTRAINT [FK_Mobile_PreviewProfiles_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
