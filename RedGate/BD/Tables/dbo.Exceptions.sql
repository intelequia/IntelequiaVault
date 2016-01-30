CREATE TABLE [dbo].[Exceptions]
(
[ExceptionHash] [varchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Message] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NOT NULL,
[StackTrace] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[InnerMessage] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[InnerStackTrace] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Source] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exceptions] ADD CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED  ([ExceptionHash]) ON [PRIMARY]
GO
