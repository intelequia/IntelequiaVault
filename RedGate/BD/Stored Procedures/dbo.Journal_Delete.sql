SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Delete]
	@JournalId int,
	@SoftDelete int = 0
	AS

	-- Hard Delete
	IF @SoftDelete <> 1 
	BEGIN
		DELETE FROM dbo.[Journal_Security] WHERE JournalId = @JournalId
		DELETE FROM dbo.[Journal_Comments] WHERE JournalId = @JournalId
		DELETE FROM dbo.[Journal] WHERE JournalId = @JournalId
	END

	-- Soft Delete
	IF @SoftDelete = 1 
	BEGIN
		UPDATE dbo.[Journal] SET IsDeleted = 1 WHERE JournalId = @JournalId
	END
GO
