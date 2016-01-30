CREATE TABLE [dbo].[Journal_Types]
(
[JournalTypeId] [int] NOT NULL,
[JournalType] [nvarchar] (25) COLLATE Modern_Spanish_CI_AS NULL,
[icon] [nvarchar] (25) COLLATE Modern_Spanish_CI_AS NULL,
[PortalId] [int] NOT NULL CONSTRAINT [DF_JournalTypes_PortalId] DEFAULT ((-1)),
[IsEnabled] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_IsEnabled] DEFAULT ((1)),
[AppliesToProfile] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_AppliesToProfile] DEFAULT ((1)),
[AppliesToGroup] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_AppliesToGroup] DEFAULT ((1)),
[AppliesToStream] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_AppliesToStream] DEFAULT ((1)),
[Options] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[SupportsNotify] [bit] NOT NULL CONSTRAINT [DF_JournalTypes_SupportsNotify] DEFAULT ((0)),
[EnableComments] [bit] NOT NULL CONSTRAINT [DF_Journal_Types_EnableComments] DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_Types] ADD CONSTRAINT [PK_JournalTypes] PRIMARY KEY CLUSTERED  ([JournalTypeId]) ON [PRIMARY]
GO
