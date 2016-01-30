CREATE TABLE [dbo].[Version]
(
[VersionId] [int] NOT NULL IDENTITY(1, 1),
[Major] [int] NOT NULL,
[Minor] [int] NOT NULL,
[Build] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL,
[Increment] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Version] ADD CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED  ([VersionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Version] ADD CONSTRAINT [IX_Version] UNIQUE NONCLUSTERED  ([Major], [Minor], [Build], [Increment]) ON [PRIMARY]
GO
