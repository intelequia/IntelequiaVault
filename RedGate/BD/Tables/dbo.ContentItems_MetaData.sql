CREATE TABLE [dbo].[ContentItems_MetaData]
(
[ContentItemMetaDataID] [int] NOT NULL IDENTITY(1, 1),
[ContentItemID] [int] NOT NULL,
[MetaDataID] [int] NOT NULL,
[MetaDataValue] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentItems_MetaData] ADD CONSTRAINT [PK_Content_MetaData] PRIMARY KEY CLUSTERED  ([ContentItemMetaDataID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentItems_MetaData] WITH NOCHECK ADD CONSTRAINT [FK_ContentItems_MetaData_ContentItems] FOREIGN KEY ([ContentItemID]) REFERENCES [dbo].[ContentItems] ([ContentItemID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ContentItems_MetaData] WITH NOCHECK ADD CONSTRAINT [FK_ContentItems_MetaDataMetaData] FOREIGN KEY ([MetaDataID]) REFERENCES [dbo].[MetaData] ([MetaDataID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
