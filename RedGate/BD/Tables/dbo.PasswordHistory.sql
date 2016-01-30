CREATE TABLE [dbo].[PasswordHistory]
(
[PasswordHistoryID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[Password] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PasswordSalt] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PasswordHistory] ADD CONSTRAINT [PK_PasswordHistory] PRIMARY KEY CLUSTERED  ([PasswordHistoryID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PasswordHistory] ADD CONSTRAINT [FK_PasswordHistory_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
