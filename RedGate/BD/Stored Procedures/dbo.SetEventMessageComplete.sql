SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SetEventMessageComplete]
	
	@EventMessageID int

AS
	UPDATE dbo.EventQueue
		SET IsComplete = 1
	WHERE EventMessageID = @EventMessageID
GO
