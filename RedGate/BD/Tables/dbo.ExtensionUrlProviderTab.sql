CREATE TABLE [dbo].[ExtensionUrlProviderTab]
(
[ExtensionUrlProviderID] [int] NOT NULL,
[PortalID] [int] NOT NULL,
[TabID] [int] NOT NULL,
[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExtensionUrlProviderTab] ADD CONSTRAINT [PK_ExtensionUrlProviderTab] PRIMARY KEY CLUSTERED  ([ExtensionUrlProviderID], [PortalID], [TabID]) ON [PRIMARY]
GO
