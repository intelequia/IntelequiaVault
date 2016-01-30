CREATE TABLE [dbo].[ContentTypes_ValidatorTypes]
(
[ValidatorTypeID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ValidatorClassName] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ErrorKey] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[ErrorMessage] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContentTypes_ValidatorTypes] ADD CONSTRAINT [PK_ContentTypes_ValidatorTypes] PRIMARY KEY CLUSTERED  ([ValidatorTypeID]) ON [PRIMARY]
GO
