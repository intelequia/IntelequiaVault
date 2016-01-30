CREATE TABLE [dbo].[EventQueue]
(
[EventMessageID] [int] NOT NULL IDENTITY(1, 1),
[EventName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Priority] [int] NOT NULL,
[ProcessorType] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ProcessorCommand] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Body] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Sender] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Subscriber] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[AuthorizedRoles] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ExceptionMessage] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SentDate] [datetime] NOT NULL,
[ExpirationDate] [datetime] NOT NULL,
[Attributes] [ntext] COLLATE Modern_Spanish_CI_AS NOT NULL,
[IsComplete] [bit] NOT NULL CONSTRAINT [DF_EventQueue_IsComplete] DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventQueue] ADD CONSTRAINT [PK_EventQueue] PRIMARY KEY CLUSTERED  ([EventMessageID]) ON [PRIMARY]
GO
