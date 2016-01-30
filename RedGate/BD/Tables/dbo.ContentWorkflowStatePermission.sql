CREATE TABLE [dbo].[ContentWorkflowStatePermission]
(
[WorkflowStatePermissionID] [int] NOT NULL IDENTITY(1, 1),
[StateID] [int] NOT NULL,
[PermissionID] [int] NOT NULL,
[AllowAccess] [bit] NOT NULL,
[RoleID] [int] NULL,
[UserID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowStatePermission] ADD CONSTRAINT [PK_ContentWorkflowStatePermission] PRIMARY KEY CLUSTERED  ([WorkflowStatePermissionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowStatePermission] ADD CONSTRAINT [IX_ContentWorkflowStatePermission] UNIQUE NONCLUSTERED  ([StateID], [PermissionID], [RoleID], [UserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentWorkflowStatePermission] ADD CONSTRAINT [FK_ContentWorkflowStatePermission_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentWorkflowStatePermission] ADD CONSTRAINT [FK_ContentWorkflowStatePermission_ContentWorkflowStates] FOREIGN KEY ([StateID]) REFERENCES [dbo].[ContentWorkflowStates] ([StateID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentWorkflowStatePermission] ADD CONSTRAINT [FK_ContentWorkflowStatePermission_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
