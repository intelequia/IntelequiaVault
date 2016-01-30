CREATE TABLE [dbo].[HostSettings]
(
[SettingName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingIsSecure] [bit] NOT NULL CONSTRAINT [DF_HostSettings_Secure] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HostSettings] ADD CONSTRAINT [PK_HostSettings] PRIMARY KEY CLUSTERED  ([SettingName]) ON [PRIMARY]
GO
