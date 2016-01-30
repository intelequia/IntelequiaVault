CREATE TABLE [dbo].[SkinControls]
(
[SkinControlID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL CONSTRAINT [DF_SkinControls_PackageID] DEFAULT ((-1)),
[ControlKey] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ControlSrc] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[IconFile] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[HelpUrl] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[SupportsPartialRendering] [bit] NOT NULL CONSTRAINT [DF_SkinControls_SupportsPartialRendering] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SkinControls] ADD CONSTRAINT [PK_SkinControls] PRIMARY KEY CLUSTERED  ([SkinControlID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SkinControls] WITH NOCHECK ADD CONSTRAINT [FK_SkinControls_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
