CREATE TABLE [dbo].[ContentTypes]
(
[ContentTypeID] [int] NOT NULL IDENTITY(1, 1),
[ContentType] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PortalID] [int] NOT NULL CONSTRAINT [DF_ContentTypes_PortalID] DEFAULT ((-1)),
[IsDynamic] [bit] NOT NULL CONSTRAINT [DF_ContentTypes_IsDynamic] DEFAULT ((0)),
[Description] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NOT NULL CONSTRAINT [DF_ContentTypes_Description] DEFAULT (''),
[CreatedByUserID] [int] NOT NULL CONSTRAINT [DF_ContentTypes_CreatedByUserID] DEFAULT ((-1)),
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_ContentTypes_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL CONSTRAINT [DF_ContentTypes_LastModifiedByUserID] DEFAULT ((-1)),
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_ContentTypes_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes] ADD CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED  ([ContentTypeID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypes_ContentType] ON [dbo].[ContentTypes] ([ContentType], [PortalID]) ON [PRIMARY]
GO
