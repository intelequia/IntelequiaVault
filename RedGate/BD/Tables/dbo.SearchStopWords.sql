CREATE TABLE [dbo].[SearchStopWords]
(
[StopWordsID] [int] NOT NULL IDENTITY(1, 1),
[StopWords] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL,
[PortalID] [int] NOT NULL,
[CultureCode] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SearchStopWords] ADD CONSTRAINT [PK_SearchStopWords] PRIMARY KEY CLUSTERED  ([StopWordsID]) ON [PRIMARY]
GO
