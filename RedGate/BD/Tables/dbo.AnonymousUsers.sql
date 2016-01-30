CREATE TABLE [dbo].[AnonymousUsers]
(
[UserID] [char] (36) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PortalID] [int] NOT NULL,
[TabID] [int] NOT NULL,
[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_AnonymousUsers_CreationDate] DEFAULT (getdate()),
[LastActiveDate] [datetime] NOT NULL CONSTRAINT [DF_AnonymousUsers_LastActiveDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnonymousUsers] ADD CONSTRAINT [PK_AnonymousUsers] PRIMARY KEY CLUSTERED  ([UserID], [PortalID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnonymousUsers] ADD CONSTRAINT [FK_AnonymousUsers_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
