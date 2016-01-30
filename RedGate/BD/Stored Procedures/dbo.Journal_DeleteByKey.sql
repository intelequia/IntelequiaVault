SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_DeleteByKey]
	@PortalId int,
	@ObjectKey nvarchar(255),
	@SoftDelete int = 0
	AS
	DECLARE @JournalId int
	SET @JournalId = (SELECT JournalId FROM dbo.[Journal] WHERE PortalId = @PortalId AND ObjectKey = @ObjectKey AND @ObjectKey <> '' AND ObjectKey IS NOT NULL)

	-- Hard Delete
	IF @JournalId > 0 AND @SoftDelete <> 1 
	BEGIN
		DELETE FROM dbo.[Journal_Security] WHERE JournalId = @JournalId
		DELETE FROM dbo.[Journal_Comments] WHERE JournalId = @JournalId
		DELETE FROM dbo.[Journal] WHERE JournalId = @JournalId
	END

	-- Soft Delete
	IF @JournalId > 0 AND @SoftDelete = 1 
	BEGIN
		UPDATE dbo.[Journal] SET IsDeleted = 1 WHERE JournalId = @JournalId
	END
GO
