CREATE TABLE [dbo].[aspnet_Applications]
(
[ApplicationName] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NOT NULL,
[LoweredApplicationName] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ApplicationId] [uniqueidentifier] NOT NULL CONSTRAINT [DF__aspnet_Ap__Appli__76D69450] DEFAULT (newid()),
[Description] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD CONSTRAINT [UQ__aspnet_A__30910331E623800A] UNIQUE NONCLUSTERED  ([ApplicationName]) ON [PRIMARY]

GO
ALTER TABLE [dbo].[aspnet_Applications] ADD CONSTRAINT [UQ__aspnet_A__17477DE444E57F65] UNIQUE NONCLUSTERED  ([LoweredApplicationName]) ON [PRIMARY]

ALTER TABLE [dbo].[aspnet_Applications] ADD CONSTRAINT [PK__aspnet_A__C93A4C98235B9413] PRIMARY KEY NONCLUSTERED  ([ApplicationId]) ON [PRIMARY]

GO

CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] ([LoweredApplicationName]) ON [PRIMARY]
GO
