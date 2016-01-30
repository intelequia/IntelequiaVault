CREATE TABLE [dbo].[ContentTypes_Templates]
(
[TemplateID] [int] NOT NULL IDENTITY(1, 1),
[ContentTypeID] [int] NOT NULL,
[PortalID] [int] NOT NULL,
[Name] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[TemplateFileID] [int] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_ContentTypes_Templatess_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_ContentTypes_Templates_LastModifiedOnDate] DEFAULT (getdate()),
[IsEditTemplate] [bit] NOT NULL CONSTRAINT [DF__ContentTy__IsEdi__0CB0C6D6] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_Templates] ADD CONSTRAINT [PK_ContentTypes_Templates] PRIMARY KEY CLUSTERED  ([TemplateID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_Templates] ADD CONSTRAINT [FK_ContentTypes_Templates_ContentTypes] FOREIGN KEY ([ContentTypeID]) REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[ContentTypes_Templates] ADD CONSTRAINT [FK_ContentTypes_Templates_Files] FOREIGN KEY ([TemplateFileID]) REFERENCES [dbo].[Files] ([FileId])
GO
