CREATE TABLE [dbo].[CoreMessaging_MessageAttachments]
(
[MessageAttachmentID] [int] NOT NULL IDENTITY(1, 1),
[MessageID] [int] NOT NULL,
[FileID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_MessageAttachments] ADD CONSTRAINT [PK_CoreMessaging_MessageAttachments] PRIMARY KEY CLUSTERED  ([MessageAttachmentID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CoreMessaging_MessageAttachments_MessageID] ON [dbo].[CoreMessaging_MessageAttachments] ([MessageID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_MessageAttachments] ADD CONSTRAINT [FK_CoreMessaging_MessageAttachments_CoreMessaging_Messages] FOREIGN KEY ([MessageID]) REFERENCES [dbo].[CoreMessaging_Messages] ([MessageID]) ON DELETE CASCADE
GO
