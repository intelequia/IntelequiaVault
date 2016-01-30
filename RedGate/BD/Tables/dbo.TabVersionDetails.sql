CREATE TABLE [dbo].[TabVersionDetails]
(
[TabVersionDetailId] [int] NOT NULL IDENTITY(1, 1),
[TabVersionId] [int] NOT NULL,
[ModuleId] [int] NOT NULL,
[ModuleVersion] [int] NOT NULL,
[PaneName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ModuleOrder] [int] NOT NULL,
[Action] [int] NOT NULL,
[CreatedByUserID] [int] NOT NULL,
[CreatedOnDate] [datetime] NOT NULL,
[LastModifiedByUserID] [int] NOT NULL,
[LastModifiedOnDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabVersionDetails] ADD CONSTRAINT [PK_TabVersionDetails] PRIMARY KEY CLUSTERED  ([TabVersionDetailId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabVersionDetails] ADD CONSTRAINT [IX_TabVersionDetails_Unique(TabVersionId_ModuleId)] UNIQUE NONCLUSTERED  ([TabVersionId], [ModuleId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TabVersionDetails_TabVersionId] ON [dbo].[TabVersionDetails] ([TabVersionId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabVersionDetails] ADD CONSTRAINT [FK_TabVersionDetails_TabVersionId] FOREIGN KEY ([TabVersionId]) REFERENCES [dbo].[TabVersions] ([TabVersionId]) ON DELETE CASCADE
GO
