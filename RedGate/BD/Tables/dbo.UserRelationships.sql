CREATE TABLE [dbo].[UserRelationships]
(
[UserRelationshipID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[RelatedUserID] [int] NOT NULL,
[RelationshipID] [int] NOT NULL,
[Status] [int] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationships_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationships_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRelationships] ADD CONSTRAINT [PK_UserRelationships] PRIMARY KEY CLUSTERED  ([UserRelationshipID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserRelationships_RelatedUserID] ON [dbo].[UserRelationships] ([RelatedUserID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserRelationships_UserID] ON [dbo].[UserRelationships] ([UserID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRelationships_UserID_RelatedUserID_RelationshipID] ON [dbo].[UserRelationships] ([UserID], [RelatedUserID], [RelationshipID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRelationships] ADD CONSTRAINT [FK_UserRelationships_Users_OnRelatedUser] FOREIGN KEY ([RelatedUserID]) REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRelationships] ADD CONSTRAINT [FK_UserRelationships_Relationships] FOREIGN KEY ([RelationshipID]) REFERENCES [dbo].[Relationships] ([RelationshipID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRelationships] ADD CONSTRAINT [FK_UserRelationships_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
GO
