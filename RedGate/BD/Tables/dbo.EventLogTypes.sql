CREATE TABLE [dbo].[EventLogTypes]
(
[LogTypeKey] [nvarchar] (35) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogTypeFriendlyName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogTypeDescription] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogTypeOwner] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogTypeCSSClass] [nvarchar] (40) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventLogTypes] ADD CONSTRAINT [PK_EventLogTypes] PRIMARY KEY CLUSTERED  ([LogTypeKey]) ON [PRIMARY]
GO
