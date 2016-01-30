CREATE TABLE [dbo].[TabSettings]
(
[TabID] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabSettings] ADD CONSTRAINT [PK_TabSettings] PRIMARY KEY NONCLUSTERED  ([TabID], [SettingName]) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_TabSettings_TabID_SettingName] ON [dbo].[TabSettings] ([TabID], [SettingName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabSettings] WITH NOCHECK ADD CONSTRAINT [FK_TabSettings_Tabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
