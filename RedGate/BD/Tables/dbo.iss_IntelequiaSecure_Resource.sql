CREATE TABLE [dbo].[iss_IntelequiaSecure_Resource]
(
[ResourceId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Resource_ResourceId] DEFAULT (newid()),
[ResourceGroupId] [uniqueidentifier] NOT NULL,
[ResourceKey] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ResourceValue] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Cd] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Resource_Cd] DEFAULT (getdate()),
[Cu] [int] NOT NULL,
[Md] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Resource_Md] DEFAULT (getdate()),
[Mu] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Resource] ADD CONSTRAINT [PK_iss_IntelequiaSecure_Resource] PRIMARY KEY CLUSTERED  ([ResourceId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Resource] ADD CONSTRAINT [FK_iss_IntelequiaSecure_Resource_iss_IntelequiaSecure_Group] FOREIGN KEY ([ResourceGroupId]) REFERENCES [dbo].[iss_IntelequiaSecure_Group] ([ResourceGroupId]) ON DELETE CASCADE
GO
