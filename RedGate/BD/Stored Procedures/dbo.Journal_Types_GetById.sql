SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Types_GetById]
@JournalTypeId int
AS
SELECT * from dbo.[Journal_Types] WHERE JournalTypeId = @JournalTypeId
GO
