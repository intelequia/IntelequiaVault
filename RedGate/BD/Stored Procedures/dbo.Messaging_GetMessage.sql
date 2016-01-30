SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Messaging_GetMessage] 
	@MessageID bigint
AS
	SELECT * FROM Messaging_Messages WHERE MessageID = @MessageID
GO
