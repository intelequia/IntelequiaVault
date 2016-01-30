CREATE TABLE [dbo].[CKE_Settings]
(
[SettingName] [nvarchar] (300) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [ntext] COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CKE_Settings] ADD CONSTRAINT [PK_CKE_Settings] PRIMARY KEY CLUSTERED  ([SettingName]) ON [PRIMARY]
GO
