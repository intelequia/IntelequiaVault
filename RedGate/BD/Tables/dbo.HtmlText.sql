CREATE TABLE [dbo].[HtmlText]
(
[ModuleID] [int] NOT NULL,
[ItemID] [int] NOT NULL IDENTITY(1, 1),
[Content] [ntext] COLLATE Modern_Spanish_CI_AS NULL,
[Version] [int] NULL,
[StateID] [int] NULL,
[IsPublished] [bit] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[Summary] [ntext] COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[HtmlText] ADD CONSTRAINT [PK_HtmlText] PRIMARY KEY CLUSTERED  ([ItemID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HtmlText_ModuleID_Version] ON [dbo].[HtmlText] ([ModuleID], [Version]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HtmlText] WITH NOCHECK ADD CONSTRAINT [FK_HtmlText_Modules] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Modules] ([ModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HtmlText] WITH NOCHECK ADD CONSTRAINT [FK_HtmlText_WorkflowStates] FOREIGN KEY ([StateID]) REFERENCES [dbo].[WorkflowStates] ([StateID])
GO
