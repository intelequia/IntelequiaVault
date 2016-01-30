SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MoveTabModule]
	@FromTabId				int,
	@ModuleId				int,
	@ToTabId				int,
	@PaneName				nvarchar(50),
	@LastModifiedByUserID	int

AS
	UPDATE dbo.TabModules
		SET 
			TabId = @ToTabId,   
			ModuleOrder = -1,
			PaneName = @PaneName,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate()
		WHERE  TabId = @FromTabId
		AND    ModuleId = @ModuleId
GO
