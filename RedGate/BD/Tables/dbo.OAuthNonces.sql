CREATE TABLE [dbo].[OAuthNonces]
(
[Context] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Code] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Timestamp] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthNonces] ADD CONSTRAINT [PK_dbo.OAuthNonces] PRIMARY KEY CLUSTERED  ([Context], [Code], [Timestamp]) ON [PRIMARY]
GO
