CREATE TABLE [dbo].[OAuthResources]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Identifier] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[AuthenticationTokenName] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[AuthenticationUrl] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[AuthenticationKey] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[PublicTokenEncryptionKey] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthResources] ADD CONSTRAINT [PK_dbo.OAuthResources] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
