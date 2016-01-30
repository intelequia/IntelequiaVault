CREATE TABLE [dbo].[SkinPackages]
(
[SkinPackageID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL,
[PortalID] [int] NULL,
[SkinName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SkinType] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SkinPackages] ADD CONSTRAINT [PK_SkinPackages] PRIMARY KEY CLUSTERED  ([SkinPackageID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SkinPackages] WITH NOCHECK ADD CONSTRAINT [FK_SkinPackages_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
