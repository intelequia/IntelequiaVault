SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Dashboard_DeleteControl]  
	@DashboardControlID int
AS
	DELETE dbo.Dashboard_Controls 
	WHERE DashboardControlID = @DashboardControlID
GO
