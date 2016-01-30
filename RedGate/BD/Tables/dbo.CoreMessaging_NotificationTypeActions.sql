CREATE TABLE [dbo].[CoreMessaging_NotificationTypeActions]
(
[NotificationTypeActionID] [int] NOT NULL IDENTITY(1, 1),
[NotificationTypeID] [int] NOT NULL,
[NameResourceKey] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[DescriptionResourceKey] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[ConfirmResourceKey] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[Order] [int] NOT NULL,
[APICall] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypeActions] ADD CONSTRAINT [PK_CoreMessaging_NotificationTypeActions] PRIMARY KEY CLUSTERED  ([NotificationTypeActionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CoreMessaging_NotificationTypeActions] ON [dbo].[CoreMessaging_NotificationTypeActions] ([NotificationTypeID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_NotificationTypeActions] ADD CONSTRAINT [FK_CoreMessaging_NotificationTypeActions_CoreMessaging_NotificationTypes] FOREIGN KEY ([NotificationTypeID]) REFERENCES [dbo].[CoreMessaging_NotificationTypes] ([NotificationTypeID]) ON DELETE CASCADE
GO
