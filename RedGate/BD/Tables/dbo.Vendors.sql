CREATE TABLE [dbo].[Vendors]
(
[VendorId] [int] NOT NULL IDENTITY(1, 1),
[VendorName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Street] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[City] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Region] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Country] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[PostalCode] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Telephone] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[PortalId] [int] NULL,
[Fax] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Email] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Website] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[ClickThroughs] [int] NOT NULL CONSTRAINT [DF_Vendors_ClickThroughs] DEFAULT ((0)),
[Views] [int] NOT NULL CONSTRAINT [DF_Vendors_Views] DEFAULT ((0)),
[CreatedByUser] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[LogoFile] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[KeyWords] [ntext] COLLATE Modern_Spanish_CI_AS NULL,
[Unit] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Authorized] [bit] NOT NULL CONSTRAINT [DF_Vendors_Authorized] DEFAULT ((1)),
[FirstName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[Cell] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendors] ADD CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED  ([VendorId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendors] ADD CONSTRAINT [IX_Vendors] UNIQUE NONCLUSTERED  ([PortalId], [VendorName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendors] ADD CONSTRAINT [FK_Vendor_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
