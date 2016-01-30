CREATE TABLE [dbo].[ContentWorkflows]
(
[WorkflowID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[WorkflowName] [nvarchar] (40) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_ContentWorkflows_IsDeleted] DEFAULT ((0)),
[StartAfterCreating] [bit] NOT NULL CONSTRAINT [DF_ContentWorkflows_StartAfterCreating] DEFAULT ((1)),
[StartAfterEditing] [bit] NOT NULL CONSTRAINT [DF_ContentWorkflows_StartAfterEditing] DEFAULT ((1)),
[DispositionEnabled] [bit] NOT NULL CONSTRAINT [DF_ContentWorkflows_DispositionEnabled] DEFAULT ((0)),
[IsSystem] [bit] NOT NULL CONSTRAINT [DF__ContentWo__IsSys__62EF9734] DEFAULT ((0)),
[WorkflowKey] [nvarchar] (40) COLLATE Modern_Spanish_CI_AS NOT NULL CONSTRAINT [DF__ContentWo__Workf__67B44C51] DEFAULT (N'')
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflows] ADD CONSTRAINT [PK_ContentWorkflows] PRIMARY KEY CLUSTERED  ([WorkflowID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflows] ADD CONSTRAINT [IX_ContentWorkflows] UNIQUE NONCLUSTERED  ([PortalID], [WorkflowName]) ON [PRIMARY]
GO
