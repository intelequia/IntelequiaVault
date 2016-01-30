CREATE TABLE [dbo].[SearchIndexer]
(
[SearchIndexerID] [int] NOT NULL IDENTITY(1, 1),
[SearchIndexerAssemblyQualifiedName] [char] (200) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchIndexer] ADD CONSTRAINT [PK_SearchIndexer] PRIMARY KEY CLUSTERED  ([SearchIndexerID]) ON [PRIMARY]
GO
