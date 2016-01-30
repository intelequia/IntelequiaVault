CREATE TABLE [dbo].[OAuthScopes]
(
[Identifier] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthScopes] ADD CONSTRAINT [PK_dbo.OAuthScopes] PRIMARY KEY CLUSTERED  ([Identifier]) ON [PRIMARY]
GO
