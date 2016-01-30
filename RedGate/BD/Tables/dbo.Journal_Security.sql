CREATE TABLE [dbo].[Journal_Security]
(
[JournalSecurityId] [int] NOT NULL IDENTITY(1, 1),
[JournalId] [int] NOT NULL,
[SecurityKey] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_Security] ADD CONSTRAINT [PK_Journal_Security] PRIMARY KEY CLUSTERED  ([JournalSecurityId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_Security] ADD CONSTRAINT [IX_Journal_Security] UNIQUE NONCLUSTERED  ([JournalId] DESC, [SecurityKey]) ON [PRIMARY]
GO
