CREATE TABLE [dbo].[SiteLog]
(
[SiteLogId] [int] NOT NULL IDENTITY(1, 1),
[DateTime] [smalldatetime] NOT NULL,
[PortalId] [int] NOT NULL,
[UserId] [int] NULL,
[Referrer] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[Url] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[UserAgent] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[UserHostAddress] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[UserHostName] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[TabId] [int] NULL,
[AffiliateId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SiteLog] ADD CONSTRAINT [PK_SiteLog] PRIMARY KEY CLUSTERED  ([SiteLogId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SiteLog] ON [dbo].[SiteLog] ([PortalId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SiteLog] ADD CONSTRAINT [FK_SiteLog_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
