CREATE TABLE [dbo].[Messaging_Messages]
(
[MessageID] [bigint] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[FromUserID] [int] NOT NULL,
[ToUserName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[FromUserName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ToUserID] [int] NULL,
[ToRoleID] [int] NULL,
[Status] [tinyint] NOT NULL,
[Subject] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Body] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Date] [datetime] NOT NULL,
[Conversation] [uniqueidentifier] NOT NULL,
[ReplyTo] [bigint] NULL,
[AllowReply] [bit] NOT NULL,
[SkipPortal] [bit] NOT NULL,
[EmailSent] [bit] NOT NULL,
[EmailSentDate] [datetime] NULL,
[EmailSchedulerInstance] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messaging_Messages] ADD CONSTRAINT [PK_Messaging_Messages] PRIMARY KEY CLUSTERED  ([MessageID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Messaging_Messages_EmailSent_EmailSchedulerInstance_Status] ON [dbo].[Messaging_Messages] ([EmailSent], [EmailSchedulerInstance], [Status], [Date] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Messaging_Messages_FromUserID_Status] ON [dbo].[Messaging_Messages] ([FromUserID], [Status], [Date] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Messaging_Messages_ToUserID_Status_SkipPortal] ON [dbo].[Messaging_Messages] ([ToUserID], [Status], [SkipPortal], [Date] DESC) ON [PRIMARY]
GO
