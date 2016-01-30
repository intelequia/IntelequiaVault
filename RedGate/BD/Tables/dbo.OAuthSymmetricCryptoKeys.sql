CREATE TABLE [dbo].[OAuthSymmetricCryptoKeys]
(
[Bucket] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Handle] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[ExpiresUtc] [datetime] NOT NULL,
[Secret] [varbinary] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthSymmetricCryptoKeys] ADD CONSTRAINT [PK_dbo.OAuthSymmetricCryptoKeys] PRIMARY KEY CLUSTERED  ([Bucket]) ON [PRIMARY]
GO
