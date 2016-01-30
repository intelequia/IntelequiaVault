CREATE TABLE [dbo].[ExceptionEvents]
(
[LogEventID] [bigint] NOT NULL,
[AssemblyVersion] [varchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PortalId] [int] NULL,
[UserId] [int] NULL,
[TabId] [int] NULL,
[RawUrl] [nvarchar] (260) COLLATE Modern_Spanish_CI_AS NULL,
[Referrer] [nvarchar] (260) COLLATE Modern_Spanish_CI_AS NULL,
[UserAgent] [nvarchar] (260) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExceptionEvents] ADD CONSTRAINT [PK_ExceptionEvents] PRIMARY KEY CLUSTERED  ([LogEventID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExceptionEvents] ADD CONSTRAINT [FK_ExceptionEvents_LogEventId] FOREIGN KEY ([LogEventID]) REFERENCES [dbo].[EventLog] ([LogEventID]) ON DELETE CASCADE
GO
