CREATE TABLE [dbo].[CoreMessaging_UserPreferences]
(
[UserPreferenceId] [int] NOT NULL IDENTITY(1, 1),
[PortalId] [int] NOT NULL,
[UserId] [int] NOT NULL,
[MessagesEmailFrequency] [int] NOT NULL,
[NotificationsEmailFrequency] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoreMessaging_UserPreferences] ADD CONSTRAINT [PK_CoreMessaging_UserPreferences] PRIMARY KEY CLUSTERED  ([UserPreferenceId]) ON [PRIMARY]
GO
