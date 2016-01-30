CREATE TABLE [dbo].[CoreMessaging_SubscriptionTypes]
(
[SubscriptionTypeId] [int] NOT NULL IDENTITY(1, 1),
[SubscriptionName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[FriendlyName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[DesktopModuleId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_SubscriptionTypes] ADD CONSTRAINT [PK_CoreMessaging_SubscriptionTypes] PRIMARY KEY CLUSTERED  ([SubscriptionTypeId]) ON [PRIMARY]
GO
