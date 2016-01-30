CREATE TABLE [dbo].[OAuthClients]
(
[Id] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ClientSecret] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Callback] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Name] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[ClientType] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthClients] ADD CONSTRAINT [PK_dbo.OAuthClients] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
