SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteLegacyMessage]
    @MessageID int
AS
	DELETE FROM dbo.Messaging_Messages
	WHERE  [MessageID] = @MessageID
GO
