CREATE TABLE [dbo].[TabVersions]
(
[TabVersionId] [int] NOT NULL IDENTITY(1, 1),
[TabId] [int] NOT NULL,
[Version] [int] NOT NULL,
[TimeStamp] [datetime] NOT NULL,
[IsPublished] [bit] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabVersions] ADD CONSTRAINT [PK_TabVersions] PRIMARY KEY CLUSTERED  ([TabVersionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabVersions] ADD CONSTRAINT [IX_TabVersions] UNIQUE NONCLUSTERED  ([TabId], [Version] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TabVersions_TabId] ON [dbo].[TabVersions] ([TabId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabVersions] ADD CONSTRAINT [FK_TabVersions_TabId] FOREIGN KEY ([TabId]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
