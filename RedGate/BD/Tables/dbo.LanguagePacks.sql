CREATE TABLE [dbo].[LanguagePacks]
(
[LanguagePackID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL,
[DependentPackageID] [int] NOT NULL,
[LanguageID] [int] NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LanguagePacks] ADD CONSTRAINT [PK_LanguagePacks] PRIMARY KEY CLUSTERED  ([LanguagePackID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_LanguagePacks] ON [dbo].[LanguagePacks] ([LanguageID], [PackageID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LanguagePacks] WITH NOCHECK ADD CONSTRAINT [FK_LanguagePacks_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE
GO
