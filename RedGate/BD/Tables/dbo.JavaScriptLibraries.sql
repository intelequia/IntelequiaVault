CREATE TABLE [dbo].[JavaScriptLibraries]
(
[JavaScriptLibraryID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL,
[LibraryName] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Version] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[FileName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ObjectName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PreferredScriptLocation] [int] NOT NULL,
[CDNPath] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JavaScriptLibraries] ADD CONSTRAINT [PK_JavaScriptLIbraries] PRIMARY KEY CLUSTERED  ([JavaScriptLibraryID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JavaScriptLibraries] ADD CONSTRAINT [FK_JavaScriptLibrariesPackages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE
GO
