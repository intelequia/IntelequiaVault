CREATE TABLE [dbo].[ContentWorkflowActions]
(
[ActionId] [int] NOT NULL IDENTITY(1, 1),
[ContentTypeId] [int] NOT NULL,
[ActionType] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ActionSource] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowActions] ADD CONSTRAINT [PK_ContentWorkflowActions] PRIMARY KEY CLUSTERED  ([ActionId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ContentTypeId_ActionType] ON [dbo].[ContentWorkflowActions] ([ContentTypeId], [ActionType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowActions] ADD CONSTRAINT [FK_ContentWorkflowActions_ContentTypes] FOREIGN KEY ([ContentTypeId]) REFERENCES [dbo].[ContentTypes] ([ContentTypeID]) ON DELETE CASCADE
GO
