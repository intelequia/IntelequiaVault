SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Dashboard_AddControl]  
	@PackageId							INT,
	@DashboardControlKey 				NVARCHAR(50),
	@IsEnabled							BIT,
	@DashboardControlSrc				NVARCHAR(250),
	@DashboardControlLocalResources 	NVARCHAR(250),
	@ControllerClass					NVARCHAR(250),
	@ViewOrder							INT

AS
	IF @ViewOrder = -1
		SET @ViewOrder = (SELECT TOP 1 ViewOrder FROM Dashboard_Controls ORDER BY ViewOrder DESC) + 1

    IF EXISTS(SELECT DashboardControlID FROM dbo.Dashboard_Controls WHERE ViewOrder = @ViewOrder)
	BEGIN
		UPDATE dbo.Dashboard_Controls SET ViewOrder = ViewOrder + 1 WHERE ViewOrder >= @ViewOrder
	END

	INSERT INTO dbo.Dashboard_Controls (
		PackageId,
		DashboardControlKey,
		IsEnabled,
		DashboardControlSrc,
		DashboardControlLocalResources,
		ControllerClass,
		ViewOrder
	)
	VALUES (
		@PackageId,
		@DashboardControlKey,
		@IsEnabled,
		@DashboardControlSrc,
		@DashboardControlLocalResources,
		@ControllerClass,
		@ViewOrder
	)

	SELECT SCOPE_IDENTITY()
GO
