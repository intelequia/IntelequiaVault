CREATE TABLE [dbo].[SynonymsGroups]
(
[SynonymsGroupID] [int] NOT NULL IDENTITY(1, 1),
[SynonymsTags] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PortalID] [int] NOT NULL,
[CultureCode] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SynonymsGroups] ADD CONSTRAINT [PK_SynonymsGroups] PRIMARY KEY CLUSTERED  ([SynonymsGroupID]) ON [PRIMARY]
GO
