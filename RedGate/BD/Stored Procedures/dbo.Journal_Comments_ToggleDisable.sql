SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Comments_ToggleDisable]
@PortalId int,
@JournalId int,
@Disabled bit
AS
UPDATE dbo.[Journal]
	SET CommentsDisabled = @Disabled
	WHERE PortalId = @PortalId AND JournalId = @JournalId
GO
