CREATE TABLE [dbo].[Taxonomy_Terms]
(
[TermID] [int] NOT NULL IDENTITY(1, 1),
[VocabularyID] [int] NOT NULL,
[ParentTermID] [int] NULL,
[Name] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (2500) COLLATE Modern_Spanish_CI_AS NULL,
[Weight] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Terms_Weight] DEFAULT ((0)),
[TermLeft] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Terms_TermLeft] DEFAULT ((0)),
[TermRight] [int] NOT NULL CONSTRAINT [DF_Taxonomy_Terms_TermRight] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxonomy_Terms] ADD CONSTRAINT [PK_Taxonomy_Terms] PRIMARY KEY CLUSTERED  ([TermID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Taxonomy_Terms] ADD CONSTRAINT [FK_Taxonomy_Terms_Taxonomy_Terms] FOREIGN KEY ([ParentTermID]) REFERENCES [dbo].[Taxonomy_Terms] ([TermID])
GO
ALTER TABLE [dbo].[Taxonomy_Terms] ADD CONSTRAINT [FK_Taxonomy_Terms_Taxonomy_Vocabularies] FOREIGN KEY ([VocabularyID]) REFERENCES [dbo].[Taxonomy_Vocabularies] ([VocabularyID]) ON DELETE CASCADE
GO
