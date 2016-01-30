CREATE TABLE [dbo].[EventLogConfig]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[LogTypeKey] [nvarchar] (35) COLLATE Modern_Spanish_CI_AS NULL,
[LogTypePortalID] [int] NULL,
[LoggingIsActive] [bit] NOT NULL,
[KeepMostRecent] [int] NOT NULL,
[EmailNotificationIsActive] [bit] NOT NULL,
[NotificationThreshold] [int] NULL,
[NotificationThresholdTime] [int] NULL,
[NotificationThresholdTimeType] [int] NULL,
[MailFromAddress] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[MailToAddress] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLogConfig] ADD CONSTRAINT [PK_EventLogConfig] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_LogTypeKey_LogTypePortalID] ON [dbo].[EventLogConfig] ([LogTypeKey], [LogTypePortalID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLogConfig] WITH NOCHECK ADD CONSTRAINT [FK_EventLogConfig_EventLogTypes] FOREIGN KEY ([LogTypeKey]) REFERENCES [dbo].[EventLogTypes] ([LogTypeKey])
GO
