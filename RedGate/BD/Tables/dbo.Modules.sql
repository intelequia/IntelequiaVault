CREATE TABLE [dbo].[Modules]
(
[ModuleID] [int] NOT NULL IDENTITY(0, 1),
[ModuleDefID] [int] NOT NULL,
[AllTabs] [bit] NOT NULL CONSTRAINT [DF_Modules_AllTabs] DEFAULT ((0)),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Modules_IsDeleted] DEFAULT ((0)),
[InheritViewPermissions] [bit] NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[PortalID] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL CONSTRAINT [DF_Modules_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL CONSTRAINT [DF_Modules_LastModifiedOnDate] DEFAULT (getdate()),
[LastContentModifiedOnDate] [datetime] NULL,
[ContentItemID] [int] NULL,
[IsShareable] [bit] NOT NULL CONSTRAINT [DF_Modules_IsShareable] DEFAULT ((1)),
[IsShareableViewOnly] [bit] NOT NULL CONSTRAINT [DF_Modules_IsShareableViewOnly] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Modules] ADD CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED  ([ModuleID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Modules_ModuleDefId] ON [dbo].[Modules] ([ModuleDefID]) INCLUDE ([ModuleID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Modules_PortalId] ON [dbo].[Modules] ([PortalID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Modules] ADD CONSTRAINT [FK_Modules_ContentItems] FOREIGN KEY ([ContentItemID]) REFERENCES [dbo].[ContentItems] ([ContentItemID])
GO
ALTER TABLE [dbo].[Modules] ADD CONSTRAINT [FK_Modules_ModuleDefinitions] FOREIGN KEY ([ModuleDefID]) REFERENCES [dbo].[ModuleDefinitions] ([ModuleDefID]) ON DELETE CASCADE
GO
