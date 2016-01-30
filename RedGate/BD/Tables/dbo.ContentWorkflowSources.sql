CREATE TABLE [dbo].[ContentWorkflowSources]
(
[SourceID] [int] NOT NULL IDENTITY(1, 1),
[WorkflowID] [int] NOT NULL,
[SourceName] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SourceType] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowSources] ADD CONSTRAINT [PK_ContentWorkflowSources] PRIMARY KEY CLUSTERED  ([SourceID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowSources] ADD CONSTRAINT [IX_ContentWorkflowSources] UNIQUE NONCLUSTERED  ([WorkflowID], [SourceName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowSources] ADD CONSTRAINT [FK_ContentWorkflowSources_ContentWorkflows] FOREIGN KEY ([WorkflowID]) REFERENCES [dbo].[ContentWorkflows] ([WorkflowID]) ON DELETE CASCADE
GO
