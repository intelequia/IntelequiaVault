CREATE TABLE [dbo].[ScheduleItemSettings]
(
[ScheduleID] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScheduleItemSettings] ADD CONSTRAINT [PK_ScheduleItemSettings] PRIMARY KEY CLUSTERED  ([ScheduleID], [SettingName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScheduleItemSettings] WITH NOCHECK ADD CONSTRAINT [FK_ScheduleItemSettings_Schedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[Schedule] ([ScheduleID]) ON DELETE CASCADE
GO
