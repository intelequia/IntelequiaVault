SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Dashboard_UpdateControl]  

	@DashboardControlID 				INT,
	@DashboardControlKey 				NVARCHAR(50),
	@IsEnabled							BIT,
	@DashboardControlSrc				NVARCHAR(250),
	@DashboardControlLocalResources 	NVARCHAR(250),
	@ControllerClass					NVARCHAR(250),
	@ViewOrder							INT

AS
    DECLARE @OldOrder INT
    SELECT @OldOrder = ViewOrder FROM dbo.Dashboard_Controls WHERE DashboardControlID = @DashboardControlID
	UPDATE dbo.Dashboard_Controls 
		SET DashboardControlKey = @DashboardControlKey,
			IsEnabled = @IsEnabled,
			DashboardControlSrc = @DashboardControlSrc,
			DashboardControlLocalResources = @DashboardControlLocalResources,
			ControllerClass = @ControllerClass,
			ViewOrder = @ViewOrder
	WHERE DashboardControlID = @DashboardControlID

    IF @OldOrder IS NOT NULL AND @OldOrder < @ViewOrder
	BEGIN
		UPDATE dbo.Dashboard_Controls SET ViewOrder = ViewOrder - 1 WHERE ViewOrder BETWEEN @OldOrder AND @ViewOrder AND DashboardControlID <> @DashboardControlID
	END
    ELSE IF @OldOrder IS NOT NULL AND @OldOrder > @ViewOrder
    BEGIN
		UPDATE dbo.Dashboard_Controls SET ViewOrder = ViewOrder + 1 WHERE ViewOrder BETWEEN @ViewOrder AND @OldOrder AND DashboardControlID <> @DashboardControlID
	END
GO
