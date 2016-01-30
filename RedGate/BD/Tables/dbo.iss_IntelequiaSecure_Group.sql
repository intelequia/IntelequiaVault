CREATE TABLE [dbo].[iss_IntelequiaSecure_Group]
(
[ResourceGroupId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Group_ResourceGroupId] DEFAULT (newid()),
[ResourceName] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NOT NULL,
[PortalId] [int] NOT NULL,
[Cd] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Group_Cd] DEFAULT (getdate()),
[Cu] [int] NOT NULL,
[Md] [datetime] NOT NULL CONSTRAINT [DF_iss_IntelequiaSecure_Group_Md] DEFAULT (getdate()),
[Mu] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[iss_IntelequiaSecure_Group] ADD CONSTRAINT [PK_iss_IntelequiaSecure_Group] PRIMARY KEY CLUSTERED  ([ResourceGroupId]) ON [PRIMARY]
GO
