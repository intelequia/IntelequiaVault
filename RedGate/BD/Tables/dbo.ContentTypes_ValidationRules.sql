CREATE TABLE [dbo].[ContentTypes_ValidationRules]
(
[ValidationRuleID] [int] NOT NULL IDENTITY(1, 1),
[FieldDefinitionID] [int] NOT NULL,
[ValidatorTypeID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_ValidationRules] ADD CONSTRAINT [PK_ContentTypes_ValidationRules] PRIMARY KEY CLUSTERED  ([ValidationRuleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_ValidationRules] ADD CONSTRAINT [FK_ContentTypes_ValidationRules_ContentTypes_FieldDefinitions] FOREIGN KEY ([FieldDefinitionID]) REFERENCES [dbo].[ContentTypes_FieldDefinitions] ([FieldDefinitionID])
GO
ALTER TABLE [dbo].[ContentTypes_ValidationRules] ADD CONSTRAINT [FK_ContentTypes_ValidationRules_ContentTypes_ValidatorTypes] FOREIGN KEY ([ValidatorTypeID]) REFERENCES [dbo].[ContentTypes_ValidatorTypes] ([ValidatorTypeID])
GO
