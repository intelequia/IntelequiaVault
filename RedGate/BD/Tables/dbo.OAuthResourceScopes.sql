CREATE TABLE [dbo].[OAuthResourceScopes]
(
[ResourceId] [int] NOT NULL,
[ScopeId] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthResourceScopes] ADD CONSTRAINT [PK_dbo.OAuthResourceScopes] PRIMARY KEY CLUSTERED  ([ResourceId], [ScopeId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OAuthResourceScopes] ADD CONSTRAINT [FK_dbo.ResourceScopes_dbo.OAuthResources_ResourceId] FOREIGN KEY ([ResourceId]) REFERENCES [dbo].[OAuthResources] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OAuthResourceScopes] ADD CONSTRAINT [FK_dbo.ResourceScopes_dbo.OAuthScopes_ScopeId] FOREIGN KEY ([ScopeId]) REFERENCES [dbo].[OAuthScopes] ([Identifier]) ON DELETE CASCADE
GO
