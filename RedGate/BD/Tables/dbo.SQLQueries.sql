CREATE TABLE [dbo].[SQLQueries]
(
[QueryId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Query] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ConnectionStringName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserId] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedByUserId] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SQLQueries] ADD CONSTRAINT [PK_SavedQueries] PRIMARY KEY CLUSTERED  ([QueryId]) ON [PRIMARY]
GO
