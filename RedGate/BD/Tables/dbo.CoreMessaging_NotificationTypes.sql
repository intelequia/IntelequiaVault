CREATE TABLE [dbo].[CoreMessaging_NotificationTypes]
(
[NotificationTypeID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[TTL] [int] NULL,
[DesktopModuleID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[IsTask] [bit] NOT NULL CONSTRAINT [DF__CoreMessa__IsTas__78DED853] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypes] ADD CONSTRAINT [PK_CoreMessaging_NotificationTypes] PRIMARY KEY CLUSTERED  ([NotificationTypeID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CoreMessaging_NotificationTypes] ON [dbo].[CoreMessaging_NotificationTypes] ([Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypes] ADD CONSTRAINT [FK_CoreMessaging_NotificationTypes_DesktopModules] FOREIGN KEY ([DesktopModuleID]) REFERENCES [dbo].[DesktopModules] ([DesktopModuleID]) ON DELETE CASCADE
GO
