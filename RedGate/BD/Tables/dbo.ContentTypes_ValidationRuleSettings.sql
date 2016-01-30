CREATE TABLE [dbo].[ContentTypes_ValidationRuleSettings]
(
[ValidatorSettingID] [int] NOT NULL IDENTITY(1, 1),
[ValidationRuleID] [int] NOT NULL,
[SettingName] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_ValidationRuleSettings] ADD CONSTRAINT [PK_ContentTypes_ValidationRuleSettings] PRIMARY KEY CLUSTERED  ([ValidatorSettingID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_ValidationRuleSettings] ADD CONSTRAINT [FK_ContentTypes_ValidationRuleSettings_ContentTypes_ValidationRules] FOREIGN KEY ([ValidationRuleID]) REFERENCES [dbo].[ContentTypes_ValidationRules] ([ValidationRuleID])
GO
