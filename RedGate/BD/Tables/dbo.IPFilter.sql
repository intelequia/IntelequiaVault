CREATE TABLE [dbo].[IPFilter]
(
[IPFilterID] [int] NOT NULL IDENTITY(1, 1),
[IPAddress] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[SubnetMask] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[RuleType] [tinyint] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IPFilter] ADD CONSTRAINT [PK_IPFilter] PRIMARY KEY CLUSTERED  ([IPFilterID]) ON [PRIMARY]
GO
