CREATE TABLE [dbo].[iss_IntelequiaSecure_Message]
(
[MessageId] [int] NOT NULL IDENTITY(1, 1),
[MessageFrom] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[MessageTo] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[MessageCc] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[MessageCco] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Subject] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Body] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ExpireDate] [datetime] NOT NULL,
[Cd] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Message_Cd] DEFAULT (getdate()),
[Cu] [int] NOT NULL,
[Md] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Message_Md] DEFAULT (getdate()),
[Mu] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Message] ADD CONSTRAINT [PK_iss_IntelequiaSecure_Message] PRIMARY KEY CLUSTERED  ([MessageId]) ON [PRIMARY]
GO
