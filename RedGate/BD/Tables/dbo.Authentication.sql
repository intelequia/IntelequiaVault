CREATE TABLE [dbo].[Authentication]
(
[AuthenticationID] [int] NOT NULL IDENTITY(1, 1),
[PackageID] [int] NOT NULL CONSTRAINT [DF__Authe__Packa__43F60EC8] DEFAULT ((-1)),
[AuthenticationType] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[IsEnabled] [bit] NOT NULL CONSTRAINT [DF_Authentication_IsEnabled] DEFAULT ((0)),
[SettingsControlSrc] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LoginControlSrc] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LogoffControlSrc] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authentication] ADD CONSTRAINT [PK_Authentication] PRIMARY KEY CLUSTERED  ([AuthenticationID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authentication] WITH NOCHECK ADD CONSTRAINT [FK_Authentication_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
