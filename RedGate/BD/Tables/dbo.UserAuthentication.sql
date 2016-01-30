CREATE TABLE [dbo].[UserAuthentication]
(
[UserAuthenticationID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[AuthenticationType] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[AuthenticationToken] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAuthentication] ADD CONSTRAINT [PK_UserAuthentication] PRIMARY KEY CLUSTERED  ([UserAuthenticationID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserAuthentication] ON [dbo].[UserAuthentication] ([UserID], [AuthenticationType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserAuthentication] ADD CONSTRAINT [FK_UserAuthentication_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
