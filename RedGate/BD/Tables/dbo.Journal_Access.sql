CREATE TABLE [dbo].[Journal_Access]
(
[JournalAccessId] [int] NOT NULL IDENTITY(1, 1),
[JournalTypeId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[AccessKey] [uniqueidentifier] NOT NULL,
[IsEnabled] [bit] NOT NULL,
[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_Access] ADD CONSTRAINT [PK_Journal_Access] PRIMARY KEY CLUSTERED  ([JournalAccessId]) ON [PRIMARY]
GO
