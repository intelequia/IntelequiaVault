CREATE TABLE [dbo].[Relationships]
(
[RelationshipID] [int] NOT NULL IDENTITY(1, 1),
[RelationshipTypeID] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[PortalID] [int] NULL,
[UserID] [int] NULL,
[DefaultResponse] [int] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Relationships_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_Relationships_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Relationships] ADD CONSTRAINT [PK_Relationships] PRIMARY KEY CLUSTERED  ([RelationshipID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Relationships_UserID] ON [dbo].[Relationships] ([UserID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Relationships] ADD CONSTRAINT [FK_Relationships_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relationships] WITH NOCHECK ADD CONSTRAINT [FK_Relationships_RelationshipTypes] FOREIGN KEY ([RelationshipTypeID]) REFERENCES [dbo].[RelationshipTypes] ([RelationshipTypeID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relationships] ADD CONSTRAINT [FK_Relationships_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
