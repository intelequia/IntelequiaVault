CREATE TABLE [dbo].[Taxonomy_Vocabularies]
(
[VocabularyID] [int] NOT NULL IDENTITY(1, 1),
[VocabularyTypeID] [int] NOT NULL,
[Name] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (2500) COLLATE Modern_Spanish_CI_AS NULL,
[Weight] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Vocabularies_Weight] DEFAULT ((0)),
[ScopeID] [int] NULL,
[ScopeTypeID] [int] NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[IsSystem] [bit] NOT NULL CONSTRAINT [DF_Taxonomy_Vocabularies_IsSystem] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxonomy_Vocabularies] ADD CONSTRAINT [PK_Taxonomy_Vocabulary] PRIMARY KEY CLUSTERED  ([VocabularyID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxonomy_Vocabularies] ADD CONSTRAINT [FK_Taxonomy_Vocabularies_Taxonomy_ScopeTypes] FOREIGN KEY ([ScopeTypeID]) REFERENCES [dbo].[Taxonomy_ScopeTypes] ([ScopeTypeID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Taxonomy_Vocabularies] ADD CONSTRAINT [FK_Taxonomy_Vocabularies_Taxonomy_VocabularyTypes] FOREIGN KEY ([VocabularyTypeID]) REFERENCES [dbo].[Taxonomy_VocabularyTypes] ([VocabularyTypeID])
GO
