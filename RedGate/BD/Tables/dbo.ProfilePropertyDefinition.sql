CREATE TABLE [dbo].[ProfilePropertyDefinition]
(
[PropertyDefinitionID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[ModuleDefID] [int] NULL,
[Deleted] [bit] NOT NULL,
[DataType] [int] NOT NULL,
[DefaultValue] [ntext] COLLATE Modern_Spanish_CI_AS NULL,
[PropertyCategory] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PropertyName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Length] [int] NOT NULL CONSTRAINT [DF_ProfilePropertyDefinition_Length] DEFAULT ((0)),
[Required] [bit] NOT NULL,
[ValidationExpression] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[ViewOrder] [int] NOT NULL,
[Visible] [bit] NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[DefaultVisibility] [int] NULL,
[ReadOnly] [bit] NOT NULL CONSTRAINT [DF_ProfilePropertyDefinition_ReadOnly] DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfilePropertyDefinition] ADD CONSTRAINT [PK_ProfilePropertyDefinition] PRIMARY KEY CLUSTERED  ([PropertyDefinitionID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProfilePropertyDefinition] ON [dbo].[ProfilePropertyDefinition] ([PortalID], [ModuleDefID], [PropertyName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ProfilePropertyDefinition_PropertyName] ON [dbo].[ProfilePropertyDefinition] ([PropertyName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProfilePropertyDefinition] WITH NOCHECK ADD CONSTRAINT [FK_ProfilePropertyDefinition_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
