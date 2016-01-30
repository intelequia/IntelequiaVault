CREATE TABLE [dbo].[aspnet_SchemaVersions]
(
[Feature] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CompatibleSchemaVersion] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[IsCurrentVersion] [bit] NOT NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[aspnet_SchemaVersions] ADD 
CONSTRAINT [PK__aspnet_S__5A1E6BC1D51926F0] PRIMARY KEY CLUSTERED  ([Feature], [CompatibleSchemaVersion]) ON [PRIMARY]
GO
