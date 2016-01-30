CREATE TABLE [dbo].[Portals]
(
[PortalID] [int] NOT NULL IDENTITY(0, 1),
[ExpiryDate] [datetime] NULL,
[UserRegistration] [int] NOT NULL CONSTRAINT [DF_Portals_UserRegistration] DEFAULT ((0)),
[BannerAdvertising] [int] NOT NULL CONSTRAINT [DF_Portals_BannerAdvertising] DEFAULT ((0)),
[AdministratorId] [int] NULL,
[Currency] [char] (3) COLLATE Modern_Spanish_CI_AS NULL,
[HostFee] [money] NOT NULL CONSTRAINT [DF_Portals_HostFee] DEFAULT ((0)),
[HostSpace] [int] NOT NULL CONSTRAINT [DF_Portals_HostSpace] DEFAULT ((0)),
[AdministratorRoleId] [int] NULL,
[RegisteredRoleId] [int] NULL,
[GUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Portals_GUID] DEFAULT (newid()),
[PaymentProcessor] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ProcessorUserId] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ProcessorPassword] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[SiteLogHistory] [int] NULL,
[DefaultLanguage] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL CONSTRAINT [DF_Portals_DefaultLanguage] DEFAULT ('en-US'),
[TimezoneOffset] [int] NOT NULL CONSTRAINT [DF_Portals_TimezoneOffset] DEFAULT ((-8)),
[HomeDirectory] [varchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL CONSTRAINT [DF_Portals_HomeDirectory] DEFAULT (''),
[PageQuota] [int] NOT NULL CONSTRAINT [DF_Portals_PageQuota] DEFAULT ((0)),
[UserQuota] [int] NOT NULL CONSTRAINT [DF_Portals_UserQuota] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[PortalGroupID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Portals] ADD CONSTRAINT [PK_Portals] PRIMARY KEY CLUSTERED  ([PortalID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Portals_AdministratorId] ON [dbo].[Portals] ([AdministratorId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Portals_DefaultLanguage] ON [dbo].[Portals] ([DefaultLanguage]) ON [PRIMARY]
GO
