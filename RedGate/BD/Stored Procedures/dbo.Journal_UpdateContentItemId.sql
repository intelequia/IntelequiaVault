SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_UpdateContentItemId]
@JournalId int,
@ContentItemId int
AS
UPDATE dbo.[Journal]
	SET ContentItemId = @ContentItemId
WHERE JournalId = @JournalId
GO
