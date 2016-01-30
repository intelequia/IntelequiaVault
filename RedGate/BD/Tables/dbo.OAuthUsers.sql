CREATE TABLE [dbo].[OAuthUsers]
(
[Id] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreateDateUtc] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthUsers] ADD CONSTRAINT [PK_dbo.OAuthUsers] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
