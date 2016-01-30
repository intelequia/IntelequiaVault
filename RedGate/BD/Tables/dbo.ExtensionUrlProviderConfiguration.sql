CREATE TABLE [dbo].[ExtensionUrlProviderConfiguration]
(
[ExtensionUrlProviderID] [int] NOT NULL,
[PortalID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExtensionUrlProviderConfiguration] ADD CONSTRAINT [PK_ExtensionUrlProviderConfiguration] PRIMARY KEY CLUSTERED  ([ExtensionUrlProviderID], [PortalID]) ON [PRIMARY]
GO
