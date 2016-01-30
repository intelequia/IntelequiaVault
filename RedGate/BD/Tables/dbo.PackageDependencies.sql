CREATE TABLE [dbo].[PackageDependencies]
(
[PackageDependencyID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL,
[PackageName] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Version] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PackageDependencies] ADD CONSTRAINT [PK_PackageDependencies] PRIMARY KEY CLUSTERED  ([PackageDependencyID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PackageDependencies] ADD CONSTRAINT [FK_PackageDependencies_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE
GO
