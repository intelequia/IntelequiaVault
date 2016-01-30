SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddModuleControl]
	
	@ModuleDefID                int,
	@ControlKey                 nvarchar(50),
	@ControlTitle               nvarchar(50),
	@ControlSrc                 nvarchar(256),
	@IconFile                   nvarchar(100),
	@ControlType                int,
	@ViewOrder                  int,
	@HelpUrl                    nvarchar(200),
	@SupportsPartialRendering   bit,
	@SupportsPopUps				bit,
	@CreatedByUserID			int

AS
	INSERT INTO dbo.ModuleControls (
		ModuleDefID,
		ControlKey,
		ControlTitle,
		ControlSrc,
		IconFile,
		ControlType,
		ViewOrder,
		HelpUrl,
		SupportsPartialRendering,
		SupportsPopUps,
		CreatedByUserID,
		CreatedOnDate,
		LastModifiedByUserID,
		LastModifiedOnDate
	)
	VALUES (
		@ModuleDefID,
		@ControlKey,
		@ControlTitle,
		@ControlSrc,
		@IconFile,
		@ControlType,
		@ViewOrder,
		@HelpUrl,
		@SupportsPartialRendering,
		@SupportsPopUps,
		@CreatedByUserID,
		getdate(),
		@CreatedByUserID,
		getdate()
	)

	SELECT SCOPE_IDENTITY()
GO
