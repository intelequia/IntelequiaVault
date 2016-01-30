CREATE TABLE [dbo].[Journal_TypeFilters]
(
[JournalTypeFilterId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[ModuleId] [int] NOT NULL,
[JournalTypeId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_TypeFilters] ADD CONSTRAINT [PK_Journal_TypeFilters] PRIMARY KEY CLUSTERED  ([JournalTypeFilterId]) ON [PRIMARY]
GO
