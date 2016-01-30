SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetUrlLog]
	@URLTrackingID Int,
	@StartDate DateTime,
	@EndDate DateTime
AS
	BEGIN
		SELECT 
			L.*,
			dbo.[UserDisplayname](L.UserId) AS 'FullName'
		FROM dbo.UrlLog L
			INNER JOIN dbo. UrlTracking T ON L.UrlTrackingId = T.UrlTrackingId
		WHERE L.UrlTrackingID = @UrlTrackingID
			AND ((ClickDate >= @StartDate) OR @StartDate Is Null)
			AND ((ClickDate <= @EndDate ) OR @EndDate Is Null)
		ORDER BY ClickDate
	END
GO
