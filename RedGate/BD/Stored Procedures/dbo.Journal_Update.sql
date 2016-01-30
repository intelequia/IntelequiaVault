SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Update]
@PortalId int,
@JournalId int,
@JournalTypeId int,
@UserId int,
@ProfileId int,
@GroupId int,
@Title nvarchar(255),
@Summary nvarchar(2000),
@ItemData nvarchar(2000),
@JournalXML xml,
@ObjectKey nvarchar(255),
@AccessKey uniqueidentifier,
@SecuritySet nvarchar(2000),
@CommentsDisabled bit,
@CommentsHidden bit
AS
UPDATE dbo.[Journal]
	SET 
		JournalTypeId = @JournalTypeId,
		UserId = @UserId,
		DateUpdated = GETUTCDATE(),
		PortalId = @PortalId,
		ProfileId = @ProfileId,
		GroupId = @GroupId,
		Title = @Title,
		Summary = @Summary,
		ObjectKey = @ObjectKey,
		AccessKey = @AccessKey,
		ItemData = @ItemData,
		CommentsHidden = @CommentsHidden,
		CommentsDisabled = @CommentsDisabled
	WHERE JournalId = @JournalId
IF @SecuritySet IS NOT NULL AND @SecuritySet <> ''
BEGIN
DELETE FROM dbo.[Journal_Security] WHERE JournalId = @JournalId
INSERT INTO dbo.[Journal_Security]
	(JournalId, SecurityKey) 
	SELECT @JournalId, string from dbo.[Journal_SplitText](@SecuritySet,',')
END
SELECT @JournalId
GO
