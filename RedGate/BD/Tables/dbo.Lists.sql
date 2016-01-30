CREATE TABLE [dbo].[Lists]
(
[EntryID] [int] NOT NULL IDENTITY(1, 1),
[ListName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Value] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Text] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ParentID] [int] NOT NULL CONSTRAINT [DF_Lists_ParentID] DEFAULT ((0)),
[Level] [int] NOT NULL CONSTRAINT [DF_Lists_Level] DEFAULT ((0)),
[SortOrder] [int] NOT NULL CONSTRAINT [DF_Lists_SortOrder] DEFAULT ((0)),
[DefinitionID] [int] NOT NULL CONSTRAINT [DF_Lists_DefinitionID] DEFAULT ((0)),
[Description] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[PortalID] [int] NOT NULL CONSTRAINT [DF_Lists_PortalID] DEFAULT ((-1)),
[SystemList] [bit] NOT NULL CONSTRAINT [DF_Lists_SystemList] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lists] ADD CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED  ([EntryID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lists] ADD CONSTRAINT [IX_Lists_ListName_Value_Text_ParentID] UNIQUE NONCLUSTERED  ([ListName], [Value], [Text], [ParentID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Lists_ListName_ParentID] ON [dbo].[Lists] ([ListName], [ParentID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Lists_ParentID] ON [dbo].[Lists] ([ParentID], [ListName], [Value]) INCLUDE ([DefinitionID], [SortOrder], [Text]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Lists_SortOrder] ON [dbo].[Lists] ([PortalID], [ParentID], [ListName], [SortOrder]) INCLUDE ([DefinitionID], [Text], [Value]) ON [PRIMARY]
GO
