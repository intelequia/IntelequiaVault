CREATE TABLE [dbo].[Assemblies]
(
[AssemblyID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NULL,
[AssemblyName] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Version] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assemblies] ADD CONSTRAINT [PK_PackageAssemblies] PRIMARY KEY CLUSTERED  ([AssemblyID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assemblies] ADD CONSTRAINT [FK_PackageAssemblies_PackageAssemblies] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE
GO
