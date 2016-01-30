SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_DeleteMessage]
	@MessageID int
AS
	DELETE FROM dbo.CoreMessaging_Messages
	WHERE  [MessageID] = @MessageID
GO
