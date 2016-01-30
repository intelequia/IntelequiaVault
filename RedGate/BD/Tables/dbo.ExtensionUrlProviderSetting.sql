CREATE TABLE [dbo].[ExtensionUrlProviderSetting]
(
[ExtensionUrlProviderID] [int] NOT NULL,
[PortalID] [int] NOT NULL,
[SettingName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExtensionUrlProviderSetting] ADD CONSTRAINT [PK_ExtensionUrlProviderSetting] PRIMARY KEY CLUSTERED  ([ExtensionUrlProviderID], [PortalID], [SettingName]) ON [PRIMARY]
GO
