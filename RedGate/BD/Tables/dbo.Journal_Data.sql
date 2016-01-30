CREATE TABLE [dbo].[Journal_Data]
(
[JournalDataId] [int] NOT NULL IDENTITY(1, 1),
[JournalId] [int] NOT NULL,
[JournalXML] [xml] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_Data] ADD CONSTRAINT [PK_Journal_Data] PRIMARY KEY CLUSTERED  ([JournalDataId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Journal_Data] WITH NOCHECK ADD CONSTRAINT [FK_Journal_Data_Journal] FOREIGN KEY ([JournalId]) REFERENCES [dbo].[Journal] ([JournalId]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Journal_Data] NOCHECK CONSTRAINT [FK_Journal_Data_Journal]
GO
