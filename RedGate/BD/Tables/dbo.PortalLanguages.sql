CREATE TABLE [dbo].[PortalLanguages]
(
[PortalLanguageID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[LanguageID] [int] NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[IsPublished] [bit] NOT NULL CONSTRAINT [DF_PortalLanguages_IsPublished] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalLanguages] ADD CONSTRAINT [PK_PortalLanguages] PRIMARY KEY CLUSTERED  ([PortalLanguageID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PortalLanguages] ON [dbo].[PortalLanguages] ([PortalID], [LanguageID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalLanguages] WITH NOCHECK ADD CONSTRAINT [FK_PortalLanguages_PortalLanguages] FOREIGN KEY ([LanguageID]) REFERENCES [dbo].[Languages] ([LanguageID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalLanguages] ADD CONSTRAINT [FK_PortalLanguages_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
