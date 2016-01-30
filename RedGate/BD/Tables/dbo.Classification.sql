CREATE TABLE [dbo].[Classification]
(
[ClassificationId] [int] NOT NULL IDENTITY(1, 1),
[ClassificationName] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ParentId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classification] ADD CONSTRAINT [PK_VendorCategory] PRIMARY KEY CLUSTERED  ([ClassificationId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Classification] ON [dbo].[Classification] ([ParentId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classification] ADD CONSTRAINT [FK_Classification_Classification] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Classification] ([ClassificationId])
GO
