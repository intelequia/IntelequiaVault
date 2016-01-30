CREATE TABLE [dbo].[Banners]
(
[BannerId] [int] NOT NULL IDENTITY(1, 1),
[VendorId] [int] NOT NULL,
[ImageFile] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[BannerName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Impressions] [int] NOT NULL,
[CPM] [float] NOT NULL,
[Views] [int] NOT NULL CONSTRAINT [DF_Banners_Views] DEFAULT ((0)),
[ClickThroughs] [int] NOT NULL CONSTRAINT [DF_Banners_ClickThroughs] DEFAULT ((0)),
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[CreatedByUser] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[BannerTypeId] [int] NULL,
[Description] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[GroupName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[Criteria] [bit] NOT NULL CONSTRAINT [DF_Banners_Criteria] DEFAULT ((1)),
[URL] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[Width] [int] NOT NULL CONSTRAINT [DF_Banners_Width] DEFAULT ((0)),
[Height] [int] NOT NULL CONSTRAINT [DF_Banners_Height] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banners] ADD CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED  ([BannerId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Banners] ON [dbo].[Banners] ([BannerTypeId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Banners_1] ON [dbo].[Banners] ([VendorId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banners] ADD CONSTRAINT [FK_Banner_Vendor] FOREIGN KEY ([VendorId]) REFERENCES [dbo].[Vendors] ([VendorId]) ON DELETE CASCADE
GO
