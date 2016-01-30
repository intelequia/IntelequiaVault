CREATE TABLE [dbo].[RelationshipTypes]
(
[RelationshipTypeID] [int] NOT NULL IDENTITY(1, 1),
[Direction] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RelationshipTypes_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL CONSTRAINT [DF_RelationshipTypes_LastModifiedOnDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RelationshipTypes] ADD CONSTRAINT [PK_RelationshipTypes] PRIMARY KEY CLUSTERED  ([RelationshipTypeID]) ON [PRIMARY]
GO
