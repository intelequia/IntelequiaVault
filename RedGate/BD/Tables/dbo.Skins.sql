CREATE TABLE [dbo].[Skins]
(
[SkinID] [int] NOT NULL IDENTITY(1, 1),
[SkinPackageID] [int] NOT NULL,
[SkinSrc] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Skins] ADD CONSTRAINT [PK_Skins] PRIMARY KEY CLUSTERED  ([SkinID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Skins] WITH NOCHECK ADD CONSTRAINT [FK_Skins_SkinPackages] FOREIGN KEY ([SkinPackageID]) REFERENCES [dbo].[SkinPackages] ([SkinPackageID]) ON DELETE CASCADE
GO
