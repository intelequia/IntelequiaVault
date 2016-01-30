CREATE TABLE [dbo].[SearchCommonWords]
(
[CommonWordID] [int] NOT NULL IDENTITY(1, 1),
[CommonWord] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Locale] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchCommonWords] ADD CONSTRAINT [PK_SearchCommonWords] PRIMARY KEY CLUSTERED  ([CommonWordID]) ON [PRIMARY]
GO
