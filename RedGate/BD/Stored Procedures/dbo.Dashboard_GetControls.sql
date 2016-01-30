SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Dashboard_GetControls] 
	@IsEnabled bit
AS
BEGIN
	IF @IsEnabled = 0 BEGIN
		SELECT *
		FROM dbo.[Dashboard_Controls]
		ORDER BY ViewOrder
	END
	ELSE BEGIN
		SELECT *
		FROM dbo.[Dashboard_Controls]
		WHERE IsEnabled = 1
		ORDER BY ViewOrder
	END
END
GO
