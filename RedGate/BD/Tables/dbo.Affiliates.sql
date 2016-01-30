CREATE TABLE [dbo].[Affiliates]
(
[AffiliateId] [int] NOT NULL IDENTITY(1, 1),
[VendorId] [int] NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[CPC] [float] NOT NULL,
[Clicks] [int] NOT NULL,
[CPA] [float] NOT NULL,
[Acquisitions] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Affiliates] ADD CONSTRAINT [PK_Affiliates] PRIMARY KEY CLUSTERED  ([AffiliateId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Affiliates] ADD CONSTRAINT [FK_Affiliates_Vendors] FOREIGN KEY ([VendorId]) REFERENCES [dbo].[Vendors] ([VendorId]) ON DELETE CASCADE
GO
