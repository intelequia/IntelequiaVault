CREATE TABLE [dbo].[UrlLog]
(
[UrlLogID] [int] NOT NULL IDENTITY(1, 1),
[UrlTrackingID] [int] NOT NULL,
[ClickDate] [datetime] NOT NULL,
[UserID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UrlLog] ADD CONSTRAINT [PK_UrlLog] PRIMARY KEY CLUSTERED  ([UrlLogID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UrlLog] ADD CONSTRAINT [FK_UrlLog_UrlTracking] FOREIGN KEY ([UrlTrackingID]) REFERENCES [dbo].[UrlTracking] ([UrlTrackingID]) ON DELETE CASCADE
GO
