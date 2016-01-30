SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateSkinControl]
	
	@SkinControlID					int,
	@PackageID						int,
	@ControlKey						nvarchar(50),
	@ControlSrc						nvarchar(256),
	@SupportsPartialRendering		bit,
	@LastModifiedByUserID	int

AS
	UPDATE dbo.SkinControls
	SET    
		PackageID = @PackageID,
		ControlKey = @ControlKey,
		ControlSrc = @ControlSrc,
		SupportsPartialRendering = @SupportsPartialRendering,
 		[LastModifiedByUserID] = @LastModifiedByUserID,	
		[LastModifiedOnDate] = getdate()
	WHERE  SkinControlID = @SkinControlID
GO
