CREATE TABLE [dbo].[OAuthAuthorizations]
(
[AuthorizationId] [int] NOT NULL IDENTITY(1, 1),
[ClientId] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NULL,
[UserId] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NULL,
[ResourceId] [int] NOT NULL,
[Scope] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedOnUtc] [datetime] NOT NULL,
[ExpirationDateUtc] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthAuthorizations] ADD CONSTRAINT [PK_dbo.OAuthAuthorizations] PRIMARY KEY CLUSTERED  ([AuthorizationId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthAuthorizations] ADD CONSTRAINT [FK_dbo.OAuthAuthorizations_dbo.OAuthClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[OAuthClients] ([Id])
GO
ALTER TABLE [dbo].[OAuthAuthorizations] ADD CONSTRAINT [FK_dbo.Authorizations_dbo.OAuthUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[OAuthUsers] ([Id])
GO
