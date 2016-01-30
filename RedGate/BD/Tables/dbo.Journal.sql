CREATE TABLE [dbo].[Journal]
(
[JournalId] [int] NOT NULL IDENTITY(1, 1),
[JournalTypeId] [int] NOT NULL,
[UserId] [int] NULL,
[DateCreated] [datetime] NULL,
[DateUpdated] [datetime] NULL,
[PortalId] [int] NULL,
[ProfileId] [int] NOT NULL CONSTRAINT [DF_Journal_ProfileId] DEFAULT ((-1)),
[GroupId] [int] NOT NULL CONSTRAINT [DF_Journal_GroupId] DEFAULT ((-1)),
[Title] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[Summary] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[ItemData] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[ImageURL] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[ObjectKey] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[AccessKey] [uniqueidentifier] NULL,
[ContentItemId] [int] NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Journal_IsDeleted] DEFAULT ((0)),
[CommentsDisabled] [bit] NOT NULL CONSTRAINT [DF_Journal_CommentsDisabled] DEFAULT ((0)),
[CommentsHidden] [bit] NOT NULL CONSTRAINT [DF_Journal_CommentsHidden] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal] ADD CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED  ([JournalId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Journal_ContentItemId] ON [dbo].[Journal] ([ContentItemId]) INCLUDE ([GroupId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal] WITH NOCHECK ADD CONSTRAINT [FK_Journal_JournalTypes] FOREIGN KEY ([JournalTypeId]) REFERENCES [dbo].[Journal_Types] ([JournalTypeId])
GO
ALTER TABLE [dbo].[Journal] NOCHECK CONSTRAINT [FK_Journal_JournalTypes]
GO
