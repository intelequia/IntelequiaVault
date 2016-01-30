CREATE TABLE [dbo].[ContentItems_Tags]
(
[ContentItemTagID] [int] NOT NULL IDENTITY(1, 1),
[ContentItemID] [int] NOT NULL,
[TermID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentItems_Tags] ADD CONSTRAINT [PK_ContentItems_Tags] PRIMARY KEY CLUSTERED  ([ContentItemTagID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentItems_Tags] ON [dbo].[ContentItems_Tags] ([ContentItemID], [TermID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ContentItems_Tags_TermID] ON [dbo].[ContentItems_Tags] ([TermID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentItems_Tags] ADD CONSTRAINT [FK_ContentItems_Tags_ContentItems] FOREIGN KEY ([ContentItemID]) REFERENCES [dbo].[ContentItems] ([ContentItemID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ContentItems_Tags] ADD CONSTRAINT [FK_ContentItems_Tags_Taxonomy_Terms] FOREIGN KEY ([TermID]) REFERENCES [dbo].[Taxonomy_Terms] ([TermID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
