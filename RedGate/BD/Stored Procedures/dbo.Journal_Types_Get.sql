SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Types_Get]
@JournalType nvarchar(25)
AS
SELECT * from dbo.[Journal_Types] WHERE JournalType = @JournalType
GO
