CREATE TABLE [dbo].[UserRelationshipPreferences]
(
[PreferenceID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[RelationshipID] [int] NOT NULL,
[DefaultResponse] [int] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationshipPreferences_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_UserRelationshipPreferences_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRelationshipPreferences] ADD CONSTRAINT [PK_UserRelationshipPreferences] PRIMARY KEY CLUSTERED  ([PreferenceID], [RelationshipID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRelationshipPreferences] ADD CONSTRAINT [FK_UserRelationshipPreferences_Relationships] FOREIGN KEY ([RelationshipID]) REFERENCES [dbo].[Relationships] ([RelationshipID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRelationshipPreferences] ADD CONSTRAINT [FK_UserRelationshipPreferences_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID])
GO
