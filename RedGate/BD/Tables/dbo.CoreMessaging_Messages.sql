CREATE TABLE [dbo].[CoreMessaging_Messages]
(
[MessageID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[NotificationTypeID] [int] NULL,
[To] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[From] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[Subject] [nvarchar] (400) COLLATE Modern_Spanish_CI_AS NULL,
[Body] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[ConversationID] [int] NULL,
[ReplyAllAllowed] [bit] NULL,
[SenderUserID] [int] NULL,
[ExpirationDate] [datetime] NULL,
[Context] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[IncludeDismissAction] [bit] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_Messages] ADD CONSTRAINT [PK_CoreMessaging_Messages] PRIMARY KEY CLUSTERED  ([MessageID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CoreMessaging_Messages_SenderUserID] ON [dbo].[CoreMessaging_Messages] ([SenderUserID], [CreatedOnDate] DESC) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_Messages] WITH NOCHECK ADD CONSTRAINT [FK_CoreMessaging_Messages_CoreMessaging_NotificationTypes] FOREIGN KEY ([NotificationTypeID]) REFERENCES [dbo].[CoreMessaging_NotificationTypes] ([NotificationTypeID]) ON DELETE CASCADE
GO
