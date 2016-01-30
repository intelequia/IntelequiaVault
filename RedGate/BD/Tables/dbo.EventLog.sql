CREATE TABLE [dbo].[EventLog]
(
[LogGUID] [varchar] (36) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogTypeKey] [nvarchar] (35) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogConfigID] [int] NULL,
[LogUserID] [int] NULL,
[LogUserName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[LogPortalID] [int] NULL,
[LogPortalName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[LogCreateDate] [datetime] NOT NULL,
[LogServerName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogProperties] [xml] NULL,
[LogNotificationPending] [bit] NULL,
[LogEventID] [bigint] NOT NULL IDENTITY(1, 1),
[ExceptionHash] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLog] ADD CONSTRAINT [PK_EventLogMaster] PRIMARY KEY CLUSTERED  ([LogEventID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EventLog_LogConfigID] ON [dbo].[EventLog] ([LogConfigID], [LogNotificationPending], [LogCreateDate]) INCLUDE ([LogEventID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EventLog_LogCreateDate] ON [dbo].[EventLog] ([LogCreateDate]) INCLUDE ([LogConfigID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EventLog_LogGUID] ON [dbo].[EventLog] ([LogGUID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EventLog_LogType] ON [dbo].[EventLog] ([LogTypeKey], [LogPortalID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLog] WITH NOCHECK ADD CONSTRAINT [FK_EventLog_EventLogConfig] FOREIGN KEY ([LogConfigID]) REFERENCES [dbo].[EventLogConfig] ([ID])
GO
ALTER TABLE [dbo].[EventLog] WITH NOCHECK ADD CONSTRAINT [FK_EventLog_EventLogTypes] FOREIGN KEY ([LogTypeKey]) REFERENCES [dbo].[EventLogTypes] ([LogTypeKey])
GO
