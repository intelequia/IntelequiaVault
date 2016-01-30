CREATE TABLE [dbo].[ExtensionUrlProviders]
(
[ExtensionUrlProviderID] [int] NOT NULL IDENTITY(1, 1),
[ProviderName] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ProviderType] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingsControlSrc] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL,
[IsActive] [bit] NOT NULL,
[RewriteAllUrls] [bit] NOT NULL,
[RedirectAllUrls] [bit] NOT NULL,
[ReplaceAllUrls] [bit] NOT NULL,
[DesktopModuleId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExtensionUrlProviders] ADD CONSTRAINT [PK_ExtensionUrlProviders] PRIMARY KEY CLUSTERED  ([ExtensionUrlProviderID]) ON [PRIMARY]
GO
