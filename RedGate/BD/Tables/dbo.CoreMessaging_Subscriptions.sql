CREATE TABLE [dbo].[CoreMessaging_Subscriptions]
(
[SubscriptionId] [int] NOT NULL IDENTITY(1, 1),
[UserId] [int] NOT NULL,
[PortalId] [int] NULL,
[SubscriptionTypeId] [int] NOT NULL,
[ObjectKey] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[ObjectData] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[ModuleId] [int] NULL,
[TabId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_Subscriptions] ADD CONSTRAINT [PK_CoreMessaging_Subscriptions] PRIMARY KEY CLUSTERED  ([SubscriptionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_Subscriptions] ADD CONSTRAINT [FK_CoreMessaging_Subscriptions_Modules] FOREIGN KEY ([ModuleId]) REFERENCES [dbo].[Modules] ([ModuleID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_Subscriptions] ADD CONSTRAINT [FK_CoreMessaging_Subscriptions_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_Subscriptions] ADD CONSTRAINT [FK_CoreMessaging_Subscriptions_Subscriptions_Type] FOREIGN KEY ([SubscriptionTypeId]) REFERENCES [dbo].[CoreMessaging_SubscriptionTypes] ([SubscriptionTypeId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CoreMessaging_Subscriptions] ADD CONSTRAINT [FK_CoreMessaging_Subscriptions_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
