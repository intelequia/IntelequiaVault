CREATE TABLE [dbo].[HtmlTextLog]
(
[HtmlTextLogID] [int] NOT NULL IDENTITY(1, 1),
[ItemID] [int] NOT NULL,
[StateID] [int] NOT NULL,
[Comment] [nvarchar] (4000) COLLATE Modern_Spanish_CI_AS NULL,
[Approved] [bit] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HtmlTextLog] ADD CONSTRAINT [PK_HtmlTextLog] PRIMARY KEY CLUSTERED  ([HtmlTextLogID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HtmlTextLog_ItemID] ON [dbo].[HtmlTextLog] ([ItemID]) INCLUDE ([HtmlTextLogID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HtmlTextLog] WITH NOCHECK ADD CONSTRAINT [FK_HtmlTextLog_HtmlText] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[HtmlText] ([ItemID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HtmlTextLog] WITH NOCHECK ADD CONSTRAINT [FK_HtmlTextLog_WorkflowStates] FOREIGN KEY ([StateID]) REFERENCES [dbo].[WorkflowStates] ([StateID])
GO
