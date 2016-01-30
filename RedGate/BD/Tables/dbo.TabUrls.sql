CREATE TABLE [dbo].[TabUrls]
(
[TabId] [int] NOT NULL,
[SeqNum] [int] NOT NULL,
[Url] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[QueryString] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[HttpStatus] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CultureCode] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[IsSystem] [bit] NOT NULL CONSTRAINT [DF_TabUrls_IsSystem] DEFAULT ((0)),
[PortalAliasId] [int] NULL,
[PortalAliasUsage] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabUrls] ADD CONSTRAINT [PK_TabRedirect] PRIMARY KEY CLUSTERED  ([TabId], [SeqNum]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabUrls] ADD CONSTRAINT [FK_TabUrls_Tabs] FOREIGN KEY ([TabId]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
