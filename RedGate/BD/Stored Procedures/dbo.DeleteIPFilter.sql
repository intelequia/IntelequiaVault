SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteIPFilter]
	@IPFilterID	int
AS 
	BEGIN
		DELETE FROM dbo.IPFilter  
			WHERE IPFilterID = @IPFilterID
	END
GO