SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Comments_ToggleHidden]
@PortalId int,
@JournalId int,
@Hidden bit
AS
UPDATE dbo.[Journal]
	SET CommentsHidden = @Hidden
	WHERE PortalId = @PortalId AND JournalId = @JournalId
GO
