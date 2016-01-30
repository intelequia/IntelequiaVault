CREATE TABLE [dbo].[Dashboard_Controls]
(
[DashboardControlID] [int] NOT NULL IDENTITY(1, 1),
[DashboardControlKey] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[IsEnabled] [bit] NOT NULL,
[DashboardControlSrc] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[DashboardControlLocalResources] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ControllerClass] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NULL,
[ViewOrder] [int] NOT NULL CONSTRAINT [DF_Dashboard_Controls_ViewOrder] DEFAULT ((0)),
[PackageID] [int] NOT NULL CONSTRAINT [DF_Dashboard_Controls_PackageID] DEFAULT ((-1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dashboard_Controls] ADD CONSTRAINT [PK_Dashboard] PRIMARY KEY CLUSTERED  ([DashboardControlID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dashboard_Controls] WITH NOCHECK ADD CONSTRAINT [FK_Dashboard_Controls_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
