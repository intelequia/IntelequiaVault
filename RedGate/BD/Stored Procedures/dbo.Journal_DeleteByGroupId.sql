SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_DeleteByGroupId]
	@PortalId int,
	@GroupId int,
	@SoftDelete int = 0
	AS

	-- Hard Delete
	IF @SoftDelete <> 1 
	BEGIN
		DELETE dbo.[Journal_Security] 
		FROM dbo.[Journal_Security] as js  INNER JOIN dbo.[Journal] as j 
		   ON js.JournalId = j.JournalId
		WHERE j.PortalId = @PortalId AND j.GroupId = @GroupId AND @GroupId > 0 AND j.GroupId IS NOT NULL

		DELETE dbo.[Journal_Comments] 
		FROM dbo.[Journal_Comments] as jc  INNER JOIN dbo.[Journal] as j 
		   ON jc.JournalId = j.JournalId
		WHERE j.PortalId = @PortalId AND j.GroupId = @GroupId AND @GroupId > 0 AND j.GroupId IS NOT NULL

		DELETE FROM dbo.[Journal] WHERE PortalId = @PortalId AND GroupId = @GroupId AND @GroupId > 0 AND GroupId IS NOT NULL
	END

	-- Soft Delete
	IF @SoftDelete = 1 
	BEGIN
		UPDATE dbo.[Journal] SET IsDeleted = 1 WHERE PortalId = @PortalId AND GroupId = @GroupId AND @GroupId > 0 AND GroupId IS NOT NULL
	END
GO
