CREATE TABLE [dbo].[PackageTypes]
(
[PackageType] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SecurityAccessLevel] [int] NOT NULL,
[EditorControlSrc] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NULL,
[SupportsSideBySideInstallation] [bit] NOT NULL CONSTRAINT [DF__PackageTy__Suppo__7484378A] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PackageTypes] ADD CONSTRAINT [PK_PackageTypes_1] PRIMARY KEY CLUSTERED  ([PackageType]) ON [PRIMARY]
GO
