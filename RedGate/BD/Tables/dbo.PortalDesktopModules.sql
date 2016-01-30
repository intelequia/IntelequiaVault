CREATE TABLE [dbo].[PortalDesktopModules]
(
[PortalDesktopModuleID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[DesktopModuleID] [int] NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalDesktopModules] ADD CONSTRAINT [PK_PortalDesktopModules] PRIMARY KEY CLUSTERED  ([PortalDesktopModuleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalDesktopModules] ADD CONSTRAINT [IX_PortalDesktopModules] UNIQUE NONCLUSTERED  ([PortalID], [DesktopModuleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalDesktopModules] WITH NOCHECK ADD CONSTRAINT [FK_PortalDesktopModules_DesktopModules] FOREIGN KEY ([DesktopModuleID]) REFERENCES [dbo].[DesktopModules] ([DesktopModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PortalDesktopModules] ADD CONSTRAINT [FK_PortalDesktopModules_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
