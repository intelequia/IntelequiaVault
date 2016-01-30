CREATE TABLE [dbo].[HtmlTextUsers]
(
[HtmlTextUserID] [int] NOT NULL IDENTITY(1, 1),
[ItemID] [int] NOT NULL,
[StateID] [int] NOT NULL,
[ModuleID] [int] NOT NULL,
[TabID] [int] NOT NULL,
[UserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HtmlTextUsers] ADD CONSTRAINT [PK_HtmlTextUsers] PRIMARY KEY CLUSTERED  ([HtmlTextUserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HtmlTextUsers] WITH NOCHECK ADD CONSTRAINT [FK_HtmlTextUsers_HtmlText] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[HtmlText] ([ItemID]) ON DELETE CASCADE
GO
