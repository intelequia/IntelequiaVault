CREATE TABLE [dbo].[WorkflowStates]
(
[StateID] [int] NOT NULL IDENTITY(1, 1),
[WorkflowID] [int] NOT NULL,
[StateName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Order] [int] NOT NULL,
[IsActive] [bit] NOT NULL,
[Notify] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkflowStates] ADD CONSTRAINT [PK_WorkflowStates] PRIMARY KEY CLUSTERED  ([StateID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WorkflowStates] ON [dbo].[WorkflowStates] ([WorkflowID], [StateName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkflowStates] WITH NOCHECK ADD CONSTRAINT [FK_WorkflowStates_Workflow] FOREIGN KEY ([WorkflowID]) REFERENCES [dbo].[Workflow] ([WorkflowID]) ON DELETE CASCADE
GO
