CREATE TABLE [dbo].[UserProfile]
(
[ProfileID] [int] NOT NULL IDENTITY(1, 1),
[UserID] [int] NOT NULL,
[PropertyDefinitionID] [int] NOT NULL,
[PropertyValue] [nvarchar] (3750) COLLATE Modern_Spanish_CI_AS NULL,
[PropertyText] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Visibility] [int] NOT NULL CONSTRAINT [DF__UserP__Visib__1352D76D] DEFAULT ((0)),
[LastUpdatedDate] [datetime] NOT NULL,
[ExtendedVisibility] [varchar] (400) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] ADD CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED  ([ProfileID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserProfile_LastUpdatedDate] ON [dbo].[UserProfile] ([LastUpdatedDate] DESC) INCLUDE ([UserID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserProfile_PropertyDefinitionID] ON [dbo].[UserProfile] ([PropertyDefinitionID]) INCLUDE ([ProfileID], [PropertyValue], [UserID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserProfile] ON [dbo].[UserProfile] ([UserID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserProfile_Visibility] ON [dbo].[UserProfile] ([UserID], [ProfileID]) INCLUDE ([ExtendedVisibility], [LastUpdatedDate], [PropertyDefinitionID], [PropertyText], [PropertyValue], [Visibility]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserProfile_UserID_PropertyDefinitionID] ON [dbo].[UserProfile] ([UserID], [PropertyDefinitionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] WITH NOCHECK ADD CONSTRAINT [FK_UserProfile_ProfilePropertyDefinition] FOREIGN KEY ([PropertyDefinitionID]) REFERENCES [dbo].[ProfilePropertyDefinition] ([PropertyDefinitionID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfile] ADD CONSTRAINT [FK_UserProfile_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
