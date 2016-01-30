CREATE TABLE [dbo].[Languages]
(
[LanguageID] [int] NOT NULL IDENTITY(1, 1),
[CultureCode] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CultureName] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[FallbackCulture] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Languages] ADD CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED  ([LanguageID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Languages] ON [dbo].[Languages] ([CultureCode]) ON [PRIMARY]
GO
