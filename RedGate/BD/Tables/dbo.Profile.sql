CREATE TABLE [dbo].[Profile]
(
[ProfileId] [int] NOT NULL IDENTITY(1, 1),
[UserId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[ProfileData] [ntext] COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Profile] ADD CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED  ([ProfileId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Profile] ON [dbo].[Profile] ([UserId], [PortalId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Profile] ADD CONSTRAINT [FK_Profile_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Profile] ADD CONSTRAINT [FK_Profile_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
