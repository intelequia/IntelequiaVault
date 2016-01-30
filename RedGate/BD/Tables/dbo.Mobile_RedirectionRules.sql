CREATE TABLE [dbo].[Mobile_RedirectionRules]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[RedirectionId] [int] NOT NULL,
[Capability] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Expression] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mobile_RedirectionRules] ADD CONSTRAINT [PK_Mobile_RedirectionRules] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mobile_RedirectionRules] ADD CONSTRAINT [FK_Mobile_RedirectionRules_Mobile_Redirections] FOREIGN KEY ([RedirectionId]) REFERENCES [dbo].[Mobile_Redirections] ([Id]) ON DELETE CASCADE
GO
