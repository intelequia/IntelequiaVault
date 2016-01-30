SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Dashboard_GetDashboardControlByKey]  
	@DashboardControlKey nvarchar(50)
AS
	
	SELECT *
	  FROM dbo.Dashboard_Controls
		WHERE DashboardControlKey = @DashboardControlKey
GO
