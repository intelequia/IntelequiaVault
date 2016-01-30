SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Types_Delete]
@JournalTypeId int,
@PortalId int
AS
IF @JournalTypeId > 200
	BEGIN
		DELETE FROM dbo.[Journal_Security]
		WHERE JournalId IN (SELECT JournalId FROM dbo.[Journal] WHERE JournalTypeId=@JournalTypeId AND PortalId=@PortalId)
		DELETE FROM dbo.[Journal]
		WHERE 
			JournalTypeId = @JournalTypeId 
			AND 
			PortalId = @PortalId
		DELETE FROM dbo.[Journal_TypeFilters]
		WHERE
			JournalTypeId = @JournalTypeId
			AND 
			PortalId = @PortalId
		DELETE FROM dbo.[Journal_Types]
		WHERE 
			JournalTypeId = @JournalTypeId
			AND
			PortalId = @PortalId
	END
GO
