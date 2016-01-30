CREATE TABLE [dbo].[VendorClassification]
(
[VendorClassificationId] [int] NOT NULL IDENTITY(1, 1),
[VendorId] [int] NOT NULL,
[ClassificationId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VendorClassification] ADD CONSTRAINT [PK_VendorClassification] PRIMARY KEY CLUSTERED  ([VendorClassificationId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VendorClassification] ADD CONSTRAINT [IX_VendorClassification] UNIQUE NONCLUSTERED  ([VendorId], [ClassificationId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_VendorClassification_1] ON [dbo].[VendorClassification] ([ClassificationId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VendorClassification] ADD CONSTRAINT [FK_VendorClassification_Classification] FOREIGN KEY ([ClassificationId]) REFERENCES [dbo].[Classification] ([ClassificationId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendorClassification] ADD CONSTRAINT [FK_VendorClassification_Vendors] FOREIGN KEY ([VendorId]) REFERENCES [dbo].[Vendors] ([VendorId]) ON DELETE CASCADE
GO
