CREATE TABLE [dbo].[ContentTypes_FieldDefinitions]
(
[FieldDefinitionID] [int] NOT NULL IDENTITY(1, 1),
[ContentTypeID] [int] NOT NULL,
[PortalID] [int] NOT NULL,
[Name] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Label] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[FieldTypeID] [int] NOT NULL,
[Order] [int] NOT NULL CONSTRAINT [DF__ContentTy__Order__5FDE205F] DEFAULT ((0)),
[IsReferenceType] [bit] NOT NULL CONSTRAINT [DF__ContentTy__IsRef__0BBCA29D] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_FieldDefinitions] ADD CONSTRAINT [PK_ContentTypes_FieldDefinitions] PRIMARY KEY CLUSTERED  ([FieldDefinitionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_FieldDefinitions] ADD CONSTRAINT [FK_ContentTypes_FieldDefinitions_ContentTypes] FOREIGN KEY ([ContentTypeID]) REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
