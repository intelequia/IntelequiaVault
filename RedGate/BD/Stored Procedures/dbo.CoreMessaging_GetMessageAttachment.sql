SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetMessageAttachment]
    @MessageAttachmentID INT
AS
	SELECT [MessageID], [FileID], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]
	FROM   dbo.CoreMessaging_MessageAttachments
	WHERE  [MessageAttachmentID] = @MessageAttachmentID
GO
