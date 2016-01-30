CREATE TABLE [dbo].[PortalAlias]
(
[PortalAliasID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[HTTPAlias] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[BrowserType] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL,
[Skin] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[CultureCode] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL,
[IsPrimary] [bit] NOT NULL CONSTRAINT [DF_PortalAlias_IsPrimary] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalAlias] ADD CONSTRAINT [PK_PortalAlias] PRIMARY KEY CLUSTERED  ([PortalAliasID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalAlias] ADD CONSTRAINT [IX_PortalAlias] UNIQUE NONCLUSTERED  ([HTTPAlias]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalAlias] ADD CONSTRAINT [FK_PortalAlias_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
