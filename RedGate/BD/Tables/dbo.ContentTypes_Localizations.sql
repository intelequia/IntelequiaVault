CREATE TABLE [dbo].[ContentTypes_Localizations]
(
[LocalizationID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[CultureCode] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Key] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Value] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_Localizations] ADD CONSTRAINT [PK_ContentTypes_Localizations] PRIMARY KEY CLUSTERED  ([LocalizationID]) ON [PRIMARY]
GO
