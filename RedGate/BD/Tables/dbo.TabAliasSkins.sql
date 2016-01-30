CREATE TABLE [dbo].[TabAliasSkins]
(
[TabAliasSkinId] [int] NOT NULL IDENTITY(1, 1),
[TabId] [int] NOT NULL,
[PortalAliasId] [int] NOT NULL,
[SkinSrc] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserId] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserId] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabAliasSkins] ADD CONSTRAINT [PK_TabAliasSkin] PRIMARY KEY CLUSTERED  ([TabAliasSkinId]) ON [PRIMARY]
GO
