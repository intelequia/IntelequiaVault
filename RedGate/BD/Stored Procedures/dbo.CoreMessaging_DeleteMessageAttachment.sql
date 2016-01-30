SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteMessageAttachment]
    @MessageAttachmentID int
AS
	DELETE FROM dbo.CoreMessaging_MessageAttachments
	WHERE  [MessageAttachmentID] = @MessageAttachmentID
GO
