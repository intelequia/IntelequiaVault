SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Dashboard_GetDashboardControlByPackageId]  
	@PackageID INT
AS
	SELECT *
	  FROM dbo.Dashboard_Controls
		WHERE PackageID = @PackageID AND PackageID <> -1
GO
