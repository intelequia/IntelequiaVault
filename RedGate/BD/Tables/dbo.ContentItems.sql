CREATE TABLE [dbo].[ContentItems]
(
[ContentItemID] [int] NOT NULL IDENTITY(1, 1),
[Content] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[ContentTypeID] [int] NOT NULL,
[TabID] [int] NOT NULL,
[ModuleID] [int] NOT NULL,
[ContentKey] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NULL,
[Indexed] [bit] NOT NULL CONSTRAINT [DF_ContentItems_Indexed] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[StateID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentItems] ADD CONSTRAINT [PK_ContentItems] PRIMARY KEY CLUSTERED  ([ContentItemID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ContentItems_TabID] ON [dbo].[ContentItems] ([TabID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentItems] ADD CONSTRAINT [FK_ContentItems_ContentTypes] FOREIGN KEY ([ContentTypeID]) REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[ContentItems] ADD CONSTRAINT [FK_ContentItems_ContentWorkflowStates] FOREIGN KEY ([StateID]) REFERENCES [dbo].[ContentWorkflowStates] ([StateID]) ON DELETE SET NULL
GO
