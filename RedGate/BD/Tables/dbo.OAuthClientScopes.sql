CREATE TABLE [dbo].[OAuthClientScopes]
(
[ClientId] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ScopeId] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthClientScopes] ADD CONSTRAINT [PK_dbo.OAuthClientScopes] PRIMARY KEY CLUSTERED  ([ClientId], [ScopeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthClientScopes] ADD CONSTRAINT [FK_dbo.ClientScopes_dbo.OAuthClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[OAuthClients] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OAuthClientScopes] ADD CONSTRAINT [FK_dbo.ClientScopes_dbo.OAuthScopes_ScopeId] FOREIGN KEY ([ScopeId]) REFERENCES [dbo].[OAuthScopes] ([Identifier]) ON DELETE CASCADE
GO
