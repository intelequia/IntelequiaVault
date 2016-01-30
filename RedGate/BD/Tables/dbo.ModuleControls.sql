CREATE TABLE [dbo].[ModuleControls]
(
[ModuleControlID] [int] NOT NULL IDENTITY(1, 1),
[ModuleDefID] [int] NULL,
[ControlKey] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ControlTitle] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ControlSrc] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[IconFile] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[ControlType] [int] NOT NULL,
[ViewOrder] [int] NULL,
[HelpUrl] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[SupportsPartialRendering] [bit] NOT NULL CONSTRAINT [DF_ModuleControls_SupportsPartialRendering] DEFAULT ((0)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[SupportsPopUps] [bit] NOT NULL CONSTRAINT [DF_ModuleControls_SupportsPopUps] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleControls] ADD CONSTRAINT [PK_ModuleControls] PRIMARY KEY CLUSTERED  ([ModuleControlID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleControls] ADD CONSTRAINT [IX_ModuleControls] UNIQUE NONCLUSTERED  ([ModuleDefID], [ControlKey], [ControlSrc]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModuleControls_ControlKey_ViewOrder] ON [dbo].[ModuleControls] ([ControlKey], [ViewOrder]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleControls] ADD CONSTRAINT [FK_ModuleControls_ModuleDefinitions] FOREIGN KEY ([ModuleDefID]) REFERENCES [dbo].[ModuleDefinitions] ([ModuleDefID]) ON DELETE CASCADE
GO
