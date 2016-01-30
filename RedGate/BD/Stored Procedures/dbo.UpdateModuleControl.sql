SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateModuleControl]
	@ModuleControlId				int,
	@ModuleDefID					int,
	@ControlKey						nvarchar(50),
	@ControlTitle					nvarchar(50),
	@ControlSrc						nvarchar(256),
	@IconFile						nvarchar(100),
	@ControlType					int,
	@ViewOrder						int,
	@HelpUrl						nvarchar(200),
	@SupportsPartialRendering		bit,
	@SupportsPopUps					bit,
	@LastModifiedByUserID  			int

AS
	UPDATE dbo.ModuleControls
	SET    
		ModuleDefId = @ModuleDefId,
		ControlKey = @ControlKey,
		ControlTitle = @ControlTitle,
		ControlSrc = @ControlSrc,
		IconFile = @IconFile,
		ControlType = @ControlType,
		ViewOrder = ViewOrder,
		HelpUrl = @HelpUrl,
		SupportsPartialRendering = @SupportsPartialRendering,
		SupportsPopUps = @SupportsPopUps,
		LastModifiedByUserID = @LastModifiedByUserID,
		LastModifiedOnDate = getdate()
	WHERE  ModuleControlId = @ModuleControlId
GO
