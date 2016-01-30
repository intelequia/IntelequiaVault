CREATE TABLE [dbo].[CoreMessaging_MessageRecipients]
(
[RecipientID] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [int] NOT NULL,
[UserID] [int] NOT NULL,
[Read] [bit] NOT NULL CONSTRAINT [DF__CoreMe__Read__3AC1AA49] DEFAULT ((0)),
[Archived] [bit] NOT NULL CONSTRAINT [DF__CoreM__Archi__3BB5CE82] DEFAULT ((0)),
[EmailSent] [bit] NOT NULL CONSTRAINT [DF__CoreM__Email__3CA9F2BB] DEFAULT ((0)),
[EmailSentDate] [datetime] NULL,
[EmailSchedulerInstance] [uniqueidentifier] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[SendToast] [bit] NOT NULL CONSTRAINT [DF__CoreMessa__SendT__6FBF826D] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_MessageRecipients] ADD CONSTRAINT [PK_CoreMessaging_MessageRecipients] PRIMARY KEY CLUSTERED  ([RecipientID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CoreMessaging_MessageRecipients_UserID] ON [dbo].[CoreMessaging_MessageRecipients] ([UserID], [Read] DESC, [Archived]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_MessageRecipients] ADD CONSTRAINT [FK_CoreMessaging_MessageRecipients_CoreMessaging_Messages] FOREIGN KEY ([MessageID]) REFERENCES [dbo].[CoreMessaging_Messages] ([MessageID]) ON DELETE CASCADE
GO
