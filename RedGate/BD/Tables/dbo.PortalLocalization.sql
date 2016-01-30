CREATE TABLE [dbo].[PortalLocalization]
(
[PortalID] [int] NOT NULL,
[CultureCode] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PortalName] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogoFile] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[FooterText] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[Description] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[KeyWords] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[BackgroundFile] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[HomeTabId] [int] NULL,
[LoginTabId] [int] NULL,
[UserTabId] [int] NULL,
[AdminTabId] [int] NULL,
[SplashTabId] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[RegisterTabId] [int] NULL,
[SearchTabId] [int] NULL,
[Custom404TabId] [int] NULL,
[Custom500TabId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalLocalization] ADD CONSTRAINT [PK_PortalLocalization] PRIMARY KEY CLUSTERED  ([PortalID], [CultureCode]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalLocalization] ADD CONSTRAINT [FK_PortalLocalization_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
